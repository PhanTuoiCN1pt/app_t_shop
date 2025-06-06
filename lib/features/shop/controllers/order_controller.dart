import 'package:app_t_shop/common/widgets/success_screen/success_screen.dart';
import 'package:app_t_shop/data/repositories/authentication/authentication_repository.dart';
import 'package:app_t_shop/data/repositories/order/order_repository.dart';
import 'package:app_t_shop/features/personalization/controllers/address/address_controller.dart';
import 'package:app_t_shop/features/shop/controllers/cart_controller.dart';
import 'package:app_t_shop/features/shop/controllers/product/checkout_controller.dart';
import 'package:app_t_shop/features/shop/screens/home/home.dart';
import 'package:app_t_shop/features/shop/screens/order/order.dart';
import 'package:app_t_shop/navigation_menu.dart';
import 'package:app_t_shop/utils/constants/enums.dart';
import 'package:app_t_shop/utils/constants/image_strings.dart';
import 'package:app_t_shop/utils/popups/full_screen_loader.dart';
import 'package:app_t_shop/utils/popups/loaders.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../models/cart_item_model.dart';
import '../models/order_model.dart';
import '../screens/order/success_order_screen.dart';

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
      TLoaders.warningSnackBar(title: 'Lỗi hiển thị đơn hàng người dùng!', message: e.toString());
      return [];
    }
  }

  /// Hủy đơn hàng
  Future<void> cancelOrder(String orderId) async {
    try {
      final userId = AuthenticationRepository.instance.authUser?.uid ?? '';
      if (userId.isEmpty) throw 'Không tìm thấy người dùng';

      TFullScreenLoader.openLoadingDialog('Đang hủy đơn hàng...', TImages.loading);

      await orderRepository.cancelOrder(orderId: orderId, userId: userId);

      TFullScreenLoader.stopLoading();
      TLoaders.successSnackBar(title: 'Thành công', message: 'Đơn hàng đã được hủy.');

      // Optional: Gọi lại fetchUserOrders() nếu bạn có danh sách đơn hàng đang hiển thị.
    } catch (e) {
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: 'Lỗi', message: e.toString());
    }
  }


  void processOrder({List<CartItemModel>? itemsToCheckout}) async {
    try {
      TFullScreenLoader.openLoadingDialog('Đang cập nhật đơn hàng của bạn', TImages.emptyAnimation);

      final userId = AuthenticationRepository.instance.authUser?.uid ?? '';
      if (userId.isEmpty) return;

      // Nếu không truyền gì thì lấy toàn bộ giỏ hàng
      final items = itemsToCheckout ?? cartController.cartItems.toList();

      // Tính tổng tiền
      final double totalAmount = items.fold(0.0, (sum, item) => sum + item.price * item.quantity);

      // Tạo doc ref mới để lấy ID chuẩn
      final order = OrderModel(
        id: UniqueKey().toString(),
        userId: userId,
        status: OrderStatus.pending,
        totalAmount: totalAmount + 50,
        orderDate: DateTime.now(),
        paymentMethod: checkoutController.selectedPaymentMethod.value.name,
        address: addressController.selectedAddress.value,
        deliveryDate: DateTime.now(),
        items: items,
      );

      await orderRepository.saveOrder(order, userId);

      // Xoá từng sản phẩm đã thanh toán khỏi giỏ hàng
      for (var item in items) {
        cartController.cartItems.removeWhere((cartItem) =>
        cartItem.productId == item.productId &&
            cartItem.variationId == item.variationId);
      }

      cartController.updateCart();
      TFullScreenLoader.stopLoading();

      Get.off(() => SuccessOrderScreen(
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