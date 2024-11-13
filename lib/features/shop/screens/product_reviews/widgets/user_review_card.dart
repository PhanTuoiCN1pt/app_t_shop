import 'package:app_t_shop/common/widgets/images/rounded_container.dart';
import 'package:app_t_shop/common/widgets/products/ratings/rating_indicator.dart';
import 'package:app_t_shop/utils/constants/colors.dart';
import 'package:app_t_shop/utils/constants/image_strings.dart';
import 'package:app_t_shop/utils/constants/sizes.dart';
import 'package:app_t_shop/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

class UserReviewCard extends StatelessWidget {
  const UserReviewCard({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                const CircleAvatar(backgroundImage: AssetImage(TImages.logoApp),),
                const SizedBox(width: TSizes.spaceBtwItems,),
                Text('Phan Tươi', style: Theme.of(context).textTheme.titleLarge,),
              ],
            ),
            IconButton(onPressed: (){}, icon: const Icon(Icons.more_vert)),
          ],
        ),
        const SizedBox(width: TSizes.spaceBtwItems,),

        /// Đánh giá
        Row(
          children: [
            const TRatingBarIndicator(rating: 4),
            const SizedBox(width: TSizes.spaceBtwItems,),
            Text('24/07/2024', style: Theme.of(context).textTheme.bodyMedium,),
          ],
        ),
        const SizedBox(height: TSizes.spaceBtwItems,),
        const ReadMoreText(
          'Đánh giá của người dùng: Tôi rất hài lòng với sản phẩm này! Chất lượng giày tốt, đi rất êm và thoải mái. Màu sắc và kiểu dáng đúng như hình ảnh trên app, không có gì để chê. Đã mang giày đi chơi và tập thể dục vài lần, thấy rất bền và không có dấu hiệu bị hỏng. Giao hàng nhanh và đóng gói kỹ lưỡng. Sẽ tiếp tục mua sắm ở đây và giới thiệu cho bạn bè',
          trimLines: 2,
          trimMode: TrimMode.Line,
          trimExpandedText: ' bớt',
          trimCollapsedText: ' thêm',
          moreStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.w900,color: TColors.primary),
          lessStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.w900, color: TColors.primary),
        ),
        const SizedBox(height: TSizes.spaceBtwItems,),

        /// Đánh giá công ty
        TRoundedContainer(
          backgroundColor: dark ? TColors.darkerGrey : TColors.grey,
          child: Padding(
            padding: const EdgeInsets.all(TSizes.md),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Cửa hàng của T",style: Theme.of(context).textTheme.titleMedium,),
                    Text('24/07/2024',style: Theme.of(context).textTheme.bodyMedium,),
                  ],
                ),
                const SizedBox(height: TSizes.spaceBtwItems,),
                const ReadMoreText(
                  'Đánh giá công ty: nsdad adsd adkj skd ff sfw wqeh  kadj kajsdh asd kdjd akddj ad a adakda a adads adawk akdaskd aksdhh asdh adhhih  udhid  daidad ad lkajsdsa k s',
                  trimLines: 2,
                  trimMode: TrimMode.Line,
                  trimExpandedText: ' bớt',
                  trimCollapsedText: ' thêm',
                  moreStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.w900,color: TColors.primary),
                  lessStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.w900, color: TColors.primary),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: TSizes.spaceBtwItems,),
      ],
    );
  }
}
