import 'package:app_t_shop/common/widgets/appbar/appbar.dart';
import 'package:app_t_shop/common/widgets/products/cart/add_remove_button.dart';
import 'package:app_t_shop/common/widgets/products/cart/cart_item.dart';
import 'package:app_t_shop/common/widgets/texts/product_price_text.dart';
import 'package:app_t_shop/utils/constants/colors.dart';

import 'package:app_t_shop/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(
        showBackArrow: true,
        title: Text('Cart',style: Theme.of(context).textTheme.headlineSmall,),
      ),
      body: Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: ListView.separated(
          shrinkWrap: true,
          separatorBuilder: (_, __) => const SizedBox(height: TSizes.spaceBtwSections,),
          itemCount: 10,
          itemBuilder: (_, index) => const Column(
            children: [
              CartItem(),
              SizedBox(height: TSizes.spaceBtwItems,),
              Row(
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
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(right: TSizes.defaultSpace,left: TSizes.defaultSpace,bottom: TSizes.defaultSpace),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: TColors.colorApp,
            side: const BorderSide(color: TColors.colorApp),
          ),
          onPressed: (){},
          child: const Text('Checkout \$256'),
        ),
      ),
    );
  }
}


