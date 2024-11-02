
import 'package:app_t_shop/common/widgets/custom_shapes/containers/primary_header_container.dart';
import 'package:app_t_shop/common/widgets/custom_shapes/containers/search_container.dart';
import 'package:app_t_shop/common/widgets/layouts/grid_layout.dart';
import 'package:app_t_shop/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:app_t_shop/common/widgets/texts/section_heading.dart';
import 'package:app_t_shop/features/shop/controllers/product/product_controller.dart';
import 'package:app_t_shop/features/shop/screens/all_product/view_all_products.dart';
import 'package:app_t_shop/features/shop/screens/home/widgets/home_appbar.dart';
import 'package:app_t_shop/features/shop/screens/home/widgets/home_categories.dart';
import 'package:app_t_shop/features/shop/screens/home/widgets/promo_slider.dart';
import 'package:app_t_shop/features/shop/screens/shimmer/vertical_product_shimmer.dart';
import 'package:app_t_shop/utils/constants/image_strings.dart';
import 'package:app_t_shop/utils/constants/sizes.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProductController());
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
                  TSectionHeading(title: 'Sản phẩm phổ biến',onPressed: () => Get.to(()=>
                      ViewAllProduct(
                        title: 'Sản phẩm phổ biến',
                        futureMethod: controller.fetchAllFeatureProducts(),
                      )),),
                  const SizedBox(height: TSizes.spaceBtwItems,),

                  /// Popular product
                  Obx((){
                    if(controller.isLoading.value) return TVerticalProductShimmer();

                    if (controller.featuredProducts.isEmpty){
                      return Center(child: Text('Không tìm thấy dữ liệu', style: Theme.of(context).textTheme.bodyMedium,),);
                    }
                    return GridLayout(
                        itemCount: controller.featuredProducts.length,
                        itemBuilder: (_, index) => TProductCardVertical(product: controller.featuredProducts[index],));
                  }),

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}





















