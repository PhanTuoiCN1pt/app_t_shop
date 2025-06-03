import 'package:app_t_shop/common/widgets/appbar/appbar.dart';
import 'package:app_t_shop/common/widgets/products/ratings/rating_indicator.dart';
import 'package:app_t_shop/features/shop/controllers/review_controller.dart';
import 'package:app_t_shop/features/shop/models/review_model.dart';
import 'package:app_t_shop/features/shop/screens/product_reviews/widgets/rating_progress_indicator.dart';
import 'package:app_t_shop/features/shop/screens/product_reviews/widgets/user_review_card.dart';
import 'package:app_t_shop/utils/constants/sizes.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';

class ProductReviewsScreen extends StatefulWidget {
  final String productId;

  const ProductReviewsScreen({super.key, required this.productId});

  @override
  State<ProductReviewsScreen> createState() => _ProductReviewsScreenState();
}

class _ProductReviewsScreenState extends State<ProductReviewsScreen> {
  final ReviewController reviewController = Get.put(ReviewController());
  bool _canReview = false;
  bool _loadingPermission = true;

  @override
  void initState() {
    super.initState();
    _checkPermissionAndLoad();
  }

  Future<void> _checkPermissionAndLoad() async {
    final userId = FirebaseAuth.instance.currentUser!.uid;
    final result = await reviewController.hasPurchasedProduct(userId, widget.productId);
    setState(() {
      _canReview = result;
      _loadingPermission = false;
    });

    await reviewController.fetchReviewsByProduct(widget.productId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(
        title: Text('Đánh giá', style: Theme.of(context).textTheme.headlineMedium),
        showBackArrow: true,
      ),
      body: Obx(() {
        final reviews = reviewController.reviews;

        return Stack(
          children: [
            SingleChildScrollView(
              padding: const EdgeInsets.all(TSizes.defaultSpace),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Đánh giá và nhận xét của người mua hàng.'),
                  const SizedBox(height: TSizes.spaceBtwItems),

                  const TOverallProductRating(),
                  TRatingBarIndicator(rating: reviewController.averageRating),
                  Text(" ${reviews.length} đánh giá", style: Theme.of(context).textTheme.bodySmall),
                  const SizedBox(height: TSizes.spaceBtwItems),

                  ...reviews.map((review) => UserReviewCard(review: review)),
                  const SizedBox(height: 80),
                ],
              ),
            ),

            if (!_loadingPermission && _canReview)
              Positioned(
                bottom: 16,
                right: 16,
                child: FloatingActionButton.extended(
                  onPressed: () {
                    _showReviewDialog(context);
                  },
                  icon: const Icon(Icons.rate_review),
                  label: const Text("Viết đánh giá"),
                ),
              ),
          ],
        );
      }),
    );
  }

  void _showReviewDialog(BuildContext context) {
    final rating = RxDouble(5.0);
    final reviewTextController = TextEditingController();
    final userId = FirebaseAuth.instance.currentUser!.uid;

    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text("Viết đánh giá"),
        content: SizedBox(
          width: MediaQuery.of(context).size.width * 0.9,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Obx(() => RatingBar.builder(
                initialRating: rating.value,
                minRating: 0,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemCount: 5,
                itemSize: 30,
                itemBuilder: (context, _) => const Icon(Icons.star, color: Colors.amber),
                onRatingUpdate: (value) => rating.value = value,
              )),
              const SizedBox(height: 16),
              TextField(
                controller: reviewTextController,
                decoration: const InputDecoration(
                  labelText: "Nội dung đánh giá",
                  border: OutlineInputBorder(),
                ),
                maxLines: 5,
                minLines: 3,
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            child: const Text("Huỷ"),
            onPressed: () => Navigator.pop(context),
          ),
          ElevatedButton(
            child: const Text("Gửi"),
            onPressed: () async {
              final review = ReviewModel(
                id: '',
                productId: widget.productId,
                userId: userId,
                rating: rating.value,
                reviewText: reviewTextController.text,
                shopReply: '',
                createdAt: DateTime.now(),
              );

              await reviewController.addReview(review);
              Navigator.pop(context);
              setState(() {}); // để cập nhật giao diện nếu cần
            },
          ),
        ],
      ),
    );
  }
}


