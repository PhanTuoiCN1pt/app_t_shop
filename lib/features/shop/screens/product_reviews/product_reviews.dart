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
        title: Text('Reviews & Rating',style: Theme.of(context).textTheme.headlineMedium,),
        showBackArrow: true,
      ),

      /// Body
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Ratings and resdf sjsdff fjklasdj awjsks fsjdfs we adhai nadaq afhwansawdwh hqwhdqw adhhq'),
              const SizedBox(height: TSizes.spaceBtwItems,),

              /// Overall Product Rating
              const TOverallProductRating(),
              const TRatingBarIndicator(rating: 4.5,),
              Text("12,611",style: Theme.of(context).textTheme.bodySmall,),
              const SizedBox(height: TSizes.spaceBtwItems,),

              /// User Reviews List
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



