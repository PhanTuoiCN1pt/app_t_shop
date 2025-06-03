import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import '../models/review_model.dart';

class ReviewController extends GetxController {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  /// Danh sách đánh giá
  final RxList<ReviewModel> reviews = <ReviewModel>[].obs;

  /// Loading state (tuỳ chọn)
  final RxBool isLoading = false.obs;

  /// Lấy danh sách đánh giá theo productId
  Future<void> fetchReviewsByProduct(String productId) async {
    try {
      isLoading.value = true;

      final snapshot = await _db
          .collection('Reviews')
          .where('productId', isEqualTo: productId)
          .get();

      final reviewList = snapshot.docs.map((doc) {
        return ReviewModel.fromMap(doc.data(), doc.id);
      }).toList();

      reviews.assignAll(reviewList);
    } catch (e) {
      Get.snackbar("Lỗi", "Không thể tải đánh giá.");
      print('fetchReviewsByProduct error: $e');
    } finally {
      isLoading.value = false;
    }
  }

  /// Thêm đánh giá mới
  Future<void> addReview(ReviewModel review) async {
    try {
      await _db.collection('Reviews').add(review.toMap());

      // Tải lại danh sách đánh giá sau khi thêm
      await fetchReviewsByProduct(review.productId);
    } catch (e) {
      Get.snackbar("Lỗi", "Không thể thêm đánh giá.");
      print('addReview error: $e');
    }
  }

  Future<void> updateReview(String reviewId, String newText, double newRating) async {
    try {
      await _db.collection('Reviews').doc(reviewId).update({
        'reviewText': newText,
        'rating': newRating,
      });

      // Cập nhật lại danh sách (tùy bạn có cần refresh hay không)
      final updatedIndex = reviews.indexWhere((r) => r.id == reviewId);
      if (updatedIndex != -1) {
        final old = reviews[updatedIndex];
        reviews[updatedIndex] = ReviewModel(
          id: reviewId,
          userId: old.userId,
          productId: old.productId,
          rating: newRating,
          reviewText: newText,
          shopReply: old.shopReply,
          createdAt: old.createdAt,
        );
      }
    } catch (e) {
      Get.snackbar("Lỗi", "Không thể cập nhật đánh giá.");
      print("updateReview error: $e");
    }
  }

  Future<void> deleteReview(String reviewId) async {
    try {
      await _db.collection('Reviews').doc(reviewId).delete();
      reviews.removeWhere((r) => r.id == reviewId);
    } catch (e) {
      Get.snackbar("Lỗi", "Không thể xoá đánh giá.");
      print("deleteReview error: $e");
    }
  }


  double get averageRating {
    if (reviews.isEmpty) return 0.0;
    final total = reviews.fold(0.0, (sum, r) => sum + r.rating);
    return total / reviews.length;
  }

  Map<int, int> get ratingDistribution {
    final Map<int, int> dist = {1: 0, 2: 0, 3: 0, 4: 0, 5: 0};
    for (var r in reviews) {
      final key = r.rating.round().clamp(1, 5);
      dist[key] = (dist[key] ?? 0) + 1;
    }
    return dist;
  }



  /// Kiểm tra người dùng đã từng mua sản phẩm này chưa
  Future<bool> hasPurchasedProduct(String userId, String productId) async {
    try {
      print('🔍 Kiểm tra đơn hàng cho userId: $userId với sản phẩm: $productId');

      final orderSnapshot = await FirebaseFirestore.instance
          .collection('Users')
          .doc(userId)
          .collection('Orders')
          .where('status', isEqualTo: 'OrderStatus.delivered')
          .get();

      print('📦 Số đơn hàng đã giao: ${orderSnapshot.docs.length}');

      for (final doc in orderSnapshot.docs) {
        final data = doc.data();
        final items = List<Map<String, dynamic>>.from(data['items'] ?? []);
        for (final item in items) {
          print('🧾 Sản phẩm trong đơn: ${item['productId']}');
        }

        final found = items.any((item) => item['productId'] == productId);
        if (found) {
          print('✅ Đã mua sản phẩm $productId');
          return true;
        }
      }

      print('❌ Không tìm thấy sản phẩm trong đơn hàng đã giao.');
      return false;
    } catch (e, stack) {
      print('🚨 Lỗi kiểm tra đơn hàng: $e');
      print(stack);
      return false;
    }
  }





}
