import 'package:app_t_shop/common/widgets/images/circular_image.dart';
import 'package:app_t_shop/common/widgets/images/rounded_container.dart';
import 'package:app_t_shop/common/widgets/texts/brand_title_text_with_verified_icon.dart';
import 'package:app_t_shop/common/widgets/texts/product_price_text.dart';
import 'package:app_t_shop/common/widgets/texts/product_title_text.dart';
import 'package:app_t_shop/features/shop/controllers/product/product_controller.dart';
import 'package:app_t_shop/features/shop/models/product_model.dart';
import 'package:app_t_shop/utils/constants/colors.dart';
import 'package:app_t_shop/utils/constants/enums.dart';
import 'package:app_t_shop/utils/constants/image_strings.dart';
import 'package:app_t_shop/utils/constants/sizes.dart';
import 'package:app_t_shop/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class ProductMetaData extends StatelessWidget {
  const ProductMetaData({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final controller = ProductController.instance;
    final salePercentage = controller.calculateSalePercentage(product.price, product.salePrice);
    final dark = THelperFunctions.isDarkMode(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// Giá, Giảm giá
        Row(
          children: [
            /// Mã giảm giá
            TRoundedContainer(
              radius: TSizes.sm,
              backgroundColor: TColors.secondary.withOpacity(0.8),
              padding: const EdgeInsets.symmetric(horizontal: TSizes.sm,vertical: TSizes.xs),
              child: Text('$salePercentage%', style: Theme.of(context).textTheme.labelLarge!.apply(color: TColors.black),),
            ),
            const SizedBox(width: TSizes.spaceBtwItems,),

            /// Giá
            if(product.productType == ProductType.single.toString() && product.salePrice > 0)
              Text('\₫${product.price}',style: Theme.of(context).textTheme.titleSmall!.apply(decoration: TextDecoration.lineThrough),),
            if(product.productType == ProductType.single.toString() && product.salePrice > 0)
              const SizedBox(width: TSizes.spaceBtwItems,),
            ProductPriceText(price: controller.getProductPrice(product),isLarge: true,),

          ],
        ),
        const SizedBox(height: TSizes.spaceBtwItems/1.5,),

        /// Tiêu đề
        TProductTitleText(title: product.title),
        const SizedBox(height: TSizes.spaceBtwItems/1.5,),

        /// Thương hiệu
        Row(
          children: [
            CircularImage(
              image: product.brand != null ? product.brand!.image: '',
              width: 50,
              height: 50,
              overlayColor: dark ? TColors.white : TColors.black,
            ),
            TBrandTitleWithVerifiedIcon(title: product.brand != null ? product.brand!.name : '',brandTextSize: TextSizes.medium,), // Thương hiệu: Nike
          ],
        )
      ],
    );
  }
}
