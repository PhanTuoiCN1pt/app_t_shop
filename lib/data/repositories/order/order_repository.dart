import 'package:app_t_shop/data/repositories/authentication/authentication_repository.dart';
import 'package:app_t_shop/features/shop/models/order_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class OrderRepository extends GetxController {
  static OrderRepository get instance => Get.find();

  final _db = FirebaseFirestore.instance;

  /// Lấy tất cả đơn hàng của user
  Future<List<OrderModel>> fetchUserOrders() async {
    try {
      final userId = AuthenticationRepository.instance.authUser!.uid;
      if (userId.isEmpty) throw 'Doi trong giay lat';

      final result = await _db
          .collection('Users')
          .doc(userId)
          .collection('Orders')
          .get();

      return result.docs
          .map((documentSnapshot) => OrderModel.fromSnapshot(documentSnapshot))
          .toList();
    } catch (e) {
      throw 'Thi thoảng sẽ có vấn đề, vui lòng chờ trong giây lát';
    }
  }

  /// Lưu đơn hàng mới
  Future<void> saveOrder(OrderModel order, String userId) async {
    try {
      await _db
          .collection('Users')
          .doc(userId)
          .collection('Orders')
          .add(order.toJson());
    } catch (e) {
      throw 'Thi thoảng sẽ có lỗi, vui lòng đợi trong giây lát';
    }
  }

  /// 🔴 Hủy đơn hàng bằng cách cập nhật trạng thái
  Future<void> cancelOrder({
    required String orderId,
    required String userId,
  }) async {
    try {
      final query = await _db
          .collection('Users')
          .doc(userId)
          .collection('Orders')
          .where('id', isEqualTo: orderId)
          .get();

      if (query.docs.isEmpty) throw 'Không tìm thấy đơn hàng để hủy';

      final docId = query.docs.first.id;

      await _db
          .collection('Users')
          .doc(userId)
          .collection('Orders')
          .doc(docId)
          .update({'status': 'OrderStatus.canceled'});
    } catch (e) {
      throw 'Không thể hủy đơn hàng vào lúc này.';
    }
  }
}
