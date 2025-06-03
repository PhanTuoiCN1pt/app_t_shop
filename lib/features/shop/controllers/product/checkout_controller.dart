import 'package:app_t_shop/common/widgets/texts/section_heading.dart';
import 'package:app_t_shop/utils/constants/enums.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/sizes.dart';
import '../../models/payment_method_model.dart';
import '../../screens/checkout/widgets/payment_title.dart';

class CheckoutController extends GetxController {
  static CheckoutController get instance => Get.find();

  final Rx<PaymentMethodModel> selectedPaymentMethod = PaymentMethodModel.empty().obs;

  @override
  void onInit() {
    selectedPaymentMethod.value = PaymentMethodModel(image: TImages.codPay, name: 'Thanh toán khi nhận hàng');
    super.onInit();
  }

  Future<dynamic> selectPaymentMethod(BuildContext context){

    return showModalBottomSheet(
        context: context,
        builder:(_) => SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(TSizes.lg),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TSectionHeading(title: 'Chọn phương thức thanh toán', showActionButton: false,),
                SizedBox(height: TSizes.spaceBtwItems,),
                PaymentTile(paymentMethod: PaymentMethodModel(image: TImages.codPay, name: 'Thanh toán khi nhận hàng')),
                SizedBox(height: TSizes.spaceBtwItems/2,),
                PaymentTile(paymentMethod: PaymentMethodModel(image: TImages.googlePay, name: 'Google Pay')),
                SizedBox(height: TSizes.spaceBtwItems/2,),
                PaymentTile(paymentMethod: PaymentMethodModel(image: TImages.momoPay, name: 'Momo')),
                SizedBox(height: TSizes.spaceBtwItems/2,),

              ],
            ),
          ),
        )
    );
  }
}