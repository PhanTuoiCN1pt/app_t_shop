import 'package:app_t_shop/common/widgets/chips/choice_chip.dart';
import 'package:app_t_shop/common/widgets/images/rounded_container.dart';
import 'package:app_t_shop/common/widgets/texts/product_price_text.dart';
import 'package:app_t_shop/common/widgets/texts/product_title_text.dart';
import 'package:app_t_shop/common/widgets/texts/section_heading.dart';
import 'package:app_t_shop/utils/constants/colors.dart';
import 'package:app_t_shop/utils/constants/sizes.dart';
import 'package:app_t_shop/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class ProductAttributes extends StatelessWidget {
  const ProductAttributes({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Column(
      children: [
        /// Giá và Mô tả thuộc tính đã chọn
        TRoundedContainer(
          padding: const EdgeInsets.all(TSizes.md),
          backgroundColor: dark ? TColors.darkerGrey : TColors.grey,
          child: Column(
            children: [
              /// Tiêu đề, Giá, Tình trạng hàng
              Row(
                children: [
                  const TSectionHeading(title: 'Tình trạng:', showActionButton: false,),
                  const SizedBox(width: TSizes.spaceBtwItems,),

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const TProductTitleText(title: 'Giá : ', smallSize: true,),
                          const SizedBox(width: TSizes.spaceBtwItems,),

                          /// Giá gốc
                          Text('\$25', style: Theme.of(context).textTheme.titleSmall!.apply(decoration: TextDecoration.lineThrough),),
                          const SizedBox(width: TSizes.spaceBtwItems,),

                          /// Giá khuyến mãi
                          const ProductPriceText(price: '20'),
                        ],
                      ),
                      /// Tình trạng
                      Row(
                        children: [
                          const TProductTitleText(title: 'Kho hàng : ', smallSize: true,),
                          const SizedBox(width: TSizes.spaceBtwItems,),
                          Text('Còn hàng', style: Theme.of(context).textTheme.titleMedium,),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(height: TSizes.spaceBtwItems,),

        /// Thuộc tính
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const TSectionHeading(title: 'Màu sắc', showActionButton: false,),
            const SizedBox(height: TSizes.spaceBtwItems/2,),
            Wrap(
              spacing: 8,
              children: [
                TChoiceChip(text: 'Xanh lá', selected: false, onSelected: (value){},),
                TChoiceChip(text: 'Xanh dương', selected: true, onSelected: (value){},),
                TChoiceChip(text: 'Vàng', selected: false, onSelected: (value){},),
              ],
            ),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const TSectionHeading(title: 'Kích cỡ', showActionButton: false,),
            const SizedBox(height: TSizes.spaceBtwItems/2,),
            Wrap(
              spacing: 8,
              children: [
                TChoiceChip(text: 'EU 34', selected: true, onSelected: (value){},),
                TChoiceChip(text: 'EU 36', selected: true, onSelected: (value){},),
                TChoiceChip(text: 'EU 38', selected: false, onSelected: (value){},),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
