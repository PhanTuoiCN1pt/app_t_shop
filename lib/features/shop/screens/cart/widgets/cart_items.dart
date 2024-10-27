import 'package:app_t_shop/common/widgets/products/cart/add_remove_button.dart';
import 'package:app_t_shop/common/widgets/products/cart/cart_item.dart';
import 'package:app_t_shop/common/widgets/texts/product_price_text.dart';
import 'package:app_t_shop/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class CartItems extends StatelessWidget {
  const CartItems({
    super.key,
    this.showAddRemoveButtons = true,
  });

  final bool showAddRemoveButtons;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      separatorBuilder: (_, __) => const SizedBox(height: TSizes.spaceBtwSections,),
      itemCount: 2,
      itemBuilder: (_, index) => Column(
        children: [
          /// Cart Item
          const CartItem(),
          if(showAddRemoveButtons) const SizedBox(height: TSizes.spaceBtwItems,),

          /// Add Remove Button Row with total Price
          if(showAddRemoveButtons)
            const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  SizedBox(width: 70,),
                  /// Add Remove Buttons
                  ProductAddRemoveButton(),
                ],
              ),
              ProductPriceText(price: '256'),
            ],
          ),
        ],
      ),
    );
  }
}