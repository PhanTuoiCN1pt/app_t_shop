import 'package:app_t_shop/common/widgets/appbar/appbar.dart';
import 'package:app_t_shop/common/widgets/brands/brand_card.dart';
import 'package:app_t_shop/common/widgets/layouts/grid_layout.dart';
import 'package:app_t_shop/common/widgets/texts/section_heading.dart';
import 'package:app_t_shop/features/shop/controllers/brand_controller.dart';
import 'package:app_t_shop/features/shop/models/brand_model.dart';
import 'package:app_t_shop/features/shop/screens/brand/brand_product.dart';
import 'package:app_t_shop/features/shop/screens/shimmer/brand_shimmer.dart';
import 'package:app_t_shop/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ViewAllBrandScreen extends StatelessWidget {
  const ViewAllBrandScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final brandController = BrandController.instance;
    return Scaffold(
      appBar:  TAppBar(title: Text('Thương hiệu'), showBackArrow: true,),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              /// Heading
              const TSectionHeading(title: 'Thương hiệu',showActionButton: false,),
              const SizedBox(height: TSizes.spaceBtwItems,),

              /// Brands
              Obx(
                    () {
                  if (brandController.isLoading.value) return BrandsShimmer();

                  if (brandController.allBrands.isEmpty){
                    return Center(
                      child: Text('Không có dữ liệu', style: Theme.of(context).textTheme.bodyMedium!.apply(color: Colors.white),),
                    );
                  }

                  return GridLayout(
                      itemCount: brandController.allBrands.length,
                      mainAxisExtent: 80,
                      itemBuilder: (_, index) {
                        final brand = brandController.allBrands[index];
                        return  TBrandCard(
                          showBorder: true,
                          brand: brand,
                          onTap: () => Get.to(() =>  BrandProduct(brand: brand,)),
                        );
                      }
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}