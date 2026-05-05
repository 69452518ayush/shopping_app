import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController{
  static SignUpController get instance => Get.find();
  /// Variable
  final signUpFormKey = GlobalKey<FormState>();

  /// functions to register the user with email and password
  Future<void> registerUser() async {
    try{
      // Form Key Validation
      if(!signUpFormKey.currentState!.validate()){
        return;
      }

    } catch (e){

    }
  }
}