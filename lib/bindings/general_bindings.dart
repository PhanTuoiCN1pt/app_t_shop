import 'package:app_t_shop/features/personalization/controllers/address/address_controller.dart';
import 'package:app_t_shop/features/shop/controllers/cart_controller.dart';
import 'package:app_t_shop/features/shop/controllers/product/product_controller.dart';
import 'package:app_t_shop/features/shop/controllers/product/variation_controller.dart';
import 'package:app_t_shop/utils/helpers/network_manager.dart';
import 'package:get/get.dart';

import '../features/shop/controllers/order_controller.dart';

class GeneralBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(NetworkManager());
    Get.put(VariationController());
    Get.put(ProductController());
    Get.put(AddressController());
  }
}