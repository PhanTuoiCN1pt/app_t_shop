import 'package:app_t_shop/common/widgets/images/circular_image.dart';
import 'package:app_t_shop/common/widgets/images/rounded_container.dart';
import 'package:app_t_shop/common/widgets/texts/brand_title_text_with_verified_icon.dart';
import 'package:app_t_shop/common/widgets/texts/product_price_text.dart';
import 'package:app_t_shop/common/widgets/texts/product_title_text.dart';
import 'package:app_t_shop/utils/constants/colors.dart';
import 'package:app_t_shop/utils/constants/enums.dart';
import 'package:app_t_shop/utils/constants/image_strings.dart';
import 'package:app_t_shop/utils/constants/sizes.dart';
import 'package:app_t_shop/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class ProductMetaData extends StatelessWidget {
  const ProductMetaData({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// Giá, Giảm giá
        Row(
          children: [
            /// Mã giảm giá
            TRoundedContainer(
              radius: TSizes.sm,
              backgroundColor: TColors.secondary.withOpacity(0.8),
              padding: const EdgeInsets.symmetric(horizontal: TSizes.sm,vertical: TSizes.xs),
              child: Text('25%', style: Theme.of(context).textTheme.labelLarge!.apply(color: TColors.black),), // Giảm giá 25%
            ),
            const SizedBox(width: TSizes.spaceBtwItems,),

            /// Giá
            Text('\$250',style: Theme.of(context).textTheme.titleSmall!.apply(decoration: TextDecoration.lineThrough),), // Giá cũ: $250
            const SizedBox(width: TSizes.spaceBtwItems,),
            const ProductPriceText(price: '175',isLarge: true,), // Giá: $175

          ],
        ),
        const SizedBox(height: TSizes.spaceBtwItems/1.5,),

        /// Tiêu đề
        const TProductTitleText(title: 'Green Nike Sports Shirt'), // Áo thể thao Nike xanh lá
        const SizedBox(height: TSizes.spaceBtwItems/1.5,),

        /// Tình trạng hàng tồn kho
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const TProductTitleText(title: 'Tồn kho:',smallSize: true,), // Tồn kho:
            const SizedBox(width: TSizes.spaceBtwItems/3,),
            Text('In Stock',style: Theme.of(context).textTheme.titleMedium,), // Còn hàng
          ],
        ),
        const SizedBox(height: TSizes.spaceBtwItems/1.5,),

        /// Thương hiệu
        Row(
          children: [
            CircularImage(
              image: TImages.nikeLogo,
              width: 32,
              height: 32,
              overlayColor: dark ? TColors.white : TColors.black,
            ),
            const TBrandTitleWithVerifiedIcon(title: 'Nike',brandTextSize: TextSizes.medium,), // Thương hiệu: Nike
          ],
        )
      ],
    );
  }
}
