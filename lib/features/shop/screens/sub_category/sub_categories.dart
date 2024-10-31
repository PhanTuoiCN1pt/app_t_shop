import 'package:app_t_shop/common/widgets/appbar/appbar.dart';
import 'package:app_t_shop/common/widgets/images/rounded_image.dart';
import 'package:app_t_shop/common/widgets/products/product_cards/product_card_horizontal.dart';
import 'package:app_t_shop/common/widgets/texts/section_heading.dart';
import 'package:app_t_shop/utils/constants/image_strings.dart';
import 'package:app_t_shop/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class SubCategoryScreen extends StatelessWidget {
  const SubCategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TAppBar(title: Text('Thể Thao'), showBackArrow: true,),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              /// Biển quảng cáo
              const TRoundedImage(width: double.infinity, imageUrl: TImages.promoBanner2, applyImageRadius: true,),
              const SizedBox(height: TSizes.spaceBtwSections,),

              /// Danh mục phụ
              Column(
                children: [
                  /// Tiêu đề
                  TSectionHeading(title: 'Áo thể thao', onPressed: (){},),
                  const SizedBox(height: TSizes.spaceBtwItems / 2,),

                  SizedBox(
                    height: 120,
                    child: ListView.separated(
                      itemCount: 4,
                      scrollDirection: Axis.horizontal,
                      separatorBuilder: (context, index) => const SizedBox(width: TSizes.spaceBtwItems,),
                      itemBuilder: (context, index) => const ProductCartHorizontal(),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
