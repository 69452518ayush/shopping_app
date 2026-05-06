import 'package:ecommerce/data/repository/authentication_repository.dart';
import 'package:ecommerce/data/repository/user/user_repository.dart';
import 'package:ecommerce/features/authentication/models/user_model.dart';
import 'package:ecommerce/features/authentication/screens/signup/verify_email.dart';
import 'package:ecommerce/utils/helpers/network_manager.dart';
import 'package:ecommerce/utils/popups/full_screen_loader.dart';
import 'package:ecommerce/utils/popups/snackbar_helpers.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController {
  static SignUpController get instance => Get.find();
  RxBool isPasswordVisible = false.obs;
  RxBool privacyPolicy = false.obs;

  /// Variable
  final signUpFormKey = GlobalKey<FormState>();
  final _authRepository = Get.put(AuthenticationRepository());
  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final email = TextEditingController();
  final phoneNumber = TextEditingController();
  final password = TextEditingController();

  /// functions to register the user with email and password
  Future<void> registerUser() async {
    try {
      // Start Loading
      UFullScreenLoader.openLoadingDialog(
        'We are processing your information...',
      );
      // Check internet Connectivity
      bool isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        UFullScreenLoader.stopLoading();
        USnackBarHelpers.warningSnackBar(title: 'No Internet Connection');
        return;
      }
      // Check Privacy Policy
      if (!privacyPolicy.value) {
        UFullScreenLoader.stopLoading();
        USnackBarHelpers.warningSnackBar(
          title: 'Accept Privacy Policy',
          message:
              'In order to create account , you must have to read and accept the Privacy  Policy & Terms of Use .',
        );
      }
      // Form Key Validation
      if (!signUpFormKey.currentState!.validate()) {
        return;
      }
      // Register the user using Firebase Authentication
      UserCredential userCredential = await AuthenticationRepository.instance
          .registerUser(email.text.trim(), password.text.trim());
      // Create user model
      UserModel userModel = UserModel(
        id: userCredential.user!.uid,
        firstName: firstName.text,
        lastName: lastName.text,
        username: '${firstName.text}${lastName.text}85264',
        email: email.text.trim(),
        phoneNumber: phoneNumber.text.trim(),
        profilePicture: '',
      );
      // Save User records
      final userRepository = Get.put(UserRepository());
      await userRepository.savedUserRecord(userModel);
      // Success message
      USnackBarHelpers.successSnackBar(
        title: 'Congratulations',
        message: 'Your account has been created! Verify your email  ',
      );
      // stop loading
      UFullScreenLoader.stopLoading();
      // redirect to verify email screen
      Get.to(() => VerifyEmailScreen(email: email.text,));
    } catch (e) {
      // stop loading
      UFullScreenLoader.stopLoading();
      // Error message
      USnackBarHelpers.errorSnackBar(title: 'Error', message: e.toString());
    }
  }
}
