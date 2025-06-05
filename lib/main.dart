import 'package:app_t_shop/app.dart';
import 'package:app_t_shop/data/repositories/authentication/authentication_repository.dart';
import 'package:app_t_shop/features/personalization/controllers/user_controller.dart';
import 'package:app_t_shop/features/shop/controllers/banner_controller.dart';
import 'package:app_t_shop/features/shop/controllers/brand_controller.dart';
import 'package:app_t_shop/features/shop/controllers/cart_controller.dart';
import 'package:app_t_shop/features/shop/controllers/category_controller.dart';
import 'package:app_t_shop/features/shop/controllers/order_controller.dart';
import 'package:app_t_shop/features/shop/controllers/product/checkout_controller.dart';
import 'package:app_t_shop/features/shop/controllers/product/favourite_controller.dart';
import 'package:app_t_shop/features/shop/controllers/product/product_controller.dart';
import 'package:app_t_shop/features/shop/controllers/product/variation_controller.dart';
import 'package:app_t_shop/features/shop/controllers/review_controller.dart';
import 'package:app_t_shop/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import "package:flutter/material.dart";
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'features/shop/controllers/product/chat_controller.dart';

Future<void> main() async {
  /// Khởi tạo Widgets Binding
  final WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();

  /// Lưu trữ cục bộ bằng GetX
  await GetStorage.init();

  /// Giữ màn hình Splash cho đến khi các mục khác được tải
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);


  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform).then(
        (FirebaseApp value) => Get.put(AuthenticationRepository()),
  );

  Get.put(UserController());
  Get.put(ProductController());
  Get.put(CategoryController());
  Get.put(BrandController());
  Get.put(BannerController());
  Get.put(CheckoutController());
  Get.put(ReviewController());
  Get.put(ChatController());
  runApp(const App());
}
