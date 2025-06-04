import 'package:app_t_shop/features/shop/controllers/cart_controller.dart';
import 'package:app_t_shop/utils/constants/sizes.dart';
import 'package:app_t_shop/utils/helpers/pricing_calculator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../utils/helpers/helper_functions.dart';

class BillingAmountSection extends StatelessWidget {
  final double? subTotal;

  // Thêm tham số subTotal truyền từ ngoài vào, nếu không truyền sẽ lấy từ cartController
  const BillingAmountSection({super.key, this.subTotal});

  @override
  Widget build(BuildContext context) {
    final cartController = CartController.instance;

    // Nếu subTotal truyền vào là null, lấy giá trị mặc định từ cartController
    final observableSubTotal = subTotal?.obs ?? cartController.totalCartPrice;

    return Obx(() {
      final currentSubTotal = observableSubTotal.value;

      return Column(
        children: [
          /// Tổng phụ
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Tổng đơn giá', style: Theme.of(context).textTheme.bodyMedium,),
              Text('${THelperFunctions.formatNumber(currentSubTotal)},000 ₫', style: Theme.of(context).textTheme.bodyMedium,),
            ],
          ),

          /// Phí vận chuyển
          const SizedBox(height: TSizes.spaceBtwItems/2,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Phí vận chuyển', style: Theme.of(context).textTheme.bodyMedium,),
              Text('${THelperFunctions.formatNumber(TPricingCalculator.calculateShippingCost(currentSubTotal, 'US'))},000 ₫', style: Theme.of(context).textTheme.labelLarge,),
            ],
          ),
          /// Tổng đơn hàng
          const SizedBox(height: TSizes.spaceBtwItems/2,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Tổng đơn hàng', style: Theme.of(context).textTheme.bodyMedium,),
              Text(
                '${THelperFunctions.formatNumber(TPricingCalculator.calculateTotalPrice(currentSubTotal, 'US'))},000 ₫',
                style: Theme.of(context).textTheme.labelLarge,
              ),

            ],
          ),
        ],
      );
    });
  }
}
