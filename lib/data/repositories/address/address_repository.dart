import 'package:app_t_shop/data/repositories/authentication/authentication_repository.dart';
import 'package:app_t_shop/features/personalization/models/address_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class AddressRepository extends GetxController {
  static AddressRepository get instance => Get.find();

  final _db = FirebaseFirestore.instance;

  Future<List<AddressModel>> fetchUserAddress() async {

    try {
      final userId = AuthenticationRepository.instance.authUser!.uid;
      if(userId.isEmpty) throw 'Không tìm thấy dữ liệu. Vui lòng kiểm tra lại.';

      final result = await _db.collection('Users').doc(userId).collection('Addresses').get();
      return result.docs.map((documentSnapshot) => AddressModel.fromDocumentSnapshot(documentSnapshot)).toList();
    }catch (e) {
      throw 'Đôi khi sẽ có lỗi. Vui lòng kiểm tra lại.';
    }
  }

  Future<void> updateSelectedField(String addressId, bool selected) async{
    try{
      final userId = AuthenticationRepository.instance.authUser!.uid;
      await _db.collection('Users').doc(userId).collection('Addresses').doc(addressId).update({'SelectedAddress': selected});
    }catch(e){
      throw 'Không thể đổi địa chỉ mà bạn đã chọn. Hãy thử lại';
    }
  }

  Future<String> addAddress(AddressModel address) async{
    try{
      final userId = AuthenticationRepository.instance.authUser!.uid;
      final currentAddress = await _db.collection('Users').doc(userId).collection('Addresses').add(address.toJson());
      return currentAddress.id;
    }catch(e){
      throw 'Vui lòng thử lại';
    }
  }
}