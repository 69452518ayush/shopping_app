import 'package:ecommerce/features/authentication/screens/onboarding/login/login.dart';
import 'package:ecommerce/features/authentication/screens/onboarding/onboarding.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();
  final storage = GetStorage();

  @override
  void onReady() {
    FlutterNativeSplash.remove();
    screenRedirect();
  }

  void screenRedirect() {
    storage.writeIfNull('isFirstTime', true);
    storage.read('isFirstTime') == true
        ? Get.to(() => LoginScreen())
        : Get.to(() => OnboardingScreen());
  }
}
