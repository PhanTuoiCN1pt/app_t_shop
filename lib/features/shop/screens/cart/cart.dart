import 'package:app_t_shop/common/widgets/appbar/appbar.dart';
import 'package:app_t_shop/features/shop/screens/cart/widgets/cart_items.dart';
import 'package:app_t_shop/features/shop/screens/checkout/checkout.dart';
import 'package:app_t_shop/utils/constants/colors.dart';

import 'package:app_t_shop/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(
        showBackArrow: true,
        title: Text('Giỏ hàng',style: Theme.of(context).textTheme.headlineSmall,),
      ),
      body: const Padding(
        padding: EdgeInsets.all(TSizes.defaultSpace),
        child: CartItems(),
      ),

      /// Checkout Button
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(right: TSizes.defaultSpace,left: TSizes.defaultSpace,bottom: TSizes.defaultSpace),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: TColors.colorApp,
            side: const BorderSide(color: TColors.colorApp),
          ),
          onPressed: ()=>Get.to(()=>const CheckoutScreen()),
          child: const Text('Giá \$256'),
        ),
      ),
    );
  }
}


