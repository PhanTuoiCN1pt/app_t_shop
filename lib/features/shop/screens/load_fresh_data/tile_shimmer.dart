import 'package:app_t_shop/features/shop/screens/load_fresh_data/shimmer.dart';
import 'package:app_t_shop/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class TListTileShimmer extends StatelessWidget {

  const TListTileShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Row(
          children: [
            TShimmerEffect(width: 50, height: 56, radius: 50),
            SizedBox(width: TSizes.spaceBtwItems),

            Column(

              children: [

                TShimmerEffect(width: 188, height: 15),

                SizedBox(height: TSizes.spaceBtwItems / 2),

                TShimmerEffect(width: 88, height: 12),
              ],
            ),
          ],
        ),
      ],
    );
  }
}