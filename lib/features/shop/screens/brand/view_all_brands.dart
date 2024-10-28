import 'package:app_t_shop/common/widgets/appbar/appbar.dart';
import 'package:app_t_shop/common/widgets/brands/brand_card.dart';
import 'package:app_t_shop/common/widgets/layouts/grid_layout.dart';
import 'package:app_t_shop/common/widgets/texts/section_heading.dart';
import 'package:app_t_shop/features/shop/screens/brand/brand_product.dart';
import 'package:app_t_shop/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ViewAllBrandScreen extends StatelessWidget {
  const ViewAllBrandScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TAppBar(title: Text('Brand'), showBackArrow: true,),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              /// Heading
              const TSectionHeading(title: 'Brands',showActionButton: false,),
              const SizedBox(height: TSizes.spaceBtwItems,),

              /// Brands
              GridLayout(
                  itemCount: 10,
                  mainAxisExtent: 80,
                  itemBuilder: (context, index) => TBrandCard(
                    showBorder: true,
                    onTap: () =>  Get.to(() =>  const BrandProduct()),
                  ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}