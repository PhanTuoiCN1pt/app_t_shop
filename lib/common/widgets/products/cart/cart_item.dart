import 'package:app_t_shop/common/widgets/images/rounded_image.dart';
import 'package:app_t_shop/common/widgets/texts/brand_title_text_with_verified_icon.dart';
import 'package:app_t_shop/common/widgets/texts/product_title_text.dart';
import 'package:app_t_shop/features/shop/models/cart_item_model.dart';
import 'package:app_t_shop/utils/constants/colors.dart';
import 'package:app_t_shop/utils/constants/image_strings.dart';
import 'package:app_t_shop/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class CartItem extends StatelessWidget {
  const CartItem({
    super.key, required this.cartItem,
  });
  final CartItemModel cartItem;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        /// Image
         TRoundedImage(
          imageUrl: cartItem.image ?? '',
          width: 60,
          height: 60,
          isNetworkImage: true,
          padding: const EdgeInsets.all(TSizes.sm),
          backgroundColor: TColors.grey,
        ),
        const SizedBox(width: TSizes.spaceBtwItems,),

        /// Title, Price & Size
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TBrandTitleWithVerifiedIcon(title: cartItem.brandName ?? ''),
              Flexible(child: TProductTitleText(title: cartItem.title,maxLines: 1,)),

              /// Attribute
              Text.rich(
                TextSpan(
                    children:  (cartItem.selectedVariation ?? {}).entries.map(
                            (e) => TextSpan(
                              children: [
                                TextSpan(text: ' ${e.key}', style: Theme.of(context).textTheme.bodySmall),
                                TextSpan(text: ' ${e.value}', style: Theme.of(context).textTheme.bodyLarge),
                              ]
                            )
                    ).toList(),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}