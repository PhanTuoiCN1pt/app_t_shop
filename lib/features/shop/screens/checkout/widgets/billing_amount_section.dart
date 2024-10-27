import 'package:app_t_shop/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class BillingAmountSection extends StatelessWidget {
  const BillingAmountSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        /// SubTotal
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Subtotal', style: Theme.of(context).textTheme.bodyMedium,),
            Text('\$256', style: Theme.of(context).textTheme.bodyMedium,),
          ],
        ),

        /// Shipping Fee
        const SizedBox(height: TSizes.spaceBtwItems/2,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Shipping Fee', style: Theme.of(context).textTheme.bodyMedium,),
            Text('\$6', style: Theme.of(context).textTheme.labelLarge,),
          ],
        ),

        /// Tax Fee
        const SizedBox(height: TSizes.spaceBtwItems/2,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Tax Fee', style: Theme.of(context).textTheme.bodyMedium,),
            Text('\$6', style: Theme.of(context).textTheme.labelLarge,),
          ],
        ),

        /// Order Total
        const SizedBox(height: TSizes.spaceBtwItems/2,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Order Total', style: Theme.of(context).textTheme.bodyMedium,),
            Text('\$6', style: Theme.of(context).textTheme.labelLarge,),
          ],
        ),
      ],
    );
  }
}