import 'package:app_t_shop/common/stype/shadow.dart';
import 'package:app_t_shop/common/widgets/icons/cicular_icon.dart';
import 'package:app_t_shop/common/widgets/images/rounded_container.dart';
import 'package:app_t_shop/common/widgets/images/rounded_image.dart';
import 'package:app_t_shop/common/widgets/texts/brand_title_text_with_verified_icon.dart';
import 'package:app_t_shop/common/widgets/texts/product_price_text.dart';
import 'package:app_t_shop/common/widgets/texts/product_title_text.dart';
import 'package:app_t_shop/utils/constants/colors.dart';
import 'package:app_t_shop/utils/constants/image_strings.dart';
import 'package:app_t_shop/utils/constants/sizes.dart';
import 'package:app_t_shop/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class TProductCardVertical extends StatelessWidget {
  const TProductCardVertical({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: (){},
      child: Container(
        width: 180,
        padding: const EdgeInsets.all(1),
        decoration: BoxDecoration(
          boxShadow: [TShadowStyle.verticalProductShadow],
          borderRadius: BorderRadius.circular(TSizes.productImageRadius),
          color: dark ? TColors.darkGrey : TColors.white,
        ),
        child: Column(
          children: [
            TRoundedContainer(
              height: 180,
              padding: const EdgeInsets.all(TSizes.sm),
              backgroundColor: dark ? TColors.dark : TColors.light,
              child: Stack(
                children: [
                  /// Thumbnail Image
                  const TRoundedImage(imageUrl: TImages.productImage1,applyImageRadius: true,),

                  /// Sale Tag
                  Positioned(
                    top: 12,
                    child: TRoundedContainer(
                      radius: TSizes.sm,
                      backgroundColor: TColors.secondary.withOpacity(0.8),
                      padding: const EdgeInsets.symmetric(horizontal: TSizes.sm,vertical: TSizes.xs),
                      child: Text('25%', style: Theme.of(context).textTheme.labelLarge!.apply(color: TColors.black),),
                    ),
                  ),

                  /// Favourite Icon Button
                  const Positioned(
                      top: 0,
                      right: 0 ,
                      child: TCircularIcon(icon: Iconsax.heart5, color: Colors.red,))
                ],
              ),
            ),
            const SizedBox(height: TSizes.spaceBtwItems / 2,),

            /// Details
            Padding(
              padding: const EdgeInsets.only(left: TSizes.sm),
              child: SizedBox(
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const TProductTitleText(title: 'Green Nike Air Shoe fsdfsd sdfdgdf dfhfhfgetert etertfsdfs sdfsdf',smallSize: true,),
                    Row(
                      children: [
                        Text('Nike', overflow: TextOverflow.ellipsis,maxLines: 1,style: Theme.of(context).textTheme.labelMedium,),
                        const SizedBox(height: TSizes.spaceBtwItems/2,),
                        const TBrandTitleWithVerifiedIcon(title: 'Nike')
                      ],
                    ),
                  ],
                ),
              ),
            ),

            const Spacer(),

            /// Price Now
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                /// Price
                const Padding(
                  padding: EdgeInsets.only(right: TSizes.sm),
                  child: ProductPriceText(price: '35',),
                ),
                Container(
                  decoration: const BoxDecoration(
                      color: TColors.dark,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(TSizes.cardRadiusMd),
                          bottomRight: Radius.circular(TSizes.productImageRadius)
                      )
                  ),
                  child: const SizedBox(
                      width: TSizes.iconLg*1.2,
                      height: TSizes.iconLg*1.2,
                      child: Center(child: Icon(Iconsax.add, color: TColors.white,))
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}












