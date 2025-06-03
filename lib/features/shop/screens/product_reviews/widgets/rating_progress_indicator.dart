import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:app_t_shop/features/shop/controllers/review_controller.dart';
import 'package:app_t_shop/features/shop/screens/product_reviews/widgets/progress_indicator_and_rating.dart';

class TOverallProductRating extends StatelessWidget {
  const TOverallProductRating({super.key});

  @override
  Widget build(BuildContext context) {
    final reviewController = Get.find<ReviewController>();

    return Obx(() {
      final average = reviewController.averageRating;
      final totalReviews = reviewController.reviews.length;
      final distribution = reviewController.ratingDistribution;

      return Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            flex: 3,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  average.toStringAsFixed(1),
                  style: Theme.of(context).textTheme.displayLarge,
                ),
              ],
            ),
          ),
          Expanded(
            flex: 7,
            child: Column(
              children: List.generate(5, (index) {
                final star = 5 - index;
                final count = distribution[star] ?? 0;
                final value = totalReviews > 0 ? count / totalReviews : 0.0;

                return TRatingProgressIndicator(
                  text: star.toString(),
                  value: value,
                );
              }),
            ),
          ),
        ],
      );
    });
  }
}
