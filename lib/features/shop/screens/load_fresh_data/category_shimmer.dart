import 'package:app_t_shop/features/shop/screens/load_fresh_data/shimmer.dart';
import 'package:app_t_shop/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class TCategoryShimmer extends StatelessWidget {
  const TCategoryShimmer({super.key, this.itemCount = 6});

  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: ListView.separated(
        shrinkWrap: true,
        separatorBuilder: (_, __) => const SizedBox(width: TSizes.spaceBtwItems,),
        itemCount: itemCount,
        itemBuilder: (_, __){
          return const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TShimmerEffect(width: 55, height: 55, radius: 55,),
              SizedBox(height: TSizes.spaceBtwItems/2,),

              TShimmerEffect(width: 55, height: 8),
            ],
          );
        } ,
      ),
    );
  }
}