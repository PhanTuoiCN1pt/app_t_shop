import 'package:app_t_shop/common/widgets/texts/section_heading.dart';
import 'package:app_t_shop/features/shop/screens/product_details/widgets/bottom_add_to_cart_widget.dart';
import 'package:app_t_shop/features/shop/screens/product_details/widgets/product_attributes.dart';
import 'package:app_t_shop/features/shop/screens/product_details/widgets/product_detail_image_slider.dart';
import 'package:app_t_shop/features/shop/screens/product_details/widgets/product_meta_data.dart';
import 'package:app_t_shop/features/shop/screens/product_details/widgets/rating_share_widget.dart';
import 'package:app_t_shop/features/shop/screens/product_reviews/product_reviews.dart';
import 'package:app_t_shop/utils/constants/colors.dart';
import 'package:app_t_shop/utils/constants/sizes.dart';
import 'package:app_t_shop/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:readmore/readmore.dart';

class ProductDetail extends StatelessWidget {
  const ProductDetail({super.key});

  @override
  Widget build(BuildContext context) {
    final dark= THelperFunctions.isDarkMode(context);
    return  Scaffold(
      bottomNavigationBar: const BottomAddToCart(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            /// 1 - Product Image Slider
            const ProductImageSlider(),

            /// 2 - Product Details
            Padding(
              padding: const EdgeInsets.only(right: TSizes.defaultSpace,left: TSizes.defaultSpace,bottom: TSizes.defaultSpace),
              child: Column(
                children: [
                  /// - Rating & Share
                  const RatingAndShare(),
                  
                  /// - Price, Title, Stock, Brand
                  const ProductMetaData(),

                  /// - Attributes
                  const ProductAttributes(),
                  const SizedBox(height: TSizes.spaceBtwItems,),

                  /// - Checkout Button
                  SizedBox(width: double.infinity, child: ElevatedButton(onPressed: (){}, child: const Text('Checkout')),),
                  const SizedBox(height: TSizes.spaceBtwItems,),

                  /// - Description
                  const TSectionHeading(title: 'Decription',showActionButton: false,),
                  const SizedBox(height: TSizes.spaceBtwItems,),
                  const ReadMoreText(
                    'This is a Product descrition for Blue Nike Sleeve less vest. There are more things that can be added but i am sdfsddhfsddjfhsdfhsdjf fdkjasnf',trimLines: 2,
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                    trimMode: TrimMode.Line,
                    trimCollapsedText: ' Show more',
                    trimExpandedText: ' Less',
                    moreStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.w900,color: TColors.primary),
                    lessStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.w900,color: TColors.primary),
                  ),

                  /// - Reviews
                  const Divider(),
                  const SizedBox(height: TSizes.spaceBtwItems,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const TSectionHeading(title: 'Reviews (199)',showActionButton: false,),
                      IconButton(onPressed: () => Get.to(() => const ProductReviewsScreen()), icon: const Icon(Iconsax.arrow_right_3)),
                    ],
                  ),
                  const SizedBox(height: TSizes.spaceBtwItems,)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}


