import 'package:app_t_shop/common/widgets/images/rounded_container.dart';
import 'package:app_t_shop/features/personalization/controllers/address/address_controller.dart';
import 'package:app_t_shop/features/personalization/models/address_model.dart';
import 'package:app_t_shop/utils/constants/colors.dart';
import 'package:app_t_shop/utils/constants/sizes.dart';
import 'package:app_t_shop/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class SingleAddress extends StatelessWidget {
  const SingleAddress({
    super.key,
    required this.onTap, required this.address
  });

  final VoidCallback onTap;
  final AddressModel address;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    final controller = AddressController.instance;
    return Obx(() {
          final selectedAddressId = controller.selectedAddress.value.id;
          final selectedAddress = selectedAddressId == address.id;
          return InkWell(
          onTap: onTap,
            child: TRoundedContainer(
            padding: const EdgeInsets.all(TSizes.md),
            width: double.infinity,
            showBorder: true,
            backgroundColor: selectedAddress ? TColors.colorApp.withOpacity(0.5) : Colors.transparent,
            borderColor: selectedAddress
              ? Colors.transparent
              : dark
                ? TColors.primary
                : TColors.grey,
            margin: const EdgeInsets.only(bottom: TSizes.spaceBtwItems),
              child: Stack(
                children: [
                  Positioned(
                    right: 5,
                    top: 0,
                    child: Icon(
                      selectedAddress ? Iconsax.tick_circle5 : null,
                      color: selectedAddress
                        ? dark
                          ? TColors.light
                          : TColors.dark
                        : null,
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      address.name,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    const SizedBox(height: TSizes.sm/10,),
                    Text(address.formatterPhoneNo, maxLines: 1,overflow: TextOverflow.ellipsis,style: Theme.of(context).textTheme.bodyMedium,),
                    const SizedBox(height: TSizes.sm/10,),
                    Text(address.toString(),softWrap: true,style: Theme.of(context).textTheme.bodyMedium,),
                ],
              ),
            ],
          ),
        ),
      );}
    );
  }
}