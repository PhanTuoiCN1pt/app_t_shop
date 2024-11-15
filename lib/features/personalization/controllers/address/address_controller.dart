import 'package:app_t_shop/data/repositories/user/address/address_repository.dart';
import 'package:app_t_shop/features/personalization/models/address_model.dart';
import 'package:app_t_shop/utils/popups/loaders.dart';
import 'package:get/get.dart';

class AddressController extends GetxController{
  static AddressController get instance => Get.find();

  final Rx<AddressModel> selectedAddress = AddressModel.empty().obs;
  final addressRepository = Get.put(AddressRepository());


  Future<List<AddressModel>> getAllUserAddress() async {
    try {
      final address = await addressRepository.fetchUserAddress();
      selectedAddress.value = address.firstWhere((element) => element.selectedAddress, orElse: () => AddressModel.empty());
      return address;
    }catch (e) {
      TLoaders.errorSnackBar(title: 'Không tìm thấy địa chỉ!');
      return [];
    }
  }

  Future selectAddress(AddressModel newSelectedAddress) async {
    try{

    }catch (e) {

    }
  }
}