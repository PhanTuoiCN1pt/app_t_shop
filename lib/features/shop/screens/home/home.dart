
import 'package:app_t_shop/common/widgets/custom_shapes/containers/primary_header_container.dart';
import 'package:app_t_shop/common/widgets/custom_shapes/containers/search_container.dart';
import 'package:app_t_shop/common/widgets/layouts/grid_layout.dart';
import 'package:app_t_shop/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:app_t_shop/common/widgets/texts/section_heading.dart';
import 'package:app_t_shop/features/shop/screens/all_product/view_all_products.dart';
import 'package:app_t_shop/features/shop/screens/home/widgets/home_appbar.dart';
import 'package:app_t_shop/features/shop/screens/home/widgets/home_categories.dart';
import 'package:app_t_shop/features/shop/screens/home/widgets/promo_slider.dart';
import 'package:app_t_shop/utils/constants/image_strings.dart';
import 'package:app_t_shop/utils/constants/sizes.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const TPrimaryHeaderContainer(
                child: Column(
                  children: [
                    /// AppBar

                    THomeAppBar(),
                    SizedBox(height: TSizes.spaceBtwSections1,),

                    /// SearchBar
                    TSearchContainer(text: 'Tìm kiếm',),
                    SizedBox(height: TSizes.spaceBtwSections1,),

                    /// Categories
                    Padding(
                      padding: EdgeInsets.only(left: TSizes.defaultSpace),
                      child: Column(
                        children: [
                          /// Heading
                          TSectionHeading(title: 'Danh mục', showActionButton: false,textColor: Colors.white,),
                          SizedBox(height: TSizes.spaceBtwItems1,),

                          /// Categories
                          THomeCategories(),
                        ],
                      ),

                    ),
                    SizedBox(height: TSizes.spaceBtwSections,),



                  ],
                ),
            ),

            /// Body
            Padding(
              padding: const EdgeInsets.all(TSizes.defaultSpace),
              child: Column(
                children: [
                  /// Promo Slider
                  const TPromoSlider(),
                  const SizedBox(height: TSizes.spaceBtwSections1,),

                  /// Heading
                  TSectionHeading(title: 'Sản phẩm phổ biến',onPressed: () => Get.to(()=>const ViewAllProduct()),),
                  const SizedBox(height: TSizes.spaceBtwItems,),

                  /// Popular product
                  GridLayout(itemCount: 5,itemBuilder: (_, index) => const TProductCardVertical(),),

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}





















