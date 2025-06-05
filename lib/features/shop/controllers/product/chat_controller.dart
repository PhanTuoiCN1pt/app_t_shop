import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../../models/product_model.dart';

class ChatController extends GetxController {
  static ChatController get instance => Get.find();

  final FirebaseFirestore _db = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  /// Gửi tin nhắn sản phẩm đến Admin
  Future<void> sendProductMessage({
    required ProductModel product,
    required String message,
  }) async {
    try {
      final user = _auth.currentUser;
      final userId = user?.uid ?? 'guest';

      await _db.collection('messages').add({
        'userId': userId,
        'productId': product.id,
        'productName': product.title,
        'thumbnail': product.thumbnail,
        'message': message,
        'timestamp': Timestamp.now(),
      });

      Get.snackbar('Thành công', 'Tin nhắn đã được gửi cho Admin');
    } catch (e) {
      Get.snackbar('Lỗi', 'Không thể gửi tin nhắn: $e');
    }
  }

  Future<void> ensureUserLoggedIn() async {
    if (_auth.currentUser == null) {
      await _auth.signInAnonymously();
    }
  }

}
