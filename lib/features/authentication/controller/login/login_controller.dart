import 'package:ecommerce/data/repository/authentication_repository.dart';
import 'package:ecommerce/features/personalization/controller/user_controller.dart';
import 'package:ecommerce/utils/constants/keys.dart';
import 'package:ecommerce/utils/helpers/network_manager.dart';
import 'package:ecommerce/utils/popups/full_screen_loader.dart';
import 'package:ecommerce/utils/popups/snackbar_helpers.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:flutter/material.dart';

class LoginController extends GetxController {
  static LoginController get instance => Get.find();

  /// Variables
  final _userController = Get.put(UserController());
  final email = TextEditingController();
  final password = TextEditingController();
  RxBool rememberMe = false.obs;
  RxBool isPasswordVisible = false.obs;
  final loginFormKey = GlobalKey<FormState>();
  final localStorage = GetStorage();

  @override
  void onInit() {
    email.text = localStorage.read(UKeys.rememberMeEmail) ?? '';
    password.text = localStorage.read(UKeys.rememberMePassword) ?? '';
  }

  // Function to login the user with email and password
  Future<void> loginWithEmailAndPassword() async {
    try {
      // Start loading
      UFullScreenLoader.openLoadingDialog('Logging you in ...');
      // Check internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        UFullScreenLoader.stopLoading();
        USnackBarHelpers.warningSnackBar(title: 'No Internet Connection');
      }
      if (!loginFormKey.currentState!.validate()) {
        UFullScreenLoader.stopLoading();
        return;
      }
      // Save Data if remember me is checked
      if (rememberMe.value) {
        localStorage.write(UKeys.rememberMeEmail, email.text.trim());
        localStorage.write(UKeys.rememberMePassword, password.text.trim());
        // Login User with Email And Password
        await AuthenticationRepository.instance.loginWithEmailAndPassword(
          email.text.trim(),
          password.text.trim(),
        );
        // Stop Loading
        UFullScreenLoader.stopLoading();
        // Redirect
        AuthenticationRepository.instance.screenRedirect();
      }
    } catch (e) {
      UFullScreenLoader.stopLoading();
      USnackBarHelpers.errorSnackBar(
        title: 'Login Failed',
        message: e.toString(),
      );
    }
  }

  /// Google Sign In Method
  Future<void> googleSignIn() async {
    try {
      // Start loading
      UFullScreenLoader.openLoadingDialog('Loading You in ...');
      // Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if(!isConnected){
        UFullScreenLoader.stopLoading();
        USnackBarHelpers.warningSnackBar(title: 'No Internet Connection');
        return;
      }
      // Google Authentication
      UserCredential userCredential= await AuthenticationRepository.instance.signInWithGoogle();
      // Save User Record
       await _userController.saveUserRecord(userCredential);
      // Stop Loading
      UFullScreenLoader.stopLoading();
      // Redirect
      AuthenticationRepository.instance.screenRedirect();
    } catch (e) {
     // Stop loading
      UFullScreenLoader.stopLoading();
      // Error loading
      USnackBarHelpers.errorSnackBar(title: 'Login Failed',message: e.toString());
    }
  }
}
