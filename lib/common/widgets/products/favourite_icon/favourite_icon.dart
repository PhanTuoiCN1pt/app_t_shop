import 'package:app_t_shop/common/widgets/icons/cicular_icon.dart';
import 'package:app_t_shop/features/shop/controllers/product/favourite_controller.dart';
import 'package:app_t_shop/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class FavouriteIcon extends StatelessWidget {
  const FavouriteIcon({super.key, required this.productId});

  final String productId;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(FavouritesController());
    return Obx(() => TCircularIcon(
      icon: controller.isFavourite(productId) ? Iconsax.heart5 : Iconsax.heart,
      color: controller.isFavourite(productId) ? TColors.error : null,
      onPressed: () => controller.toggleFavouriteProduct(productId),
    ));
  }
}