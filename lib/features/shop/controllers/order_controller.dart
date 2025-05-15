import 'package:app_t_shop/common/widgets/success_screen/success_screen.dart';
import 'package:app_t_shop/data/repositories/authentication/authentication_repository.dart';
import 'package:app_t_shop/data/repositories/order/order_repository.dart';
import 'package:app_t_shop/features/personalization/controllers/address/address_controller.dart';
import 'package:app_t_shop/features/shop/controllers/cart_controller.dart';
import 'package:app_t_shop/features/shop/controllers/product/checkout_controller.dart';
import 'package:app_t_shop/features/shop/screens/home/home.dart';
import 'package:app_t_shop/navigation_menu.dart';
import 'package:app_t_shop/utils/constants/enums.dart';
import 'package:app_t_shop/utils/constants/image_strings.dart';
import 'package:app_t_shop/utils/popups/full_screen_loader.dart';
import 'package:app_t_shop/utils/popups/loaders.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../models/order_model.dart';

class OrderController extends GetxController{
  static OrderController get instance => Get.find();

  final cartController = CartController.instance;
  final addressController = AddressController.instance;
  final checkoutController = CheckoutController.instance;
  final orderRepository = Get.put(OrderRepository());

  Future<List<OrderModel>> fetchUserOrders() async {
    try{
      final userOrders = await orderRepository.fetchUserOrders();
      return userOrders;
    }catch(e){
      TLoaders.warningSnackBar(title: 'Oh Snap!', message: e.toString());
      return [];
    }
  }
  void processOrder(double totalAmount) async {
    try {
      TFullScreenLoader.openLoadingDialog('Đang cập nhật đơn hàng của bạn', TImages.emptyAnimation);

      final user = AuthenticationRepository.instance.authUser;
      if (user == null || user.uid.isEmpty) {
        TFullScreenLoader.stopLoading();
        Get.snackbar('Lỗi', 'Không thể xác định người dùng. Vui lòng đăng nhập lại.');
        return;
      }
      final userId = user.uid;

      final order = OrderModel(
        id: UniqueKey().toString(),
        userId: userId,
        status: OrderStatus.pending,
        totalAmount: totalAmount,
        orderDate: DateTime.now(),
        paymentMethod: checkoutController.selectedPaymentMethod.value.name,
        address: addressController.selectedAddress.value,
        deliveryDate: DateTime.now(),
        items: cartController.cartItems.toList(),
      );

      await orderRepository.saveOrder(order, userId);

      cartController.clearCart();

      TFullScreenLoader.stopLoading();

      Get.off(() => SuccessScreen(
        image: TImages.orderComplete,
        title: 'Thanh toán thành công',
        subTitle: 'Đơn hàng của bạn sẽ sớm được giao đến',
        onPressed: () => Get.offAll(() => const NavigationMenuScreen()),
      ));
    } catch (e) {
      TFullScreenLoader.stopLoading();
      Get.snackbar('Lỗi', 'Đã xảy ra lỗi khi xử lý đơn hàng');
    }
  }

}