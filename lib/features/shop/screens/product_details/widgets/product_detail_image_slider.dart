import 'package:app_t_shop/common/widgets/appbar/appbar.dart';
import 'package:app_t_shop/common/widgets/custom_shapes/curved_edges/curved_edges_widget.dart';
import 'package:app_t_shop/common/widgets/icons/cicular_icon.dart';
import 'package:app_t_shop/common/widgets/images/rounded_image.dart';
import 'package:app_t_shop/utils/constants/colors.dart';
import 'package:app_t_shop/utils/constants/image_strings.dart';
import 'package:app_t_shop/utils/constants/sizes.dart';
import 'package:app_t_shop/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class ProductImageSlider extends StatelessWidget {
  const ProductImageSlider({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    final dark= THelperFunctions.isDarkMode(context);
    return TCurvedEdgesWidget(
      child: Container(
        color: dark ? TColors.darkerGrey : TColors.light,
        child: Stack(
          children: [
            /// Main Large Image
            const SizedBox(
              child: Padding(
                padding: EdgeInsets.all(TSizes.productImageRadius*2),
                child: Center(
                  child: Image(
                    image: AssetImage(TImages.productImage5),
                    height: 300,
                  ),
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
                  itemCount: 8,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  physics: const AlwaysScrollableScrollPhysics(),
                  itemBuilder: (_, index) => TRoundedImage(
                    imageUrl: TImages.productImage6,
                    width: 80,
                    backgroundColor: dark ? TColors.dark : TColors.white,
                    border: Border.all(color: TColors.primary),
                    padding: const EdgeInsets.all(TSizes.sm),
                  ),
                  separatorBuilder: (_,__) => const SizedBox(width: TSizes.spaceBtwItems,),
                ),
              ),
            ),

            /// Appbar Icon
            const TAppBar(
              showBackArrow: true,
              actions: [
                TCircularIcon(icon: Iconsax.heart5,color: Colors.red,)
              ],
            ),
          ],
        ),
      ),
    );
  }
}