import 'package:app_t_shop/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:app_t_shop/utils/constants/image_strings.dart';
import 'package:app_t_shop/utils/constants/sizes.dart';
import 'package:app_t_shop/utils/constants/text_strings.dart';
import 'package:app_t_shop/utils/helpers/helper_functions.dart';

class TLoginHeader extends StatelessWidget {
  const TLoginHeader({super.key});
  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: TSizes.spaceLogo,),
        Image(
          image: AssetImage(dark ? TImages.lightAppLogo : TImages.darkAppLogo),
          height: 70,

        ),
        const SizedBox(height: TSizes.spaceLogo1,),
        Row(
          children: [
            Text(TTexts.loginTitle, style: Theme.of(context).textTheme.headlineMedium,),
            const SizedBox(width: TSizes.sm,),
            Text('- Mua sắm theo cách của bạn!', style: TextStyle(fontSize: 16,color: TColors.colorApp),),
          ]
        ),

        const SizedBox(height: 30,),
        Text(TTexts.loginSubTitle, style: TextStyle(fontSize: 13,color: Colors.black.withOpacity(0.6))),

      ],
    );
  }
}