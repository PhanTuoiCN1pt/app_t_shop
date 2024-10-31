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

class ProductCartHorizontal extends StatelessWidget {
  const ProductCartHorizontal({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Container(
      width: 310,
      padding: const EdgeInsets.all(1),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(TSizes.productImageRadius),
        color: dark ? TColors.darkerGrey : TColors.grey,
      ),
      child: Row(
        children: [
          /// Ảnh đại diện
          TRoundedContainer(
            width: 120,
            padding: const EdgeInsets.all(TSizes.sm),
            backgroundColor: dark ? TColors.dark : TColors.light,
            child: Stack(
              children: [
                const SizedBox(
                  height: 120,
                  width: 120,
                  child: TRoundedImage(imageUrl: TImages.productImage1, applyImageRadius: true,),
                ),
                Positioned(
                  top: 5,
                  child: TRoundedContainer(
                    radius: TSizes.sm,
                    backgroundColor: TColors.secondary.withOpacity(0.8),
                    padding: const EdgeInsets.symmetric(horizontal: TSizes.sm, vertical: TSizes.xs),
                    child: Text('25%', style: Theme.of(context).textTheme.labelLarge!.apply(color: TColors.black),),
                  ),
                ),

                const Positioned(
                  top: 0,
                  right: 0,
                  width: 35,
                  height: 35,
                  child: TCircularIcon(icon: Iconsax.heart5, color: Colors.red, size: 20,),
                ),
              ],
            ),
          ),

          /// Chi tiết sản phẩm
          SizedBox(
            width: 188,
            child: Padding(
              padding: const EdgeInsets.only(top: TSizes.sm, left: TSizes.sm),
              child: Column(
                children: [
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TProductTitleText(title: 'Giày Nike xanh lá cây hajkdh adhsad aksdh askdh adsadhs ', smallSize: true,),
                      SizedBox(height: TSizes.spaceBtwItems / 2,),
                      TBrandTitleWithVerifiedIcon(title: 'Nike'),
                    ],
                  ),

                  const Spacer(),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      /// Giá cả
                      const Flexible(child: ProductPriceText(price: '256')),

                      /// Thêm vào giỏ
                      Container(
                        decoration: const BoxDecoration(
                            color: TColors.dark,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(TSizes.cardRadiusMd),
                                bottomRight: Radius.circular(TSizes.productImageRadius)
                            )
                        ),
                        child: const SizedBox(
                            width: TSizes.iconLg * 1.2,
                            height: TSizes.iconLg * 1.2,
                            child: Center(child: Icon(Iconsax.add, color: TColors.white,))
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
