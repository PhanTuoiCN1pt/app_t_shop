import 'package:app_t_shop/common/widgets/texts/section_heading.dart';
import 'package:app_t_shop/features/personalization/controllers/address/address_controller.dart';
import 'package:app_t_shop/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BillingAddressSection extends StatelessWidget {
  const BillingAddressSection({super.key});

  @override
  Widget build(BuildContext context) {
    final addressController = AddressController.instance;
    return Obx(() {
      final address = addressController.selectedAddress.value;

      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TSectionHeading(
            title: 'Địa chỉ nhận hàng',
            buttonTitle: 'Đổi',
            onPressed: () => addressController.selectedNewAddressPopup(context),
          ),
          address.id.isNotEmpty
              ? Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(address.name, style: Theme.of(context).textTheme.bodyMedium),
              const SizedBox(height: TSizes.spaceBtwItems / 2),
              Row(
                children: [
                  const Icon(Icons.phone, color: Colors.grey, size: 16),
                  const SizedBox(width: TSizes.spaceBtwItems),
                  Text(address.phoneNumber, style: Theme.of(context).textTheme.bodyMedium),
                ],
              ),
              const SizedBox(height: TSizes.spaceBtwItems / 2),
              Row(
                children: [
                  const Icon(Icons.location_history, color: Colors.grey, size: 16),
                  const SizedBox(width: TSizes.spaceBtwItems),
                  Expanded(
                    child: Text(address.city, style: Theme.of(context).textTheme.bodyMedium, softWrap: true),
                  ),
                ],
              ),
            ],
          )
              : Text('Chọn địa chỉ', style: Theme.of(context).textTheme.bodyMedium),
        ],
      );
    });

  }
}