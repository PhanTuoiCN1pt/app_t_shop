import 'package:app_t_shop/features/shop/controllers/review_controller.dart';
import 'package:app_t_shop/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class RatingAndShare extends StatelessWidget {
  const RatingAndShare({super.key});

  @override
  Widget build(BuildContext context) {
    final reviewController = Get.put(ReviewController());

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        /// Rating
        Obx(() {
          final avg = reviewController.averageRating.toStringAsFixed(1);
          final count = reviewController.reviews.length;
          return Row(
            children: [
              const Icon(Iconsax.star5, color: Colors.amber, size: 24),
              const SizedBox(width: TSizes.spaceBtwItems / 2),
              Text(
                '$avg ($count lượt đánh giá)',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ],
          );
        }),

        /// Share Button
        IconButton(
          onPressed: () {
            // TODO: Add sharing logic
          },
          icon: const Icon(Icons.share, size: TSizes.iconMd),
        ),
      ],
    );
  }
}
