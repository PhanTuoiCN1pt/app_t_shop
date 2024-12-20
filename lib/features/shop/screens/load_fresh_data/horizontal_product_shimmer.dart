import 'package:app_t_shop/features/shop/screens/load_fresh_data/shimmer.dart';
import 'package:app_t_shop/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class THorizontalProductShimmer extends StatelessWidget {
  const THorizontalProductShimmer({super.key, this.itemCount = 4});

  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: TSizes.spaceBtwSections),
      height: 120,
      child: ListView.separated(
        itemCount: itemCount,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        separatorBuilder: (context, index) => SizedBox(width: TSizes.spaceBtwItems,),
        itemBuilder: (_, __) => Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            TShimmerEffect(width: 120, height: 120),
            SizedBox(width: TSizes.spaceBtwItems,),



            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(height: TSizes.spaceBtwItems/2,),
              ],
            ),
          ],
        ),

      ),
    );
  }
}