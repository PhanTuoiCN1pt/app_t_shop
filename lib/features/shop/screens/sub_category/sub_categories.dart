import 'package:app_t_shop/common/widgets/appbar/appbar.dart';
import 'package:app_t_shop/common/widgets/images/rounded_image.dart';
import 'package:app_t_shop/common/widgets/products/product_cards/product_card_horizontal.dart';
import 'package:app_t_shop/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:app_t_shop/common/widgets/texts/section_heading.dart';
import 'package:app_t_shop/features/shop/controllers/category_controller.dart';
import 'package:app_t_shop/features/shop/models/category_model.dart';
import 'package:app_t_shop/features/shop/screens/all_product/view_all_products.dart';
import 'package:app_t_shop/features/shop/screens/load_fresh_data/horizontal_product_shimmer.dart';
import 'package:app_t_shop/utils/constants/image_strings.dart';
import 'package:app_t_shop/utils/constants/sizes.dart';
import 'package:app_t_shop/utils/helpers/cloud_helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SubCategoryScreen extends StatelessWidget {
  const SubCategoryScreen({super.key, required this.category});

  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    final controller = CategoryController.instance;
    return Scaffold(
      appBar:  TAppBar(title: Text(category.name), showBackArrow: true,),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              /// Biển quảng cáo
              const TRoundedImage(width: double.infinity, imageUrl: TImages.promoBanner2, applyImageRadius: true,),
              const SizedBox(height: TSizes.spaceBtwSections,),

              /// Danh mục phụ
              FutureBuilder(
                future: controller.getSubCategories(category.id),
                builder: (context, snapshot) {

                  const loader = THorizontalProductShimmer();
                  final widget = TCloudHelperFunctions.checkMultiRecordState(snapshot: snapshot, loader: loader);
                  if(widget != null) return widget;

                  final subCategories = snapshot.data!;

                  return ListView.builder(
                    shrinkWrap: true,
                    itemCount: subCategories.length,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (_, index) {
                      final subCategory = subCategories[index];
                      return FutureBuilder(
                        future: controller.getCategoryProductsHome(categoryId: subCategory.id),
                        builder: (context, snapshot) {

                          final widget = TCloudHelperFunctions.checkMultiRecordState(snapshot: snapshot, loader: loader);
                          if(widget != null) return widget;

                          final products = snapshot.data!;

                          return Column(
                              children: [
                                /// Tiêu đề
                                TSectionHeading(
                                  title: subCategory.name,
                                  onPressed: () => Get.to(
                                    () => ViewAllProduct(
                                      title: subCategory.name,
                                      futureMethod: controller.getCategoryProductsHome(categoryId: subCategory.id),
                                    )
                                ),),
                                const SizedBox(height: TSizes.spaceBtwItems / 2,),

                                SizedBox(
                                  height: 120,
                                  child: ListView.separated(
                                    itemCount: products.length,
                                    scrollDirection: Axis.horizontal,
                                    separatorBuilder: (context, index) => const SizedBox(width: TSizes.spaceBtwItems,),
                                    itemBuilder: (context, index) =>  ProductCartHorizontal(product: products[index]),
                                  ),
                                ),
                              ],
                            );
                        }
                      );
                      },
                  );


                }
              )
            ],
          ),
        ),
      ),
    );
  }
}
