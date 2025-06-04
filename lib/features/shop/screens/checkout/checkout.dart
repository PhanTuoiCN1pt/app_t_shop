import 'package:app_t_shop/common/widgets/appbar/appbar.dart';
import 'package:app_t_shop/common/widgets/images/rounded_container.dart';
import 'package:app_t_shop/common/widgets/products/cart/coupon_widget.dart';
import 'package:app_t_shop/common/widgets/success_screen/success_screen.dart';
import 'package:app_t_shop/features/shop/controllers/order_controller.dart';
import 'package:app_t_shop/features/shop/screens/cart/widgets/cart_items.dart';
import 'package:app_t_shop/features/shop/screens/checkout/widgets/billing_adrress_section.dart';
import 'package:app_t_shop/features/shop/screens/checkout/widgets/billing_amount_section.dart';
import 'package:app_t_shop/features/shop/screens/checkout/widgets/billing_payment_section.dart';
import 'package:app_t_shop/navigation_menu.dart';
import 'package:app_t_shop/utils/constants/colors.dart';
import 'package:app_t_shop/utils/constants/image_strings.dart';
import 'package:app_t_shop/utils/constants/sizes.dart';
import 'package:app_t_shop/utils/helpers/helper_functions.dart';
import 'package:app_t_shop/utils/helpers/pricing_calculator.dart';
import 'package:app_t_shop/utils/popups/loaders.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/cart_controller.dart';
import '../../models/cart_item_model.dart';

class CheckoutScreen extends StatelessWidget {
  final List<CartItemModel>? customCartItems;

  const CheckoutScreen({Key? key, this.customCartItems}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    final cartController = CartController.instance;
    final orderController = Get.put(OrderController());

    final itemsToCalculate = customCartItems ?? cartController.cartItems;
    final subTotal = itemsToCalculate.fold<double>(0, (sum, item) => sum + item.price * item.quantity);
    final double customSubTotal = customCartItems?.fold(0.0, (sum, item) => sum! + item.price * item.quantity) ?? cartController.totalCartPrice.value;
    final totalAmount = TPricingCalculator.calculateTotalPrice(subTotal, 'VND');

    return Scaffold(
      appBar: TAppBar(
        showBackArrow: true,
        title: Text(
          'Thanh toán',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              ConstrainedBox(
                constraints: BoxConstraints(
                  maxHeight: MediaQuery.of(context).size.height * 0.45,
                ),
                child: CartItems(
                  showAddRemoveButtons: false,
                  customCartItems: customCartItems,
                ),
              ),
              const SizedBox(height: TSizes.spaceBtwItems),
              // const CouponCode(),
              // const SizedBox(height: TSizes.spaceBtwItems),
              TRoundedContainer(
                showBorder: true,
                padding: const EdgeInsets.all(TSizes.md),
                backgroundColor: dark ? TColors.black : TColors.white,
                child: Column(
                  children: [
                    BillingAmountSection(subTotal: customSubTotal),
                    const SizedBox(height: TSizes.spaceBtwItems),
                    const Divider(),
                    const SizedBox(height: TSizes.spaceBtwItems),
                    const BillingPaymentSection(),
                    const SizedBox(height: TSizes.spaceBtwItems),
                    const BillingAddressSection(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(
          right: TSizes.defaultSpace,
          left: TSizes.defaultSpace,
          bottom: TSizes.defaultSpace,
        ),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: TColors.colorApp,
            side: const BorderSide(color: TColors.colorApp),
          ),
          onPressed: subTotal > 0
              ? () {
            // Nếu customCartItems có giá trị -> thanh toán sản phẩm được chọn
            if (customCartItems != null && customCartItems!.isNotEmpty) {
              orderController.processOrder(itemsToCheckout: customCartItems!);
            } else {
              // Ngược lại, thanh toán toàn bộ giỏ hàng
              orderController.processOrder();
            }
          }
              : () => TLoaders.warningSnackBar(
            title: 'Giỏ trống',
            message: 'Thêm sản phẩm vào giỏ hàng để thanh toán',
          ),

          child: Text('Giá ${THelperFunctions.formatNumber(totalAmount)},000 đ'),
        ),
      ),
    );
  }

}

