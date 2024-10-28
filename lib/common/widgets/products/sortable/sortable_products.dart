import 'package:app_t_shop/common/widgets/layouts/grid_layout.dart';
import 'package:app_t_shop/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:app_t_shop/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class SortableProduct extends StatelessWidget {
  const SortableProduct({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        /// Dropdow
        DropdownButtonFormField(
          decoration: const InputDecoration(prefixIcon: Icon(Iconsax.sort)),
          onChanged: (value){},
          items: ['Name','Higher Price', 'Lower Price', 'Sale', 'Newest', 'Popularity']
              .map((option) => DropdownMenuItem(value: option, child: Text(option)))
              .toList(),

        ),
        const SizedBox(height: TSizes.spaceBtwItems,),
        /// Product
        GridLayout(itemCount: 8, itemBuilder: (_, index) => const TProductCardVertical()),
      ],
    );
  }
}