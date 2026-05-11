import 'package:ecommerce/data/repository/user/user_repository.dart';
import 'package:ecommerce/features/authentication/models/user_model.dart';
import 'package:ecommerce/utils/constants/sizes.dart';
import 'package:ecommerce/utils/popups/snackbar_helpers.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserController extends GetxController {
  static UserController get instance => Get.find();

  /// Variable
  final _userRepository = Get.put(UserRepository());
  Rx<UserModel> user = UserModel.empty().obs;
  RxBool profileLoading = false.obs;

  @override
  void onInit() {
    fetchUserDetails();
    super.onInit();
  }

  /// Function to save user record
  Future<void> saveUserRecord(UserCredential userCredential) async {
    try {
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

  void deleteAccountWarningPopup() {
    Get.defaultDialog(
      contentPadding: EdgeInsets.all(USizes.md),
      title: 'Delete Account',
      middleText: 'Are you want to delete account permanent ?',
      confirm: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(backgroundColor: Colors.red,side: BorderSide(color: Colors.red)),
        child: Padding(padding: EdgeInsets.symmetric(horizontal: USizes.lg)),
      ),
      cancel: OutlinedButton(
        onPressed: () => Get.back(),
        child: Text('Cancel'),
      ),
    );
  }
}
