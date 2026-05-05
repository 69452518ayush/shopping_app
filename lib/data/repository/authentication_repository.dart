import 'package:ecommerce/features/authentication/screens/onboarding/login/login.dart';
import 'package:ecommerce/features/authentication/screens/onboarding/onboarding.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();
  final localStorage = GetStorage();
  final _auth = FirebaseAuth.instance;

  @override
  void onReady() {
    FlutterNativeSplash.remove();
    screenRedirect();
  }

  void screenRedirect() {
    localStorage.writeIfNull('isFirstTime', true);
    localStorage.read('isFirstTime') == true
        ? Get.to(() => LoginScreen())
        : Get.to(() => OnboardingScreen());
  }
  /// Authentication with email and password
  Future<void> registerUser(String email, String password) async{
    _auth.createUserWithEmailAndPassword(email: email, password: password);

  }
}
