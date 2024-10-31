import 'package:app_t_shop/common/widgets/appbar/appbar.dart';
import 'package:app_t_shop/common/widgets/images/rounded_container.dart';
import 'package:app_t_shop/common/widgets/products/cart/coupon_widget.dart';
import 'package:app_t_shop/common/widgets/success_screen/success_screen.dart';
import 'package:app_t_shop/features/shop/screens/cart/widgets/cart_items.dart';
import 'package:app_t_shop/features/shop/screens/checkout/widgets/billing_adrress_section.dart';
import 'package:app_t_shop/features/shop/screens/checkout/widgets/billing_amount_section.dart';
import 'package:app_t_shop/features/shop/screens/checkout/widgets/billing_payment_section.dart';
import 'package:app_t_shop/navigation_menu.dart';
import 'package:app_t_shop/utils/constants/colors.dart';
import 'package:app_t_shop/utils/constants/image_strings.dart';
import 'package:app_t_shop/utils/constants/sizes.dart';
import 'package:app_t_shop/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: TAppBar(showBackArrow: true,title: Text('Đánh giá',style: Theme.of(context).textTheme.headlineSmall,),),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              /// Items in Cart
              const CartItems(showAddRemoveButtons: false,),
              const SizedBox(height: TSizes.spaceBtwItems,),

              /// Coupon TextField
              const CouponCode(),
              const SizedBox(height: TSizes.spaceBtwItems,),

              /// Billing Section
              TRoundedContainer(
                showBorder: true,
                padding: const EdgeInsets.all(TSizes.md),
                backgroundColor: dark ? TColors.black : TColors.white,
                child: const Column(
                  children: [
                    /// Pricing
                    BillingAmountSection(),
                    SizedBox(height: TSizes.spaceBtwItems,),

                    /// Divider
                    Divider(),
                    SizedBox(height: TSizes.spaceBtwItems,),

                    /// Payment Methods
                    BillingPaymentSection(),
                    SizedBox(height: TSizes.spaceBtwItems,),

                    /// Address
                    BillingAddressSection(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),

      /// Checkout Button
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(right: TSizes.defaultSpace,left: TSizes.defaultSpace,bottom: TSizes.defaultSpace),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: TColors.colorApp,
            side: const BorderSide(color: TColors.colorApp),
          ),
          onPressed: ()=>Get.to(()=>SuccessScreen(
              image: TImages.successfulPaymentIcon,
              title: 'Thanh toán thành công!',
              subTitle: 'Đơn hàng của bạn sẽ được gửi đến sớm!',
              onPressed: () => Get.offAll(() => const NavigationMenuScreen()) ,
          )
          ),
          child: const Text('Giá \$256'),
        ),
      ),
    );
  }
}

