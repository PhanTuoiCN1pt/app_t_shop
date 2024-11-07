import 'package:app_t_shop/common/widgets/appbar/appbar.dart';
import 'package:app_t_shop/common/widgets/products/ratings/rating_indicator.dart';
import 'package:app_t_shop/features/shop/screens/product_reviews/widgets/rating_progress_indicator.dart';
import 'package:app_t_shop/features/shop/screens/product_reviews/widgets/user_review_card.dart';
import 'package:app_t_shop/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class ProductReviewsScreen extends StatelessWidget {
  const ProductReviewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /// AppBar
      appBar: TAppBar(
        title: Text('Đánh giá', style: Theme.of(context).textTheme.headlineMedium,),
        showBackArrow: true,
      ),

      /// Body
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Đánh giá và nhận xét của người mua hàng.'),
              const SizedBox(height: TSizes.spaceBtwItems,),

              /// Đánh giá tổng thể sản phẩm
              const TOverallProductRating(),
              const TRatingBarIndicator(rating: 4.5,),
              Text("3,503", style: Theme.of(context).textTheme.bodySmall,),
              const SizedBox(height: TSizes.spaceBtwItems,),

              /// Danh sách đánh giá của người dùng
              const UserReviewCard(),
              const UserReviewCard(),
              const UserReviewCard(),
              const UserReviewCard(),
              const UserReviewCard(),
            ],
          ),
        ),
      ),
    );
  }
}
