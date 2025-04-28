import 'package:app_t_shop/features/shop/controllers/cart_controller.dart';
import 'package:app_t_shop/utils/constants/sizes.dart';
import 'package:app_t_shop/utils/helpers/pricing_calculator.dart';
import 'package:flutter/material.dart';

class BillingAmountSection extends StatelessWidget {
  const BillingAmountSection({super.key});

  @override
  Widget build(BuildContext context) {
    final cartController = CartController.instance;
    final subTotal = cartController.totalCartPrice.value;

    return Column(
      children: [
        /// Tổng phụ
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Tổng phụ', style: Theme.of(context).textTheme.bodyMedium,),
            Text('\₫$subTotal', style: Theme.of(context).textTheme.bodyMedium,),
          ],
        ),

        /// Phí vận chuyển
        const SizedBox(height: TSizes.spaceBtwItems/2,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Phí vận chuyển', style: Theme.of(context).textTheme.bodyMedium,),
            Text('\₫${TPricingCalculator.calculateShippingCost(subTotal, 'US')}', style: Theme.of(context).textTheme.labelLarge,),
          ],
        ),

        /// Phí thuế
        const SizedBox(height: TSizes.spaceBtwItems/2,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Thuế', style: Theme.of(context).textTheme.bodyMedium,),
            Text('\₫${TPricingCalculator.calculateTax(subTotal, 'US')}', style: Theme.of(context).textTheme.labelLarge,),
          ],
        ),

        /// Tổng đơn hàng
        const SizedBox(height: TSizes.spaceBtwItems/2,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Tổng đơn hàng', style: Theme.of(context).textTheme.bodyMedium,),
            Text('\₫${TPricingCalculator.calculateTotalPrice(subTotal, 'US')}', style: Theme.of(context).textTheme.labelLarge,),
          ],
        ),
      ],
    );
  }
}
