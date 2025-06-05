import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import '../../models/message_model.dart';
import '../../models/product_model.dart';

class ChatController extends GetxController {
  static ChatController get instance => Get.find();

  final FirebaseFirestore _db = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  RxList<MessageModel> messages = <MessageModel>[].obs;

  /// Gửi tin nhắn sản phẩm đến Admin
  Future<void> sendProductMessage({
    required ProductModel product,
    required String message,
  }) async {
    try {
      final user = _auth.currentUser;
      final userId = user?.uid ?? 'guest';

      final msg = {
        'userId': userId,
        'productId': product.id,
        'productName': product.title,
        'thumbnail': product.thumbnail,
        'message': message,
        'timestamp': Timestamp.now(),
      };

      final doc = await _db.collection('messages').add(msg);

      messages.add(MessageModel.fromMap(msg, doc.id));

    } catch (e) {
      Get.snackbar('Lỗi', 'Không thể gửi tin nhắn: $e');
    }
  }

  void reset() {
    messages.clear();
  }


  /// Lấy danh sách tin nhắn của sản phẩm
  Future<void> loadMessages(String productId) async {
    final snapshot = await _db
        .collection('messages')
        .where('productId', isEqualTo: productId)
        .orderBy('timestamp', descending: false)
        .get();

    final loaded = snapshot.docs.map((doc) {
      return MessageModel.fromMap(doc.data(), doc.id);
    }).toList();

    messages.assignAll(loaded);
  }

  Future<void> ensureUserLoggedIn() async {
    if (_auth.currentUser == null) {
      await _auth.signInAnonymously();
    }
  }
}
