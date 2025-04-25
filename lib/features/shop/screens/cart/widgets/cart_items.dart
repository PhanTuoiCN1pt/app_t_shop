import 'package:app_t_shop/common/widgets/products/cart/add_remove_button.dart';
import 'package:app_t_shop/common/widgets/products/cart/cart_item.dart';
import 'package:app_t_shop/common/widgets/texts/product_price_text.dart';
import 'package:app_t_shop/features/shop/controllers/cart_controller.dart';
import 'package:app_t_shop/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartItems extends StatelessWidget {
  const CartItems({
    super.key,
    this.showAddRemoveButtons = true,
  });

  final bool showAddRemoveButtons;

  @override
  Widget build(BuildContext context) {
    final cartController = CartController.instance;

    return Obx(
      () => ListView.separated(
        shrinkWrap: true,
        separatorBuilder: (_, __) => const SizedBox(height: TSizes.spaceBtwSections,),
        itemCount: cartController.cartItems.length,
        itemBuilder: (_, index) => Obx(
            () {
              final item = cartController.cartItems[index];
              return Column(
                children: [

                  /// Cart Item
                  CartItem(cartItem: item,),
                  if(showAddRemoveButtons) const SizedBox(
                    height: TSizes.spaceBtwItems,),

                  /// Add Remove Button Row with total Price
                  if(showAddRemoveButtons)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            const SizedBox(width: 70,),

                            /// Add Remove Buttons
                            ProductAddRemoveButton(
                              quantity: item.quantity,
                              add: () => cartController.addOneToCart(item),
                              remove: () => cartController.removeOneFromCart(item),
                            ),
                          ],
                        ),
                        ProductPriceText(price: (item.price * item.quantity).toStringAsFixed(1)),
                      ],
                    ),
                ],
              );
            }),
      ),
    );
  }
}