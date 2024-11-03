import 'package:app_t_shop/common/widgets/appbar/appbar.dart';
import 'package:app_t_shop/common/widgets/icons/cicular_icon.dart';
import 'package:app_t_shop/common/widgets/layouts/grid_layout.dart';
import 'package:app_t_shop/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:app_t_shop/features/shop/controllers/product/favourite_controller.dart';
import 'package:app_t_shop/features/shop/controllers/product/product_controller.dart';
import 'package:app_t_shop/features/shop/models/product_model.dart';
import 'package:app_t_shop/features/shop/screens/home/home.dart';
import 'package:app_t_shop/features/shop/screens/shimmer/vertical_product_shimmer.dart';
import 'package:app_t_shop/navigation_menu.dart';
import 'package:app_t_shop/utils/constants/image_strings.dart';
import 'package:app_t_shop/utils/constants/sizes.dart';
import 'package:app_t_shop/utils/helpers/cloud_helper_functions.dart';
import 'package:app_t_shop/utils/loaders/animation_loader.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = FavouritesController.instance;
    return Scaffold(
      appBar: TAppBar(
        title: Text('Danh sách yêu thích', style: Theme.of(context).textTheme.headlineMedium,),
        actions: [
          TCircularIcon(icon: Iconsax.add, onPressed: () => Get.offAll(NavigationMenuScreen(selectedIndex: 0,)),),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
            child: 
              Obx(
                  () => FutureBuilder(
                  future: controller.favouriteProduct(),
                  builder: (context, snapshot) {

                    final emptyWidget = TAnimationLoaderWidget(
                      text: 'Bạn chưa thêm sản phẩm nào vào giỏ hàng...',
                      animation: TImages.emptyAnimation,
                      showAction: true,
                      actionText: 'Thêm vào giỏ hàng ngay',
                      onActionPressed: () => Get.offAll(() => NavigationMenuScreen(selectedIndex: 0,)) ,
                    );

                    const loader = TVerticalProductShimmer(itemCount: 6,);
                    final widget = TCloudHelperFunctions.checkMultiRecordState(snapshot: snapshot,loader: loader, nothingFound: emptyWidget);
                    if (widget != null) return widget;

                    final products = snapshot.data!;
                    return GridLayout(itemCount: products.length, itemBuilder: (_, index) => TProductCardVertical(product: products[index],));
                  }
                ),
              ),
        ),
      ),
    );
  }
}
