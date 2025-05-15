import 'package:app_t_shop/data/repositories/authentication/authentication_repository.dart';
import 'package:app_t_shop/features/shop/models/order_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class OrderRepository extends GetxController {
  static OrderRepository get instance => Get.find();

  final _db = FirebaseFirestore.instance;

  Future<List<OrderModel>> fetchUserOrders() async {
    try {
      final user = AuthenticationRepository.instance.authUser;
      if (user == null || user.uid.isEmpty) {
        throw 'Không hiển thị thông tin người dùng, vui lòng đợi trong giây lát';
      }

      final result = await _db
          .collection('Users')
          .doc(user.uid)
          .collection('Orders')
          .get();

      return result.docs
          .map((documentSnapshot) => OrderModel.fromSnapshot(documentSnapshot))
          .toList();
    } catch (e) {
      throw 'Thi thoảng sẽ có vấn đề, vui lòng chờ trong giây lát';
    }
  }


  Future<void> saveOrder(OrderModel order, String userId) async{
    try{
      await _db.collection('Users').doc(userId).collection('Orders').add(order.toJson());
    }catch(e){
      throw 'Thi thoảng sẽ có lỗi, vui lòng đợi trong giây lát';
    }
  }
}