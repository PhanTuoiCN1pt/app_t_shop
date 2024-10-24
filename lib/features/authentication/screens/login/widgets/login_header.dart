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
        Text(TTexts.loginTitle, style: Theme.of(context).textTheme.headlineMedium,),
        const SizedBox(height: TSizes.sm,),
        Text(TTexts.loginSubTitle, style: Theme.of(context).textTheme.bodyMedium,),

      ],
    );
  }
}