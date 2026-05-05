import 'package:ecommerce/data/repository/authentication_repository.dart';
import 'package:ecommerce/firebase_options.dart';
import 'package:ecommerce/my_app.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

Future<void> main() async {
  ///  Widgets Flutter binding
  final widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  /// Get Storage  Initialize
   await GetStorage.init();

  /// Flutter Native Splash
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  /// Firebase Initializing
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform).then((value){
    Get.put(AuthenticationRepository());
  });
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(const MyApp());
}
