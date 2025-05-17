import 'package:app_t_shop/common/widgets/appbar/appbar.dart';
import 'package:app_t_shop/features/personalization/controllers/address/address_controller.dart';
import 'package:app_t_shop/features/personalization/screens/address/address.dart';
import 'package:app_t_shop/features/personalization/screens/address/widgets/single_address.dart';
import 'package:app_t_shop/utils/constants/colors.dart';
import 'package:app_t_shop/utils/constants/sizes.dart';
import 'package:app_t_shop/utils/validators/validation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:iconsax/iconsax.dart';

class AddNewAddressScreen extends StatelessWidget {
  const AddNewAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = AddressController.instance;

    return Scaffold(
      appBar: const TAppBar(
        showBackArrow: true,
        title: Text('Thêm địa chỉ mới'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Form(
            key: controller.addressForKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFormField(
                  controller: controller.name,
                  validator: (value)=> TValidator.validateEmptyText('Tên', value),
                  decoration: const InputDecoration(prefixIcon: Icon(Iconsax.user_add), labelText: 'Tên'),
                ),
                const SizedBox(height: TSizes.spaceBtwInputFields,),
                TextFormField(
                  controller: controller.phoneNumber,
                  validator: TValidator.validatePhoneNumber,
                  decoration: const InputDecoration(prefixIcon: Icon(Iconsax.mobile),labelText: 'Số điện thoại'),
                ),
                const SizedBox(height: TSizes.spaceBtwInputFields,),
                TextFormField(
                  controller: controller.postalCode,
                  validator: (value) => TValidator.validateEmptyText('Mã bưu điện(Không bắt buộc)', value),
                  decoration: const InputDecoration(prefixIcon: Icon(Iconsax.code),labelText: 'Mã bưu điện(Không bắt buộc)'),
                ),
                const SizedBox(height: TSizes.spaceBtwInputFields,),
                Row(
                  children: [
                    Expanded(
                        child: TextFormField(
                          controller: controller.street,
                          validator: (value) => TValidator.validateEmptyText('Địa chỉ', value),
                          decoration: const InputDecoration(prefixIcon: Icon(Iconsax.location),labelText: 'Địa chỉ'),
                        )
                    ),
                  ],
                ),
                const SizedBox(height: TSizes.spaceBtwInputFields,),
                TextFormField(
                  controller: controller.city,
                  validator: (value) => TValidator.validateEmptyText('Tỉnh/Thành phố', value),
                  decoration: const InputDecoration(prefixIcon: Icon(Iconsax.building), labelText: 'Tỉnh/Thành phố'),
                ),
                const SizedBox(height: TSizes.spaceBtwInputFields,),
                Row(
                  children: [
                    Expanded(
                        child: TextFormField(
                          controller: controller.state,
                          validator: (value) => TValidator.validateEmptyText('Quận/Huyện', value),
                          decoration: const InputDecoration(prefixIcon: Icon(Iconsax.activity),labelText: 'Quận/Huyện'),
                        )
                    ),
                    const SizedBox(width: TSizes.spaceBtwInputFields,),
                    Expanded(
                        child: TextFormField(
                          controller: controller.country,
                          validator: (value) => TValidator.validateEmptyText('Phường/Xã', value),
                          decoration: const InputDecoration(prefixIcon: Icon(Iconsax.map),labelText: 'Phường/Xã'),
                        )
                    ),
                  ],
                ),
                const SizedBox(height: TSizes.spaceBtwInputFields*3,),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: TColors.colorApp,
                      side: const BorderSide(color: TColors.colorApp),
                    ),
                    onPressed: () => controller.addNewAddresses(),
                    child: const Text('Lưu'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
