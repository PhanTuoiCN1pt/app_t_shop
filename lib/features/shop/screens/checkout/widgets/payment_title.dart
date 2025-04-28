import 'package:app_t_shop/common/widgets/images/rounded_container.dart';
import 'package:app_t_shop/features/shop/controllers/product/checkout_controller.dart';
import 'package:app_t_shop/features/shop/models/payment_method_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../utils/constants/sizes.dart';

class PaymentTile extends StatelessWidget{
  const PaymentTile({super.key, required this.paymentMethod});

  final PaymentMethodModel paymentMethod;
  @override
  Widget build(BuildContext context) {
    final controller = CheckoutController.instance;

    return ListTile(
      contentPadding: EdgeInsets.all(0),
      onTap: (){
        controller.selectedPaymentMethod.value = paymentMethod;
        Get.back();
      },
      leading: TRoundedContainer(
        width: 60,
        height: 40,
        padding: EdgeInsets.all(TSizes.sm),
        child: Image(image: AssetImage(paymentMethod.image), fit: BoxFit.contain,),
      ),
      title: Text(paymentMethod.name),
      trailing: Icon(Iconsax.arrow_right_34),
    );
  }
}