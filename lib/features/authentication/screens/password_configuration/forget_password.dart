

import 'package:app_t_shop/features/authentication/controllers/forget_password/forget_password_controller.dart';
import 'package:app_t_shop/utils/constants/colors.dart';
import 'package:app_t_shop/utils/validators/validation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../utils/constants/sizes.dart';
import '../../../../utils/constants/text_strings.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ForgetPasswordController());
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Headings
            Text(TTexts.forgetPasswordTitle, style: Theme.of(context).textTheme.headlineMedium,),
            const SizedBox(height: TSizes.spaceBtwItems,),
            /// Text field
            Form(
              key: controller.forgetPasswordFormKey,
              child: TextFormField(
                controller: controller.email,
                validator: TValidator.validateEmail,
                decoration: const InputDecoration(labelText: TTexts.email, prefixIcon: Icon(Iconsax.direct_right)),
              ),
            ),
            const SizedBox(height: TSizes.spaceBtwItems1,),
            Text(TTexts.forgetPasswordSubTitle, style: Theme.of(context).textTheme.labelMedium,),
            const SizedBox(height: TSizes.spaceBtwSections,),
            /// Submit Button
            SizedBox(
                width: double.infinity ,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: TColors.colorApp,
                      side: const BorderSide(color: TColors.colorApp),
                    ),
                    onPressed: () => controller.sendPasswordResetEmail(),
                    child: const Text(TTexts.submit))),
          ],
        ),
      ),
    );
  }
}