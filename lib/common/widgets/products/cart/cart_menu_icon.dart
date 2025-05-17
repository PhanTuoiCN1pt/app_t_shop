import 'package:app_t_shop/features/shop/controllers/cart_controller.dart';
import 'package:app_t_shop/features/shop/screens/cart/cart.dart';
import 'package:app_t_shop/utils/constants/colors.dart';
import 'package:app_t_shop/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class TCartCounterIcon extends StatelessWidget {
  const TCartCounterIcon({
    super.key,
    this.iconColor,
    this.counterBgColor,
    this.counterTextColor,
  });

  final Color? iconColor, counterBgColor, counterTextColor;


  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CartController());

    return Stack(
      children: [
        IconButton(onPressed: () => Get.to(() => const CartScreen()), icon: Icon(Iconsax.bag_2, color: TColors.error.withOpacity(0.8) )),
        Positioned(
          right: 0,
          child: Container(
            width: 18,
            height: 18,
            decoration: BoxDecoration(
              color: TColors.error.withOpacity(0.8) ,
              borderRadius: BorderRadius.circular(180),
            ),
            child: Center(
              child: Obx(
                () => Text(
                  controller.noOfCartItems.value.toString(),
                  style: Theme.of(context).textTheme.labelLarge!.apply(color: Colors.white, fontSizeFactor: 0.8),),
              ),
            ),
          ),),
      ],
    );
  }
}