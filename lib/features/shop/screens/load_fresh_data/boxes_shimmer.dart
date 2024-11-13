import 'package:app_t_shop/features/shop/screens/load_fresh_data/shimmer.dart';
import 'package:app_t_shop/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class TBoxesShimmer extends StatelessWidget {

  const TBoxesShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(

      children: [

        Row(

          children: [

            Expanded(child: TShimmerEffect(width: 150, height: 110)),

            SizedBox(width: TSizes.spaceBtwItems),

            Expanded(child: TShimmerEffect(width: 150, height: 110)),

            SizedBox(width: TSizes.spaceBtwItems),

            Expanded(child: TShimmerEffect(width: 150, height: 118)),

          ],
        )
      ],
    );
  }
}