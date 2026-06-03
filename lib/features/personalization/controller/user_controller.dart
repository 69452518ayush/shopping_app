import 'dart:io';

import 'package:dio/dio.dart' as dio;
import 'package:ecommerce/data/repository/authentication_repository.dart';
import 'package:ecommerce/data/repository/user/user_repository.dart';
import 'package:ecommerce/features/authentication/models/user_model.dart';
import 'package:ecommerce/features/authentication/screens/onboarding/login/login.dart';
import 'package:ecommerce/features/personalization/screens/edit_profile/widgets/re_authenticate_user_form.dart';
import 'package:ecommerce/utils/constants/apis.dart';
import 'package:ecommerce/utils/constants/keys.dart';
import 'package:ecommerce/utils/constants/sizes.dart';
import 'package:ecommerce/utils/helpers/network_manager.dart';
import 'package:ecommerce/utils/popups/full_screen_loader.dart';
import 'package:ecommerce/utils/popups/snackbar_helpers.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class UserController extends GetxController {
  static UserController get instance => Get.find();

  /// Variable
  final _userRepository = Get.put(UserRepository());
  Rx<UserModel> user = UserModel.empty().obs;
  RxBool profileLoading = false.obs;
  RxBool isProfileUploading = false.obs;

  ///  Re_Authenticate Form Variables
  final email = TextEditingController();
  final password = TextEditingController();
  final reAuthFormKey = GlobalKey<FormState>();
  RxBool isPasswordVisible = false.obs;

  @override
  void onInit() {
    fetchUserDetails();
    super.onInit();
  }

  /// Function to save user record
  Future<void> saveUserRecord(UserCredential userCredential) async {
    try {
      // First update Rx Variable and then check if user data is already stored. If not then store

      await fetchUserDetails();

      if (user.value.id.isEmpty) {
        // Convert Full Name to First Name to last Name
        final nameParts = UserModel.nameParts(userCredential.user!.displayName);
        final username = '${userCredential.user!.displayName}730545';
        // Create User Model
        UserModel userModel = UserModel(
          id: userCredential.user!.uid,
          firstName: nameParts[0],
          lastName: nameParts.length > 1 ? nameParts.sublist(1).join('') : '',
          username: username,
          email: userCredential.user!.email ?? '',
          phoneNumber: userCredential.user!.phoneNumber ?? '',
          profilePicture: userCredential.user!.photoURL ?? '',
        );
        // Save User record
        await _userRepository.savedUserRecord(userModel);
      }
      /* // Convert Full Name to First Name to last Name
      final nameParts = UserModel.nameParts(userCredential.user!.displayName);
      final username = '${userCredential.user!.displayName}730545';
      // Create User Model
      UserModel userModel = UserModel(
        id: userCredential.user!.uid,
        firstName: nameParts[0],
        lastName: nameParts.length > 1 ? nameParts.sublist(1).join('') : '',
        username: username,
        email: userCredential.user!.email ?? '',
        phoneNumber: userCredential.user!.phoneNumber ?? '',
        profilePicture: userCredential.user!.photoURL ?? '',
      );*/
      /* // Save User record
      await _userRepository.savedUserRecord(userModel);*/
    } catch (e) {
      USnackBarHelpers.warningSnackBar(
        title: 'Data not sayed',
        message: ' Something went wrong while saying your information',
      );
    }
  }

  ///  Function to fetch user details
  Future<void> fetchUserDetails() async {
    try {
      profileLoading.value = true;
      UserModel user = await _userRepository.fetchUserDetails();
      this.user(user);
    } catch (e) {
      user(UserModel.empty());
    } finally {
      profileLoading.value = false;
    }
  }

  /// [Popup] - Popup To delete Account Confirmation
  void deleteAccountWarningPopup() {
    Get.defaultDialog(
      contentPadding: EdgeInsets.all(USizes.md),
      title: 'Delete Account',
      middleText: 'Are you want to delete account permanent ?',
      confirm: ElevatedButton(
        onPressed: () => deleteUserAccount(),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.red,
          side: BorderSide(color: Colors.red),
        ),
        child: Padding(padding: EdgeInsets.symmetric(horizontal: USizes.lg)),
      ),
      cancel: OutlinedButton(
        onPressed: () => Get.back(),
        child: Text('Cancel'),
      ),
    );
  }

  /// Delete Account
  Future<void> deleteUserAccount() async {
    try {
      // Start loading
      UFullScreenLoader.openLoadingDialog('Processing...');
      // Re-Authenticate
      final authRepository = AuthenticationRepository.instance;
      final provider = authRepository.currentUser!.providerData
          .map((e) => e.providerId)
          .first;
      // If google Provider
      if (provider == 'google.com') {
        await authRepository.signInWithGoogle();
        await authRepository.deleteAccount();
        UFullScreenLoader.stopLoading();
        Get.offAll(() => LoginScreen());

        // If Email And Password Provider
      } else if (provider == 'password') {
        UFullScreenLoader.stopLoading();
        Get.to(() => ReAuthenticateUserForm());
      }
    } catch (e) {
      UFullScreenLoader.stopLoading();
      USnackBarHelpers.errorSnackBar(title: 'Error', message: e.toString());
    }
  }

  /// ReAuthenticate User With Email And Password
  Future<void> reAuthenticateUser() async {
    try {
      // Start Loading
      UFullScreenLoader.openLoadingDialog('Processing...');
      // Check Internet Connectivity
      bool isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        UFullScreenLoader.stopLoading();
        return;
      }
      // Form Validation
      if (reAuthFormKey.currentState!.validate()) {
        UFullScreenLoader.stopLoading();
        return;
      }
      // Re Authenticate User with email and password
      await AuthenticationRepository.instance
          .reAuthenticateUserWithEmailAndPassword(
            email.text.trim(),
            password.text.trim(),
          );
      // Delete Account
      await AuthenticationRepository.instance.deleteAccount();
      UFullScreenLoader.stopLoading();
      Get.offAll(() => LoginScreen());
    } catch (e) {
      // Stop Loading
      UFullScreenLoader.stopLoading();
      USnackBarHelpers.errorSnackBar(title: 'Failed', message: e.toString());
    }
  }

  Future<void> updateUserProfilePicture() async {
    try {
      // start loading
      isProfileUploading.value = true;
      // Pick Image from Gallery
      XFile? image = await ImagePicker().pickImage(
        source: ImageSource.gallery,
        maxHeight: 512,
        maxWidth: 512,
      );
      if (image == null) return;
      // Convert XFile Picture,
      File file = File(image.path);
      // delete aur current profile picture
      if(user.value.publicId.isNotEmpty){
        await _userRepository.deleteProfilePicture(user.value.publicId);
      }
      // Upload profile Picture To Cloudinary
      dio.Response response = await _userRepository.uploadImage(file);
      if (response.statusCode == 200) {
        final data = response.data;
        final imageUrl = data['url'];
        final publicId = data['public_id'];
        // Upload profile picture from Fire Store
        await _userRepository.updateSingleField({'profilePicture': imageUrl});
        user.value.profilePicture = imageUrl;
        user.value.publicId = publicId;
        // Success Message
        USnackBarHelpers.successSnackBar(
          title: 'Congratulations',
          message: 'Profile picture Updated Successfully',
        );

        user.refresh();
      } else {
        throw 'Failed to upload profile picture. Please try again';
      }
    } catch (e) {
      USnackBarHelpers.errorSnackBar(title: 'Failed', message: e.toString());
    } finally{
      isProfileUploading.value = false;

    }
  }

}
