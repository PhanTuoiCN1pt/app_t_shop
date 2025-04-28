import 'package:app_t_shop/common/widgets/images/rounded_container.dart';
import 'package:app_t_shop/common/widgets/texts/section_heading.dart';
import 'package:app_t_shop/features/shop/models/payment_method_model.dart';
import 'package:app_t_shop/utils/constants/colors.dart';
import 'package:app_t_shop/utils/constants/image_strings.dart';
import 'package:app_t_shop/utils/constants/sizes.dart';
import 'package:app_t_shop/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/product/checkout_controller.dart';

class BillingPaymentSection extends StatelessWidget {
  const BillingPaymentSection({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = CheckoutController.instance;

    final dark = THelperFunctions.isDarkMode(context);
    return Column(
      children: [
        TSectionHeading(title: 'Phương thức thanh toán' ,buttonTitle: 'Thay đổi',onPressed: () => controller.selectPaymentMethod(context),),
        const SizedBox(height: TSizes.spaceBtwItems/2,),
        Obx(
          () => Row(
            children: [
              TRoundedContainer(
                width: 60,
                height: 35,
                backgroundColor: dark ? TColors.light : TColors.white,
                padding: const EdgeInsets.all(TSizes.sm),
                child:  Image(image: AssetImage(controller.selectedPaymentMethod.value.image),fit: BoxFit.contain,),
              ),
              const SizedBox(width: TSizes.spaceBtwItems/2,),
              Text(controller.selectedPaymentMethod.value.name,style: Theme.of(context).textTheme.bodyLarge,),
            ],
          ),
        ),
      ],
    );
  }
}
