import 'package:app_t_shop/common/widgets/appbar/appbar.dart';
import 'package:app_t_shop/common/widgets/appbar/tabbar.dart';
import 'package:app_t_shop/common/widgets/brands/brand_card.dart';
import 'package:app_t_shop/common/widgets/custom_shapes/containers/search_container.dart';
import 'package:app_t_shop/common/widgets/layouts/grid_layout.dart';
import 'package:app_t_shop/common/widgets/products/cart/cart_menu_icon.dart';
import 'package:app_t_shop/common/widgets/texts/section_heading.dart';
import 'package:app_t_shop/features/shop/controllers/category_controller.dart';
import 'package:app_t_shop/features/shop/screens/brand/view_all_brands.dart';
import 'package:app_t_shop/features/shop/screens/store/widgets/category_tab.dart';
import 'package:app_t_shop/utils/constants/colors.dart';
import 'package:app_t_shop/utils/constants/sizes.dart';
import 'package:app_t_shop/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StoreScreen extends StatelessWidget{
  const StoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final categories = CategoryController.instance.featuredCategories;

    return DefaultTabController(
      length: categories.length,
      child: Scaffold(
        appBar: TAppBar(
          title: Text('Store', style: Theme.of(context).textTheme.headlineMedium,),
          actions: [
            TCartCounterIcon(onPressed: (){}),
          ],
        ),
        body: NestedScrollView(
          headerSliverBuilder: (_, innerBoxIsScrolled){
          return [
            SliverAppBar(
              automaticallyImplyLeading: false,
              pinned: true,
              floating: true,
              backgroundColor: THelperFunctions.isDarkMode(context) ? TColors.black : TColors.white,
              expandedHeight: 440,
              flexibleSpace: Padding(
                padding: const EdgeInsets.all(TSizes.defaultSpace),
                child: ListView(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    /// Search bar
                    const SizedBox(height: TSizes.spaceBtwItems,),
                    const TSearchContainer(
                      text: 'Search in Store',showBorder: true, showBackground: false,padding: EdgeInsets.zero,),
                    const SizedBox(height: TSizes.spaceBtwItems,),

                    /// Featured Brands
                    TSectionHeading(title: 'Feature Brands', showActionButton: true,onPressed: ()=>Get.to(()=>const ViewAllBrandScreen()),),
                    const SizedBox(height: TSizes.spaceBtwItems/1.5,),

                    /// Brand GRID
                    GridLayout(
                        itemCount: 4,
                        mainAxisExtent: 80,
                        itemBuilder: (_, index){
                          return const TBrandCard(showBorder: false);
                        }
                    ),
                  ],
                ),
              ),

              /// Tabs ~~~ Tutorial
              bottom: TTabBar(tabs: categories.map((category) => Tab(child: Text(category.name))) .toList()),
              ),
          ];
        },
          /// Body ~~~ Tutorial
          body: TabBarView(
            children: categories.map((category) => TCategoryTab(category: category)).toList()
        ),
        ),
      ),
    );
  }
}

