import 'package:app_t_shop/common/widgets/texts/section_heading.dart';
import 'package:app_t_shop/features/shop/models/product_model.dart';
import 'package:app_t_shop/features/shop/screens/product_details/widgets/bottom_add_to_cart_widget.dart';
import 'package:app_t_shop/features/shop/screens/product_details/widgets/product_attributes.dart';
import 'package:app_t_shop/features/shop/screens/product_details/widgets/product_detail_image_slider.dart';
import 'package:app_t_shop/features/shop/screens/product_details/widgets/product_meta_data.dart';
import 'package:app_t_shop/features/shop/screens/product_details/widgets/rating_share_widget.dart';
import 'package:app_t_shop/features/shop/screens/product_details/widgets/shop_infor.dart';
import 'package:app_t_shop/features/shop/screens/product_reviews/product_reviews.dart';
import 'package:app_t_shop/utils/constants/colors.dart';
import 'package:app_t_shop/utils/constants/enums.dart';
import 'package:app_t_shop/utils/constants/sizes.dart';
import 'package:app_t_shop/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:readmore/readmore.dart';

class ProductDetail extends StatelessWidget {
  const ProductDetail({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomAddToCart(product: product,),
      body: SingleChildScrollView(
        child: Column(
          children: [
            /// 1 - Bộ trượt hình ảnh sản phẩm
            ProductImageSlider(product: product,),

            /// 2 - Chi tiết sản phẩm
            Padding(
              padding: const EdgeInsets.only(right: TSizes.defaultSpace, left: TSizes.defaultSpace, bottom: TSizes.defaultSpace),
              child: Column(
                children: [
                  /// - Đánh giá & Chia sẻ
                   RatingAndShare(),

                  /// - Giá, Tiêu đề, Tồn kho, Thương hiệu
                   ProductMetaData(product: product,),

                  /// - Thuộc tính
                  if(product.productType == ProductType.variable.toString()) ProductAttributes(product: product,),
                  if(product.productType == ProductType.variable.toString()) SizedBox(height: TSizes.spaceBtwItems,),

                  /// - Thông tin người bán
                  ShopInfoWidget(
                    shopName: "TrueClick 247",
                    location: "Hà Nội",
                    onlineStatus: "Online 1 phút trước",
                    productCount: 267,
                    rating: 4.6,
                    responseRate: 75,
                  ),
                  const SizedBox(height: TSizes.spaceBtwItems,),

                  /// - Mô tả
                  const TSectionHeading(title: 'Mô tả', showActionButton: false,),
                  const SizedBox(height: TSizes.spaceBtwItems,),
                  ReadMoreText(
                    product.description ?? '',
                    trimLines: 2,
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                    trimMode: TrimMode.Line,
                    trimCollapsedText: 'Xem thêm',
                    trimExpandedText: 'Ẩn bớt',
                    moreStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.w900, color: TColors.primary),
                    lessStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.w900, color: TColors.primary),
                  ),

                  /// - Đánh giá
                  const Divider(),
                  const SizedBox(height: TSizes.spaceBtwItems,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const TSectionHeading(title: 'Đánh giá (199)', showActionButton: false,),
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
