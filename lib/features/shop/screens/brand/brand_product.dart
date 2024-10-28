import 'package:app_t_shop/common/widgets/appbar/appbar.dart';
import 'package:app_t_shop/common/widgets/brands/brand_card.dart';
import 'package:app_t_shop/common/widgets/products/sortable/sortable_products.dart';
import 'package:app_t_shop/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class BrandProduct extends StatelessWidget {
  const BrandProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: TAppBar(title: Text('Nike'),showBackArrow: true,),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              /// Brand Deital
              TBrandCard(showBorder: true),
              SizedBox(height: TSizes.spaceBtwSections,),

              SortableProduct(),
            ],
          ),
        ),
      ),
    );
  }
}