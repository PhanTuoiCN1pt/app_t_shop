import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_common/get_reset.dart';
import 'package:iconsax/iconsax.dart';
import 'package:app_t_shop/common/widgets/login_signup/form_divider.dart';
import 'package:app_t_shop/common/widgets/login_signup/social_buttons.dart';
import 'package:app_t_shop/features/authentication/screens/login/widgets/login_form.dart';
import 'package:app_t_shop/features/authentication/screens/login/widgets/login_header.dart';
import 'package:app_t_shop/utils/constants/colors.dart';
import 'package:app_t_shop/utils/constants/sizes.dart';
import 'package:app_t_shop/common/stype/spacing_stypes.dart';
import 'package:app_t_shop/utils/constants/image_strings.dart';
import 'package:app_t_shop/utils/helpers/helper_functions.dart';
import 'package:app_t_shop/utils/constants/text_strings.dart';
class LoginScreen extends StatelessWidget{
  const LoginScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: TSpacingStype.paddingWithAppBarHeight,
          child: Column(
            children: [
              /// Logo, Title, Sub-Title
              const TLoginHeader(),

              /// Form
              const TLoginForm(),

              /// Divider
              TFormDivider(dividerText: TTexts.orSignInWith.capitalize!),

              const SizedBox(height: TSizes.spaceBtwSections,),

              /// Footer
              const TSocialButtons(),
            ],
          ),
        ),
      ),
    );
  }

}







