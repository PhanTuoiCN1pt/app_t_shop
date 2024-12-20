import 'package:app_t_shop/common/widgets/appbar/appbar.dart';
import 'package:app_t_shop/common/widgets/appbar/tabbar.dart';
import 'package:app_t_shop/common/widgets/brands/brand_card.dart';
import 'package:app_t_shop/common/widgets/custom_shapes/containers/search_container.dart';
import 'package:app_t_shop/common/widgets/layouts/grid_layout.dart';
import 'package:app_t_shop/common/widgets/products/cart/cart_menu_icon.dart';
import 'package:app_t_shop/common/widgets/texts/section_heading.dart';
import 'package:app_t_shop/data/repositories/brands/brand_repository.dart';
import 'package:app_t_shop/features/shop/controllers/brand_controller.dart';
import 'package:app_t_shop/features/shop/controllers/category_controller.dart';
import 'package:app_t_shop/features/shop/screens/brand/brand_product.dart';
import 'package:app_t_shop/features/shop/screens/brand/view_all_brands.dart';
import 'package:app_t_shop/features/shop/screens/load_fresh_data/brand_shimmer.dart';
import 'package:app_t_shop/features/shop/screens/store/widgets/category_tab.dart';
import 'package:app_t_shop/navigation_menu.dart';
import 'package:app_t_shop/utils/constants/colors.dart';
import 'package:app_t_shop/utils/constants/sizes.dart';
import 'package:app_t_shop/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final categories = CategoryController.instance.featuredCategories;
    final brandController = Get.put(BrandController());
    return DefaultTabController(
      length: categories.length,
      child: Scaffold(
        appBar: TAppBar(
          title: Text('Cửa hàng', style: Theme.of(context).textTheme.headlineMedium,),
          actions: [
            TCartCounterIcon(onPressed: () => Get.offAll(() => NavigationMenuScreen(selectedIndex: 2,))),
          ],
        ),
        body: NestedScrollView(
          headerSliverBuilder: (_, innerBoxIsScrolled) {
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
                      /// Thanh tìm kiếm
                      const SizedBox(height: TSizes.spaceBtwItems,),
                      const TSearchContainer(text: 'Tìm kiếm trong cửa hàng', showBorder: true, showBackground: false, padding: EdgeInsets.zero,),
                      const SizedBox(height: TSizes.spaceBtwItems,),

                      /// Thương hiệu nổi bật
                      TSectionHeading(title: 'Thương hiệu nổi bật', showActionButton: true, onPressed: () => Get.to(() => const ViewAllBrandScreen()),),
                      const SizedBox(height: TSizes.spaceBtwItems / 1.5,),

                      /// thương hiệu
                      Obx(
                          () {
                            if (brandController.isLoading.value) return BrandsShimmer();

                            if (brandController.allBrands.isEmpty){
                              return Center(
                                child: Text('Không có dữ liệu', style: Theme.of(context).textTheme.bodyMedium!.apply(color: Colors.white),),
                              );
                            }

                            return GridLayout(
                                itemCount: brandController.allBrands.length-6,
                                mainAxisExtent: 80,
                                itemBuilder: (_, index) {
                                  final brand = brandController.allBrands[index];
                                  return  TBrandCard(showBorder: true, brand: brand,onTap: () => Get.to(() => BrandProduct(brand: brand,)),);
                                }
                            );
                          },
                      ),

                    ],
                  ),
                ),


                bottom: TTabBar(tabs: categories.map((category) => Tab(child: Text(category.name))).toList()),
              ),
            ];
          },

          body: TabBarView(

              children: categories.map((category) => TCategoryTab(category: category)).toList()
          ),
        ),
      ),
    );
  }
}
