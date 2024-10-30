import 'package:app_t_shop/app.dart';
import 'package:app_t_shop/data/repositories/authentication/authentication_repository.dart';
import 'package:app_t_shop/data/repositories/categories/category_repository.dart';
import 'package:app_t_shop/features/personalization/controllers/user_controller.dart';
import 'package:app_t_shop/features/shop/controllers/category_controller.dart';
import 'package:app_t_shop/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

Future<void> main() async {
  /// Widgets Binding
  // Todo:  Add Widget Binding
  final WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();

  /// GetX Local Storage
  await GetStorage.init();


  /// Await Splash until other Items Load
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);



  // Todo: Initialize Firebase
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform).then(
      (FirebaseApp value) => Get.put(AuthenticationRepository()),
  );

  Get.put(UserController());



  runApp(const App());

}