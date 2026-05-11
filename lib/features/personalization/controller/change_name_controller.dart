import 'dart:js_interop';

import 'package:ecommerce/data/repository/user/user_repository.dart';
import 'package:ecommerce/features/personalization/controller/user_controller.dart';
import 'package:ecommerce/navigation_menu.dart';
import 'package:ecommerce/utils/helpers/network_manager.dart';
import 'package:ecommerce/utils/popups/full_screen_loader.dart';
import 'package:ecommerce/utils/popups/snackbar_helpers.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ChangeNameController extends GetxController{
  static ChangeNameController get instance => Get.find();
  /// Variable
  final _userController = UserController.instance;
  final _userRepository = UserRepository.instance;
  final firstName = TextEditingController();
  final lastName = TextEditingController();

  final updateUserFormKey = GlobalKey<FormState>();
  @override
  void onInit(){
    initializeNames();
    super.onInit();
  }
  void initializeNames(){
    firstName.text = _userController.user.value.firstName;
    lastName.text = _userController.user.value.lastName;
  }
  Future<void> updateUserName() async {
    try{
      // Start loading
      UFullScreenLoader.openLoadingDialog('We are updating your Information...');
      // Check Connectivity
      bool isConnected =  await NetworkManager.instance.isConnected();
      if(!isConnected){
        UFullScreenLoader.stopLoading();
        return ;

      }
      // Form Validation
      if(updateUserFormKey.currentState!.validate()){
        UFullScreenLoader.stopLoading();
        return ;
      }
      // Update User Name From Firestore
      Map<String , dynamic> map = {'first Name' :firstName.text,'last Name' : lastName.text };
      await _userRepository.updateSingleField(map);
      // Update User form Rx User
      _userController.user.value.firstName = firstName.text;
      _userController.user.value.lastName = lastName.text;
      // Stop loading
      UFullScreenLoader.stopLoading();
      // Redirect
      Get.offAll(() => NavigationMenu());
      // Success Message
      USnackBarHelpers.successSnackBar(title: 'Congratulations',message: 'Your name has been updated...');

    } catch(e){
      UFullScreenLoader.stopLoading();
      USnackBarHelpers.errorSnackBar(title: 'Update have failed',message: e.toString());
    }
  }
}