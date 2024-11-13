import 'package:app_t_shop/common/widgets/brands/brand_card.dart';
import 'package:app_t_shop/common/widgets/images/rounded_container.dart';
import 'package:app_t_shop/features/shop/models/brand_model.dart';
import 'package:app_t_shop/features/shop/screens/brand/brand_product.dart';
import 'package:app_t_shop/features/shop/screens/load_fresh_data/shimmer.dart';
import 'package:app_t_shop/utils/constants/colors.dart';
import 'package:app_t_shop/utils/constants/sizes.dart';
import 'package:app_t_shop/utils/helpers/helper_functions.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TBrandShowcase extends StatelessWidget {
  const TBrandShowcase({
    super.key, required this.images, required this.brand,
  });
  final BrandModel brand;
  final List<String> images;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Get.to(() =>  BrandProduct(brand: brand)),
      child: TRoundedContainer(
        showBorder: true,
        borderColor: TColors.darkerGrey,
        padding: const EdgeInsets.all(TSizes.md),
        backgroundColor: Colors.transparent,
        margin:const EdgeInsets.only(bottom: TSizes.spaceBtwItems),
        child: Column(
          children: [
            TBrandCard(showBorder: false,brand: brand,),
            const SizedBox(height: TSizes.spaceBtwItems,),

            Row(
                children: images.map((image) => brandTopProductImageWidget(image, context)).toList()
            )
          ],
        ),
      ),
    );
  }
  Widget brandTopProductImageWidget(String image, context){
    return Expanded(
      child: TRoundedContainer(
        height: 100,
        padding: const EdgeInsets.all(TSizes.md),
        margin: const EdgeInsets.only(right: TSizes.sm),
        backgroundColor: THelperFunctions.isDarkMode(context) ? TColors.darkerGrey : TColors.light,
        child: CachedNetworkImage(
          fit: BoxFit.contain,
          imageUrl: image,
          progressIndicatorBuilder: (context, url, downloadProgress) => TShimmerEffect(width: 100, height: 100),
          errorWidget: (context, url, error) => Icon(Icons.error),
        )
      ),
    );
  }
}
