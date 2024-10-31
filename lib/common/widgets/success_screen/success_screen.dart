import 'package:app_t_shop/data/repositories/authentication/authentication_repository.dart';
import 'package:app_t_shop/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:app_t_shop/common/stype/spacing_stypes.dart';
import 'package:app_t_shop/utils/constants/sizes.dart';
import 'package:lottie/lottie.dart';

import '../../../utils/constants/text_strings.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({
    super.key,
    required this.image,
    required this.title,
    required this.subTitle,
    required this.onPressed
  });

  final String image, title, subTitle;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: TSpacingStype.paddingWithAppBarHeight * 2,
          child: Column(
            children: [
              /// Hình ảnh
              Lottie.asset(image, width: MediaQuery.of(context).size.width * 0.6),
              const SizedBox(height: TSizes.spaceBtwSections,),

              /// Tiêu đề & Phụ đề
              Text(title, style: Theme.of(context).textTheme.headlineMedium, textAlign: TextAlign.center,),
              const SizedBox(height: TSizes.spaceBtwSections,),
              Text(subTitle, style: Theme.of(context).textTheme.labelMedium, textAlign: TextAlign.center,),
              const SizedBox(height: TSizes.spaceBtwSections,),

              /// Nút bấm
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: TColors.colorApp,
                    side: const BorderSide(color: TColors.colorApp),
                  ),
                  onPressed: () async {
                    await AuthenticationRepository.instance.logout();
                  },
                  child: const Text(TTexts.tContinue),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
