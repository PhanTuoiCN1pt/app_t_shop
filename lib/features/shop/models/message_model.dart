import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class MessageModel {
  final String id;
  final String userId;
  final String productId;
  final String message;
  final DateTime timestamp;

  MessageModel({
    required this.id,
    required this.userId,
    required this.productId,
    required this.message,
    required this.timestamp,
  });

  factory MessageModel.fromMap(Map<String, dynamic> map, String id) {
    return MessageModel(
      id: id,
      userId: map['userId'] ?? '',
      productId: map['productId'] ?? '',
      message: map['message'] ?? '',
      timestamp: (map['timestamp'] as Timestamp).toDate(),
    );
  }

  bool get isUser {
    final currentUserId = FirebaseAuth.instance.currentUser?.uid;
    return userId == currentUserId;
  }

  String get text => message;
}
