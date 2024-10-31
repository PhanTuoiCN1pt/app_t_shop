import 'package:app_t_shop/common/widgets/images/rounded_image.dart';
import 'package:app_t_shop/common/widgets/texts/brand_title_text_with_verified_icon.dart';
import 'package:app_t_shop/common/widgets/texts/product_title_text.dart';
import 'package:app_t_shop/utils/constants/colors.dart';
import 'package:app_t_shop/utils/constants/image_strings.dart';
import 'package:app_t_shop/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class CartItem extends StatelessWidget {
  const CartItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        /// Image
        const TRoundedImage(
          imageUrl: TImages.productImage1,
          width: 60,
          height: 60,
          padding: EdgeInsets.all(TSizes.sm),
          backgroundColor: TColors.light,
        ),
        const SizedBox(width: TSizes.spaceBtwItems,),

        /// Title, Price & Size
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const TBrandTitleWithVerifiedIcon(title: 'Nike'),
              const Flexible(child: TProductTitleText(title: 'Black Sports shoes ',maxLines: 1,)),

              /// Attribute
              Text.rich(
                TextSpan(
                    children:  [
                      TextSpan(text: 'Màu',style: Theme.of(context).textTheme.bodySmall),
                      TextSpan(text: 'Xanh',style: Theme.of(context).textTheme.bodyLarge),
                      TextSpan(text: 'Size',style: Theme.of(context).textTheme.bodySmall),
                      TextSpan(text: 'UK 08',style: Theme.of(context).textTheme.bodyLarge),
                    ]
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}