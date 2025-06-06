
import 'package:app_t_shop/features/authentication/controllers/signup/signup_controller.dart';
import 'package:app_t_shop/utils/constants/colors.dart';
import 'package:app_t_shop/utils/validators/validation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:app_t_shop/features/authentication/screens/signup/widgets/term_condition_checkbox.dart';
import 'package:app_t_shop/utils/constants/sizes.dart';
import 'package:app_t_shop/utils/constants/text_strings.dart';

class TSignupForm extends StatelessWidget {
  const TSignupForm({super.key,});
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignupController());
    return Form(
      key: controller.signupFormKey,
      child: Column(
      children: [
        Row(
          children: [
            /// First Name input
            Expanded(
              child: TextFormField(
                controller: controller.firstname,
                validator: (value) => TValidator.validateEmptyText('First Name', value),
                expands: false,
                decoration: const InputDecoration(labelText: TTexts.firstName, prefixIcon: Icon(Iconsax.user),),
              ),
            ),
            const SizedBox(width: TSizes.spaceBtwInputFields,),
            /// Last name input
            Expanded(
              child: TextFormField(
                controller: controller.lastname,
                validator: (value) => TValidator.validateEmptyText('Last name', value),
                expands: false,
                decoration: const InputDecoration(labelText: TTexts.lastName, prefixIcon: Icon(Iconsax.user),),
              ),
            ),
          ],
        ),
        const SizedBox(height: TSizes.spaceBtwInputFields,),

        /// UserName
        TextFormField(
          controller: controller.username,
          validator: (value) => TValidator.validateEmptyText('User Name', value),
          expands: false,
          decoration: const InputDecoration(
            labelText: TTexts.username,
            prefixIcon: Icon(Iconsax.user_edit),
          ),
        ),
        const SizedBox(height: TSizes.spaceBtwInputFields,),

        /// Email
        TextFormField(
          controller: controller.email,
          validator: (value) => TValidator.validateEmail(value),
          decoration: const InputDecoration(
            labelText: TTexts.email,
            prefixIcon: Icon(Iconsax.direct),
          ),
        ),
        const SizedBox(height: TSizes.spaceBtwInputFields,),

        /// Phone Number
        TextFormField(
          controller: controller.phoneNumber,
          validator: (value) => TValidator.validatePhoneNumber(value),
          decoration: const InputDecoration(
            labelText: TTexts.phoneNo,
            prefixIcon: Icon(Iconsax.call),
          ),
        ),
        const SizedBox(height: TSizes.spaceBtwInputFields,),

        /// Password
        Obx(
              () => TextFormField(
                controller: controller.password,
                validator: (value) => TValidator.validatePassword(value),
                obscureText: controller.hidePassword.value,
                decoration: InputDecoration(
                    labelText: TTexts.password,
                    prefixIcon: const Icon(Iconsax.password_check),
                    suffixIcon: IconButton(
                        onPressed: () => controller.hidePassword.value =! controller.hidePassword.value,
                        icon: Icon(controller.hidePassword.value ? Iconsax.eye_slash : Iconsax.eye))
            ),
          ),
        ),
        const SizedBox(height: TSizes.spaceBtwInputFields,),


        const TTermAndConditionCheckbox(),
        const SizedBox(height: TSizes.spaceBtwSections,),

        ///  Sign Up Btn
        SizedBox(
            width: double.infinity,
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: TColors.colorApp,
                  side: const BorderSide(color: TColors.colorApp),
                ),
                onPressed: () => controller.signup(),
                child: const Text(TTexts.createAccount)
            )
        ),

      ],
    ),);
  }
}
