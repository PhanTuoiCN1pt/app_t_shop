import 'package:app_t_shop/common/widgets/appbar/appbar.dart';
import 'package:app_t_shop/features/personalization/controllers/address/address_controller.dart';
import 'package:app_t_shop/features/personalization/screens/address/add_new_address.dart';
import 'package:app_t_shop/features/personalization/screens/address/widgets/single_address.dart';
import 'package:app_t_shop/utils/constants/colors.dart';
import 'package:app_t_shop/utils/constants/sizes.dart';
import 'package:app_t_shop/utils/helpers/cloud_helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class UserAddressScreen extends StatelessWidget {
  const UserAddressScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AddressController());
    return Scaffold(
      appBar: TAppBar(showBackArrow: true, title: Text('Địa chỉ',style: Theme.of(context).textTheme.headlineSmall,),),
      body:  SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(TSizes.defaultSpace),
          child: Obx(
              () => FutureBuilder(
              //Sử dụng key để làm mới
              key: Key(controller.refreshData.value.toString()),
                future: controller.getAllUserAddresses(),
                builder: (context, snapshot){
                  final response = TCloudHelperFunctions.checkMultiRecordState(snapshot: snapshot);
                  if (response != null) return response;
            
                  final addresses = snapshot.data!;
                  return ListView.builder(
                    shrinkWrap: true,
                    itemCount: addresses.length,
                    itemBuilder: (_, index) => SingleAddress(
                      address: addresses[index],
                      onTap: () => controller.selectAddress(addresses[index]),
                    ),
                  );
                }
            ),
          )
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: TColors.colorApp,
        onPressed: () => Get.to(() => const AddNewAddressScreen()),
        child: const Icon(Iconsax.add,color: TColors.white,),
      ),
    );
  }
}