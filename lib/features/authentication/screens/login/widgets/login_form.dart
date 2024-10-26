import 'package:app_t_shop/features/authentication/screens/password_configuration/forget_password.dart';
import 'package:app_t_shop/navigation_menu.dart';
import 'package:app_t_shop/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:app_t_shop/features/authentication/screens/signup/signup.dart';
import 'package:app_t_shop/utils/constants/sizes.dart';
import 'package:app_t_shop/utils/constants/text_strings.dart';

class TLoginForm extends StatelessWidget {
  const TLoginForm({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Form(child: Padding(
      padding: const EdgeInsets.symmetric(vertical: TSizes.spaceBtwSections),
      child: Column(
        children: [
          /// Email
          TextFormField(
            decoration: const InputDecoration(
                prefixIcon: Icon(Iconsax.direct_right), labelText: TTexts.email),
          ),
          const SizedBox(height: TSizes.spaceBtwInputFields),

          /// Pass
          TextFormField(
            decoration: const InputDecoration(
                prefixIcon: Icon(Iconsax.password_check), labelText: TTexts.password, suffixIcon: Icon(Iconsax.eye_slash)),
          ),
          const SizedBox(height: TSizes.spaceBtwInputFields / 2),

          /// Remenber, ForgetPass
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              /// Remenber
              Row(
                children: [
                  Checkbox(value: true, onChanged: (value){}),
                  const Text(TTexts.rememberMe),
                ],
              ),

              /// ForgetPass
              TextButton(onPressed: ()=> Get.to(()=>const ForgetPasswordScreen()), child: const Text(TTexts.forgetPassword),),
            ],
          ),
          const SizedBox(height: TSizes.spaceBtwSections),

          /// Sign In Button
          SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: TColors.colorApp,
                  side: const BorderSide(color: TColors.colorApp)
                ),
                onPressed: () => Get.to(()=> const NavigationMenuScreen()), child: const Text(TTexts.signIn))
              ),
          const SizedBox(height: TSizes.spaceBtwSections),

          /// Create Acc Btn
          SizedBox(
              width: double.infinity,
              child: OutlinedButton(onPressed: () => Get.to(() => const SignupScreen()), child: const Text(TTexts.createAccount))
          ),

        ],
      ),
    ),
    );
  }
}