import 'package:app_t_shop/common/widgets/images/rounded_container.dart';
import 'package:app_t_shop/common/widgets/products/ratings/rating_indicator.dart';
import 'package:app_t_shop/features/shop/models/review_model.dart';
import 'package:app_t_shop/utils/constants/colors.dart';
import 'package:app_t_shop/utils/constants/sizes.dart';
import 'package:app_t_shop/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:readmore/readmore.dart';

import '../../../models/user_service.dart';

class UserReviewCard extends StatelessWidget {
  final ReviewModel review;

  const UserReviewCard({super.key, required this.review});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    final formattedDate = DateFormat('dd/MM/yyyy').format(review.createdAt as DateTime);

    return FutureBuilder(
      future: UserService.getUserById(review.userId),
      builder: (context, snapshot) {
        if (!snapshot.hasData) return const SizedBox(); // Or loading indicator

        final user = snapshot.data!;
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Avatar + Tên người dùng
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    CircleAvatar(backgroundImage: NetworkImage(user.avatarUrl), radius: 20),
                    const SizedBox(width: TSizes.spaceBtwItems),
                    Text(user.name, style: Theme.of(context).textTheme.titleLarge),
                  ],
                ),
                IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert)),
              ],
            ),
            const SizedBox(height: TSizes.spaceBtwItems),

            /// Rating + Date
            Row(
              children: [
                TRatingBarIndicator(rating: review.rating),
                const SizedBox(width: TSizes.spaceBtwItems),
                Text(formattedDate, style: Theme.of(context).textTheme.bodyMedium),
              ],
            ),
            const SizedBox(height: TSizes.spaceBtwItems),

            /// Nội dung đánh giá
            ReadMoreText(
              review.reviewText,
              trimLines: 2,
              trimMode: TrimMode.Line,
              trimExpandedText: ' bớt',
              trimCollapsedText: ' thêm',
              moreStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.w900, color: TColors.primary),
              lessStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.w900, color: TColors.primary),
            ),
            const SizedBox(height: TSizes.spaceBtwItems),

            /// Feedback cửa hàng (nếu có)
            if (review.shopReply != null && review.shopReply!.isNotEmpty)
              TRoundedContainer(
                backgroundColor: dark ? TColors.darkerGrey : TColors.grey,
                child: Padding(
                  padding: const EdgeInsets.all(TSizes.md),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Phản hồi cửa hàng", style: Theme.of(context).textTheme.titleMedium),
                          Text(formattedDate, style: Theme.of(context).textTheme.bodyMedium),
                        ],
                      ),
                      const SizedBox(height: TSizes.spaceBtwItems),
                      ReadMoreText(
                        review.shopReply!,
                        trimLines: 2,
                        trimMode: TrimMode.Line,
                        trimExpandedText: ' bớt',
                        trimCollapsedText: ' thêm',
                        moreStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.w900, color: TColors.primary),
                        lessStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.w900, color: TColors.primary),
                      ),
                    ],
                  ),
                ),
              ),
            const SizedBox(height: TSizes.spaceBtwItems),
          ],
        );
      },
    );
  }
}
