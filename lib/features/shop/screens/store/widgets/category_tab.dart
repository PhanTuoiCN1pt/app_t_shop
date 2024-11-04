import 'package:app_t_shop/common/widgets/brands/brand_show_case.dart';
import 'package:app_t_shop/common/widgets/layouts/grid_layout.dart';
import 'package:app_t_shop/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:app_t_shop/common/widgets/texts/section_heading.dart';
import 'package:app_t_shop/data/repositories/brands/brand_repository.dart';
import 'package:app_t_shop/features/shop/controllers/brand_controller.dart';
import 'package:app_t_shop/features/shop/controllers/category_controller.dart';
import 'package:app_t_shop/features/shop/controllers/product/product_controller.dart';
import 'package:app_t_shop/features/shop/models/brand_model.dart';
import 'package:app_t_shop/features/shop/models/category_model.dart';
import 'package:app_t_shop/features/shop/models/product_model.dart';
import 'package:app_t_shop/features/shop/screens/all_product/view_all_products.dart';
import 'package:app_t_shop/features/shop/screens/shimmer/vertical_product_shimmer.dart';
import 'package:app_t_shop/features/shop/screens/store/widgets/category_brand.dart';
import 'package:app_t_shop/utils/constants/image_strings.dart';
import 'package:app_t_shop/utils/constants/sizes.dart';
import 'package:app_t_shop/utils/helpers/cloud_helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TCategoryTab extends StatelessWidget {
  const TCategoryTab({super.key, required this.category,});

  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    final controller = CategoryController.instance;
    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              /// Thương hiệu
              CategoryBrand(category: category),
              const SizedBox(height: TSizes.spaceBtwItems,),

              /// Sản phẩm
              FutureBuilder(
                future: controller.getCategoryProducts(categoryId: category.id),
                builder: (context, snapshot) {

                  final response = TCloudHelperFunctions.checkMultiRecordState(snapshot: snapshot, loader: TVerticalProductShimmer());
                  if(response != null) return response;

                  final products = snapshot.data!;
                  return Column(
                    children: [
                      TSectionHeading(title: 'Có thể bạn sẽ thích', onPressed: () => Get.to(ViewAllProduct(
                        title: category.name,
                        futureMethod: controller.getCategoryProducts(categoryId: category.id, limit: -1),
                      ),
                      )),
                      const SizedBox(height: TSizes.spaceBtwItems,),

                      GridLayout(itemCount: products.length, itemBuilder: (_, index) => TProductCardVertical(product: products[index])),
                    ],
                  );
                }
              ),

            ],
          ),
        ),
      ],
    );
  }
}
