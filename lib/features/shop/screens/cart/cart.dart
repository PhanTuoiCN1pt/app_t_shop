import 'package:app_t_shop/common/widgets/appbar/appbar.dart';
import 'package:app_t_shop/features/shop/controllers/cart_controller.dart';
import 'package:app_t_shop/features/shop/screens/cart/widgets/cart_items.dart';
import 'package:app_t_shop/features/shop/screens/checkout/checkout.dart';
import 'package:app_t_shop/navigation_menu.dart';
import 'package:app_t_shop/utils/constants/colors.dart';
import 'package:app_t_shop/utils/constants/image_strings.dart';

import 'package:app_t_shop/utils/constants/sizes.dart';
import 'package:app_t_shop/utils/loaders/animation_loader.dart';
import 'package:app_t_shop/utils/popups/loaders.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = CartController.instance;

    return Scaffold(
      appBar: TAppBar(
        showBackArrow: true,
        title: Text('Giỏ hàng',style: Theme.of(context).textTheme.headlineSmall,),
      ),
      body: Obx(
          () {

            final emptyWidget = TAnimationLoaderWidget(
              text: 'Ohh, Bạn chưa có sp nào trong giỏ hàng',
              animation: TImages.ladyAdd,
              showAction: true,
              actionText: 'Thêm ngay!',
              onActionPressed: () => Get.off(() => const NavigationMenuScreen()),
            );

            if (controller.cartItems.isEmpty) {
              return emptyWidget;
            } else {
              return const Padding(
                padding: EdgeInsets.all(TSizes.defaultSpace),
                child: CartItems(),
              );

            }
          }),

      /// Checkout Button
      bottomNavigationBar: controller.cartItems.isEmpty
          ? const SizedBox()
          : Padding(
        padding: const EdgeInsets.only(right: TSizes.defaultSpace, left: TSizes.defaultSpace, bottom: TSizes.defaultSpace),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: TColors.colorApp,
            side: const BorderSide(color: TColors.colorApp),
          ),
          onPressed: () => Get.to(() => const CheckoutScreen()),
          child: Obx(() => Text('Thanh toán: \₫${controller.totalCartPrice.value}')),
        ),
      ),
    );
  }
}


