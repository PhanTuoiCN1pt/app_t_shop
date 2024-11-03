import 'package:app_t_shop/common/widgets/appbar/appbar.dart';
import 'package:app_t_shop/common/widgets/custom_shapes/curved_edges/curved_edges_widget.dart';
import 'package:app_t_shop/common/widgets/icons/cicular_icon.dart';
import 'package:app_t_shop/common/widgets/images/rounded_image.dart';
import 'package:app_t_shop/common/widgets/products/favourite_icon/favourite_icon.dart';
import 'package:app_t_shop/features/shop/controllers/product/image_product_controller.dart';
import 'package:app_t_shop/features/shop/models/product_model.dart';
import 'package:app_t_shop/utils/constants/colors.dart';
import 'package:app_t_shop/utils/constants/image_strings.dart';
import 'package:app_t_shop/utils/constants/sizes.dart';
import 'package:app_t_shop/utils/helpers/helper_functions.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class ProductImageSlider extends StatelessWidget {
  const ProductImageSlider({
    super.key, required this.product,
  });

  final ProductModel product;


  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ImageController());
    final images = controller.getAllProductImages(product);
    final dark= THelperFunctions.isDarkMode(context);
    return TCurvedEdgesWidget(
      child: Container(
        color: dark ? TColors.darkerGrey : TColors.light,
        child: Stack(
          children: [
            /// Main Large Image
             SizedBox(
              height: 400,
              child: Padding(
                padding: EdgeInsets.all(TSizes.productImageRadius*2),
                child: Center(
                  child: Obx (() {
                    final image = controller.selectedProductImage.value;
                    return GestureDetector(
                      onTap: () => controller.showEnlargedImage(image),
                      child: CachedNetworkImage(
                        imageUrl: image,
                        progressIndicatorBuilder: (_, __, downloadProcess) =>
                          CircularProgressIndicator(value: downloadProcess.progress,color: TColors.primary,),
                      ),
                    );
                  }),
                  ),
                ),
              ),
            /// Image Slider
            Positioned(
              right: 0,
              bottom: 30,
              left: TSizes.defaultSpace+5,
              child: SizedBox(
                height: 80,
                child: ListView.separated(
                  itemCount: images.length,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  physics: const AlwaysScrollableScrollPhysics(),
                  separatorBuilder: (_,__) => const SizedBox(width: TSizes.spaceBtwItems,),
                  itemBuilder: (_, index) => Obx(
                    () {
                      final imageSelected = controller.selectedProductImage.value == images[index];
                      return TRoundedImage(
                        imageUrl: images[index],
                        isNetworkImage: true,
                        width: 80,
                        backgroundColor: dark ? TColors.dark : TColors.white,
                        border: Border.all(color: imageSelected ? TColors.primary : Colors.transparent),
                        padding: const EdgeInsets.all(TSizes.sm),
                        onPressed: () => controller.selectedProductImage.value = images[index],
                      );
                    },
                  ),
                ),
              ),
            ),

            /// Appbar Icon
            TAppBar(
              showBackArrow: true,
              actions: [
                FavouriteIcon(productId: product.id,)
              ],
            ),
          ],
        ),
      ),
    );
  }
}