import 'package:cloud_firestore/cloud_firestore.dart';

class ReviewModel {
  final String id;
  final String userId;
  final String productId;
  final double rating;
  final String reviewText;
  final String shopReply;
  final DateTime createdAt;

  ReviewModel({
    required this.id,
    required this.userId,
    required this.productId,
    required this.rating,
    required this.reviewText,
    required this.shopReply,
    required this.createdAt,
  });

  factory ReviewModel.fromMap(Map<String, dynamic> data, String docId) {
    return ReviewModel(
      id: docId,
      userId: data['userId'] ?? '',
      productId: data['productId'] ?? '',
      rating: (data['rating'] ?? 0).toDouble(),
      reviewText: data['reviewText'] ?? '',
      shopReply: data['shopReply'] ?? '',
      createdAt: (data['createdAt'] as Timestamp).toDate(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'userId': userId,
      'productId': productId,
      'rating': rating,
      'reviewText': reviewText,
      'shopReply': shopReply,
      'createdAt': Timestamp.fromDate(createdAt),
    };
  }
}
