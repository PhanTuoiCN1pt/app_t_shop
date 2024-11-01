import 'package:app_t_shop/common/widgets/texts/section_heading.dart';
import 'package:app_t_shop/features/shop/models/product_model.dart';
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
  const ProductDetail({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Scaffold(
      bottomNavigationBar: const BottomAddToCart(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            /// 1 - Bộ trượt hình ảnh sản phẩm
            const ProductImageSlider(),

            /// 2 - Chi tiết sản phẩm
            Padding(
              padding: const EdgeInsets.only(right: TSizes.defaultSpace, left: TSizes.defaultSpace, bottom: TSizes.defaultSpace),
              child: Column(
                children: [
                  /// - Đánh giá & Chia sẻ
                  const RatingAndShare(),

                  /// - Giá, Tiêu đề, Tồn kho, Thương hiệu
                  const ProductMetaData(),

                  /// - Thuộc tính
                  const ProductAttributes(),
                  const SizedBox(height: TSizes.spaceBtwItems,),

                  /// - Nút Thanh toán
                  SizedBox(width: double.infinity, child: ElevatedButton(onPressed: (){}, child: const Text('Thanh toán')),),
                  const SizedBox(height: TSizes.spaceBtwItems,),

                  /// - Mô tả
                  const TSectionHeading(title: 'Mô tả', showActionButton: false,),
                  const SizedBox(height: TSizes.spaceBtwItems,),
                  const ReadMoreText(
                    'Đây là mô tả sản phẩm cho áo ba lỗ Nike màu xanh. Có nhiều thông tin khác có thể được thêm vào, nhưng tôi ',
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
