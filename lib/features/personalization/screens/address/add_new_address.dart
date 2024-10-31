import 'package:app_t_shop/common/widgets/appbar/appbar.dart';
import 'package:app_t_shop/utils/constants/colors.dart';
import 'package:app_t_shop/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class AddNewAddressScreen extends StatelessWidget {
  const AddNewAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TAppBar(
        showBackArrow: true,
        title: Text('Thêm địa chỉ mới'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Form(
            child: Column(
              children: [
                TextFormField(decoration: const InputDecoration(prefixIcon: Icon(Iconsax.user),labelText: 'Tên'),),
                const SizedBox(height: TSizes.spaceBtwInputFields,),
                TextFormField(decoration: const InputDecoration(prefixIcon: Icon(Iconsax.mobile),labelText: 'Số điện thoại'),),
                const SizedBox(height: TSizes.spaceBtwInputFields,),
                Row(
                  children: [
                    Expanded(child: TextFormField(decoration: const InputDecoration(prefixIcon: Icon(Iconsax.building_31), labelText: 'Địa chỉ'),)),
                    const SizedBox(width: TSizes.spaceBtwInputFields,),
                    Expanded(child: TextFormField(decoration: const InputDecoration(prefixIcon: Icon(Iconsax.code),labelText: 'Mã bưu điện'),)),
                  ],
                ),
                const SizedBox(height: TSizes.spaceBtwInputFields,),
                Row(
                  children: [
                    Expanded(child: TextFormField(decoration: const InputDecoration(prefixIcon: Icon(Iconsax.building), labelText: 'Thành phố'),)),
                    const SizedBox(width: TSizes.spaceBtwInputFields,),
                    Expanded(child: TextFormField(decoration: const InputDecoration(prefixIcon: Icon(Iconsax.activity),labelText: 'Huyện'),)),
                  ],
                ),
                const SizedBox(height: TSizes.spaceBtwInputFields,),
                TextFormField(decoration: const InputDecoration(prefixIcon: Icon(Iconsax.global),labelText: 'Quốc gia'),),
                const SizedBox(height: TSizes.spaceBtwInputFields,),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: TColors.colorApp,
                      side: const BorderSide(color: TColors.colorApp),
                    ),
                    onPressed: (){},
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
