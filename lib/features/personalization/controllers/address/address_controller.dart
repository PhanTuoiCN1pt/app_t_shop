import 'package:app_t_shop/common/widgets/texts/section_heading.dart';
import 'package:app_t_shop/data/repositories/address/address_repository.dart';
import 'package:app_t_shop/features/personalization/models/address_model.dart';
import 'package:app_t_shop/features/personalization/screens/address/add_new_address.dart';
import 'package:app_t_shop/features/personalization/screens/address/widgets/single_address.dart';
import 'package:app_t_shop/utils/constants/image_strings.dart';
import 'package:app_t_shop/utils/constants/sizes.dart';
import 'package:app_t_shop/utils/helpers/cloud_helper_functions.dart';
import 'package:app_t_shop/utils/helpers/network_manager.dart';
import 'package:app_t_shop/utils/popups/full_screen_loader.dart';
import 'package:app_t_shop/utils/popups/loaders.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddressController extends GetxController{
  static AddressController get instance => Get.find();

  final name = TextEditingController();
  final phoneNumber = TextEditingController();
  final street = TextEditingController();
  final postalCode = TextEditingController();
  final city = TextEditingController();
  final state = TextEditingController();
  final country = TextEditingController();
  GlobalKey<FormState> addressForKey = GlobalKey<FormState>();

  RxBool refreshData = true.obs;
  final Rx<AddressModel> selectedAddress = AddressModel.empty().obs;
  final addressRepository = Get.put(AddressRepository());


  Future<List<AddressModel>> getAllUserAddresses() async {
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
      if(selectedAddress.value.id.isNotEmpty){
        await addressRepository.updateSelectedField(selectedAddress.value.id, false);
      }
      newSelectedAddress.selectedAddress = true;
      selectedAddress.value = newSelectedAddress;

      await addressRepository.updateSelectedField(selectedAddress.value.id, true);
    }catch (e) {
      TLoaders.errorSnackBar(title: "Lỗi chưa chọn địa chỉ",message: e.toString());
    }
  }
  /// Thêm địa chỉ mới
  Future addNewAddresses() async{
    try{
      TFullScreenLoader.openLoadingDialog('Đang thêm địa chỉ', TImages.docerAnimation);

      final isConnected = await NetworkManager.instance.isConnected();
      if(!isConnected){
        TFullScreenLoader.stopLoading();
        return;
      }

      if(!addressForKey.currentState!.validate()){
        TFullScreenLoader.stopLoading();
        return;
      }

      // Lưu địa chỉ
      final address = AddressModel(
          id: '',
          name: name.text.trim(),
          phoneNumber: phoneNumber.text.trim(),
          street: street.text.trim(),
          city: city.text.trim(),
          state: state.text.trim(),
          postalCode: postalCode.text.trim(),
          country: country.text.trim(),
          selectedAddress: true,
      );
      final id = await addressRepository.addAddress(address);

      // Cập nhật trạng thái địa chỉ đã chọn
      address.id = id;
      await selectAddress(address);

      TFullScreenLoader.stopLoading();

      TLoaders.successSnackBar(title: 'Thêm địa chỉ thành công', message: 'Địa chỉ của bạn đã được thêm thành công!');

      refreshData.toggle();

      resetFormFields();

      Navigator.of(Get.context!).pop();

    }catch(e){
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: 'Lỗi', message: e.toString());
    }
  }
  ///  Hiển thị địa chỉ mới
  Future<dynamic> selectedNewAddressPopup(BuildContext context){
    return showModalBottomSheet(
        context: context,
        builder: (_) => Container(
          padding: EdgeInsets.all(TSizes.lg),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const TSectionHeading(title: 'Chọn địa chỉ'),
              FutureBuilder(
                  future: getAllUserAddresses(),
                  builder: (_, snapshot){
                    final response = TCloudHelperFunctions.checkMultiRecordState(snapshot: snapshot);
                    if(response != null) return response;

                    return ListView.builder(
                      shrinkWrap: true,
                      itemCount: snapshot.data!.length,
                      itemBuilder: (_, index) => SingleAddress(
                        address: snapshot.data![index],
                          onTap: () async{
                            await selectAddress(snapshot.data![index]);
                            Get.back();
                          },
                      ),
                    );
                  }
              ),
              SizedBox(height: TSizes.defaultSpace * 2,),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(onPressed: () => Get.to(() => AddNewAddressScreen()), child: Text('Thêm địa chỉ')),
              ),
            ],
          ),
        )
    );
  }
  void resetFormFields(){
    name.clear();
    phoneNumber.clear();
    street.clear();
    postalCode.clear();
    city.clear();
    country.clear();
    state.clear();
    addressForKey.currentState?.reset();
  }
}