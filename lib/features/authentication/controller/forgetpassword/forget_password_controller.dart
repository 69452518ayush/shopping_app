import 'package:ecommerce/data/repository/authentication_repository.dart';
import 'package:ecommerce/features/authentication/screens/foget_password/reset_password.dart';
import 'package:ecommerce/utils/helpers/network_manager.dart';
import 'package:ecommerce/utils/popups/full_screen_loader.dart';
import 'package:ecommerce/utils/popups/snackbar_helpers.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ForgetPasswordController extends GetxController {
  static ForgetPasswordController get instance => Get.find();

  /// variables
  final email = TextEditingController();
  final forgetPasswordFormKey = GlobalKey<FormState>();

  /// Send Email To Forget Password
  Future<void> sendPasswordResetEmail() async {
    try {
      // start loading
      UFullScreenLoader.openLoadingDialog('Processing your request...');
      // Check Internet Connectivity
      bool isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        UFullScreenLoader.stopLoading();
        USnackBarHelpers.warningSnackBar(title: 'No Internet Connection');
        return;
      }
      // Form Validation
      if (!forgetPasswordFormKey.currentState!.validate()) {
        UFullScreenLoader.stopLoading();
        return;
      }
      // Send Email To Reset Password

      AuthenticationRepository.instance.sendPasswordResetEmail(email.text);
      // Stop Loading
      UFullScreenLoader.stopLoading();
      // Success Message
      USnackBarHelpers.successSnackBar(
        title: 'Email Sent',
        message: 'Email Link Sent to Reset your Password',
      );

      // Redirect
      Get.to(() => ResetPasswordScreen(email: email.text.trim()));
    } catch (e) {
      UFullScreenLoader.stopLoading();
      USnackBarHelpers.errorSnackBar(
        title: 'Failed Forget Password',
        message: e.toString(),
      );
    }
  }

  Future<void> resendPasswordResetEmail() async {
    try {
      // start loading
      UFullScreenLoader.openLoadingDialog('Processing your request...');
      // Check Internet Connectivity
      bool isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        UFullScreenLoader.stopLoading();
        USnackBarHelpers.warningSnackBar(title: 'No Internet Connection');
        return;
      }

      // Send Email To Reset Password

      AuthenticationRepository.instance.sendPasswordResetEmail(email.text);
      // Stop Loading
      UFullScreenLoader.stopLoading();
      // Success Message
      USnackBarHelpers.successSnackBar(
        title: 'Email Sent',
        message: 'Email Link Sent to Reset your Password',
      );

      /*// Redirect
      Get.to(()=> ResetPasswordScreen(email: email.text.trim(),));*/
    } catch (e) {
      UFullScreenLoader.stopLoading();
      USnackBarHelpers.errorSnackBar(
        title: 'Failed Forget Password',
        message: e.toString(),
      );
    }
  }
}
