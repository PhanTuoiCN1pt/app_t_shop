import 'package:app_t_shop/common/widgets/products/cart/add_remove_button.dart';
import 'package:app_t_shop/common/widgets/products/cart/cart_item.dart';
import 'package:app_t_shop/common/widgets/texts/product_price_text.dart';
import 'package:app_t_shop/features/shop/controllers/cart_controller.dart';
import 'package:app_t_shop/features/shop/controllers/product/product_controller.dart';
import 'package:app_t_shop/features/shop/controllers/product/variation_controller.dart';
import 'package:app_t_shop/features/shop/models/cart_item_model.dart';
import 'package:app_t_shop/utils/constants/sizes.dart';
import 'package:app_t_shop/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartItems extends StatelessWidget {
  const CartItems({
    super.key,
    this.showAddRemoveButtons = true,
    this.customCartItems,
  });

  final bool showAddRemoveButtons;
  final List<CartItemModel>? customCartItems;

  @override
  Widget build(BuildContext context) {
    final cartController = CartController.instance;
    final variationController = VariationController.instance;

    final items = customCartItems ?? cartController.cartItems;

    if (customCartItems != null) {
      // Dùng danh sách cố định, không cần Obx
      return ListView.separated(
        shrinkWrap: true,
        separatorBuilder: (_, __) => const SizedBox(height: TSizes.spaceBtwSections),
        itemCount: items.length,
        itemBuilder: (_, index) {
          final item = items[index];
          return buildCartItemWidget(item, variationController, cartController);
        },
      );
    } else {
      // Dùng observable, cần Obx
      return Obx(() => ListView.separated(
        shrinkWrap: true,
        separatorBuilder: (_, __) => const SizedBox(height: TSizes.spaceBtwSections),
        itemCount: items.length,
        itemBuilder: (_, index) {
          final item = items[index];
          return buildCartItemWidget(item, variationController, cartController);
        },
      ));
    }
  }

  Widget buildCartItemWidget(CartItemModel item, VariationController variationController, CartController cartController) {
    return Column(
      children: [
        CartItem(cartItem: item),
        if (showAddRemoveButtons) const SizedBox(height: TSizes.spaceBtwItems),
        if (showAddRemoveButtons)
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const SizedBox(width: 70),
                  ProductAddRemoveButton(
                    quantity: item.quantity,
                    maxQuantity: variationController.selectedVariation.value.stock,
                    add: () => cartController.addOneToCartNoNotification(item),
                    remove: () => cartController.removeOneFromCart(item),
                  ),
                ],
              ),
              ProductPriceText(price: THelperFunctions.formatNumber(item.price * item.quantity)),
            ],
          ),
      ],
    );
  }

}
