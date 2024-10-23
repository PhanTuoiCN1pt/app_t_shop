import 'package:flutter/material.dart';
import 'package:app_t_shop/features/authentication/controllers/onboarding/onboarding_controller.dart';
import 'package:app_t_shop/utils/constants/sizes.dart';
import 'package:app_t_shop/utils/device/device_utility.dart';

class OnBoardingSkip extends StatelessWidget {
  const OnBoardingSkip({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
        top :TDeviceUtils.getAppBarHeight(),
        right: TSizes.defaultSpace ,
        child: TextButton(
          onPressed: () => OnBoardingController.instance.skipPage(),
          child: const Text('Bỏ qua'),));
  }
}