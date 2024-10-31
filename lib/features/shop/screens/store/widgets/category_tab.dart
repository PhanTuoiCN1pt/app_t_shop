
import 'package:app_t_shop/common/widgets/brands/brand_show_case.dart';
import 'package:app_t_shop/common/widgets/layouts/grid_layout.dart';
import 'package:app_t_shop/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:app_t_shop/common/widgets/texts/section_heading.dart';
import 'package:app_t_shop/features/shop/models/category_model.dart';
import 'package:app_t_shop/utils/constants/image_strings.dart';
import 'package:app_t_shop/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class TCategoryTab extends StatelessWidget{
  const TCategoryTab({super.key, required this.category});

  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: Column(
          children: [
            /// Brands
            const TBrandShowcase(images: [TImages.productImage3,TImages.productImage1,TImages.productImage4]),
            const TBrandShowcase(images: [TImages.productImage3,TImages.productImage1,TImages.productImage4]),
            const SizedBox(height: TSizes.spaceBtwItems,),

            /// Product
            TSectionHeading(title: 'You might like',onPressed: (){},),
            const SizedBox(height: TSizes.spaceBtwItems,),

            GridLayout(itemCount: 4, itemBuilder: (_, index) => const TProductCardVertical()),
          ],
        ),
      ),
    ],
    );
  }
}