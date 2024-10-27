import 'package:app_t_shop/common/widgets/images/rounded_container.dart';
import 'package:app_t_shop/utils/constants/colors.dart';
import 'package:app_t_shop/utils/constants/sizes.dart';
import 'package:app_t_shop/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class CouponCode extends StatelessWidget {
  const CouponCode({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return TRoundedContainer(
      showBorder: true,
      backgroundColor: dark ? TColors.dark : TColors.white,
      padding: const EdgeInsets.all(TSizes.sm),
      child: Row(
        children: [
          Flexible(
            child: TextFormField(
              decoration: const InputDecoration(
                hintText: 'Have a promo code? Enter here.',
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
              ),
            ),
          ),

          /// Button
          SizedBox(
              width: 80,
              child: ElevatedButton(
                onPressed: (){},
                style: ElevatedButton.styleFrom(
                  foregroundColor: TColors.dark.withOpacity(0.9),
                  backgroundColor: TColors.colorApp.withOpacity(0.4),
                  side: BorderSide(color: TColors.colorApp.withOpacity(0.1)),
                ),
                child: const Text('Apply'),
              )
          ),
        ],
      ),
    );
  }
}