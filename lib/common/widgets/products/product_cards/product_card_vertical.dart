import 'package:app_t_shop/common/stype/shadow.dart';
import 'package:app_t_shop/common/widgets/icons/cicular_icon.dart';
import 'package:app_t_shop/common/widgets/images/rounded_container.dart';
import 'package:app_t_shop/common/widgets/images/rounded_image.dart';
import 'package:app_t_shop/common/widgets/products/favourite_icon/favourite_icon.dart';
import 'package:app_t_shop/common/widgets/texts/brand_title_text_with_verified_icon.dart';
import 'package:app_t_shop/common/widgets/texts/product_price_text.dart';
import 'package:app_t_shop/common/widgets/texts/product_title_text.dart';
import 'package:app_t_shop/features/shop/controllers/product/product_controller.dart';
import 'package:app_t_shop/features/shop/models/product_model.dart';
import 'package:app_t_shop/features/shop/screens/product_details/product_detail.dart';
import 'package:app_t_shop/utils/constants/colors.dart';
import 'package:app_t_shop/utils/constants/enums.dart';
import 'package:app_t_shop/utils/constants/image_strings.dart';
import 'package:app_t_shop/utils/constants/sizes.dart';
import 'package:app_t_shop/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class TProductCardVertical extends StatelessWidget {
  const TProductCardVertical({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final controller = ProductController.instance;
    final salePercentage = controller.calculateSalePercentage(product.price, product.salePrice);
    final dark = THelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: () => Get.to(() => ProductDetail(product: product,)),
      child: Container(
        width: 180,
        decoration: BoxDecoration(
          boxShadow: [TShadowStyle.verticalProductShadow],
          borderRadius: BorderRadius.circular(TSizes.productImageRadius),
          color: dark ? TColors.darkGrey : TColors.white,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TRoundedContainer(
              height: 180,
              width: double.infinity,
              backgroundColor: dark ? TColors.dark : TColors.light,
              child: Stack(
                children: [
                  /// Ảnh đại diện
                  TRoundedImage(imageUrl: product.thumbnail, applyImageRadius: true,isNetworkImage: true,),

                  /// Nhãn giảm giá
                  if(salePercentage != null)
                    Positioned(
                      top: 0,
                      child: TRoundedContainer(
                        radius: TSizes.sm,
                        backgroundColor: Colors.red.withOpacity(0.1),
                        padding: const EdgeInsets.symmetric(horizontal: TSizes.sm, vertical: TSizes.xs),
                        child: Text('\-$salePercentage%', style: Theme.of(context).textTheme.labelLarge!.apply(color: TColors.error),),
                      ),
                    ),

                  /// Nút yêu thích
                  Positioned(
                      top: 0,
                      right: 0,
                      child: FavouriteIcon(productId: product.id,),
                  ),
                ],
              ),
            ),
            const SizedBox(height: TSizes.spaceBtwItems / 2,),

            /// Chi tiết sản phẩm
            Padding(
              padding: const EdgeInsets.only(left: TSizes.sm),
              child: SizedBox(
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TProductTitleText(title: product.title, smallSize: true,),
                    Row(
                      children: [
                        Text('', overflow: TextOverflow.ellipsis, maxLines: 1, style: Theme.of(context).textTheme.labelMedium,),
                        const SizedBox(height: TSizes.spaceBtwItems / 2,),
                        TBrandTitleWithVerifiedIcon(title: product.brand!.name)
                      ],
                    ),
                  ],
                ),
              ),
            ),

            const Spacer(),

            /// Giá hiện tại
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                /// Giá
                Flexible(
                  child: Column(
                    children: [
                      if(product.productType == ProductType.single.toString() && product.salePrice > 0)
                        Padding(
                          padding: EdgeInsets.only(left: TSizes.sm, bottom: TSizes.sm),
                          // child: Text(
                          //   product.price.toString(),
                          //   style: Theme.of(context).textTheme.labelMedium!.apply(decoration: TextDecoration.lineThrough),
                          // ),
                        ),
                      Padding(
                        padding: EdgeInsets.only(left: TSizes.sm,  bottom: 26),
                        child: ProductPriceText(
                          price: controller.getProductPrice(product),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(right: 9),
                  child: Row(
                    children: [
                      Icon(Iconsax.location,  size: 15,),
                      SizedBox(width: 3,),
                      Text('Hà Nội', style: TextStyle(fontSize: 10),)
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
