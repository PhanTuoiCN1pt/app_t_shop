import 'dart:async';

import 'package:app_t_shop/common/widgets/success_screen/success_screen.dart';
import 'package:app_t_shop/data/repositories/authentication/authentication_repository.dart';
import 'package:app_t_shop/utils/constants/image_strings.dart';
import 'package:app_t_shop/utils/constants/text_strings.dart';
import 'package:app_t_shop/utils/popups/loaders.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class VerifyEmailController extends GetxController {
  static VerifyEmailController get instance => Get.find();

  @override
  void onInit() {
    sendEmailVerification();
    setTimeForAutoRedirect();
    super.onInit();
  }

  /// Send Email Verification
  sendEmailVerification() async {
    try{
      await AuthenticationRepository.instance.sendEmailVerification();
      TLoaders.successSnackBar(title: 'Email Sent',message: 'Please Check Your Email.');
    }catch (e) {
      TLoaders.errorSnackBar(title: 'Oh Snap',message: e.toString());
    }
  }

  /// Timer to automatically redirect on email verigication
  setTimeForAutoRedirect() {
    Timer.periodic(
        const Duration(seconds: 1),
        (timer) async {
          await FirebaseAuth.instance.currentUser?.reload();
          final user = FirebaseAuth.instance.currentUser;
          if(user?.emailVerified ?? false){
            timer.cancel();
            Get.off(
                () => SuccessScreen(
                    image: TImages.docerAnimation,
                    title: TTexts.yourAccountCreatedTitle,
                    subTitle: TTexts.yourAccountCreatedSubTitle,
                    onPressed: ()  => AuthenticationRepository.instance.screenRedirect(),
                ),
            );
          }
        }
    );
  }

  /// Manually Check if Email Verified
  checkEmailVerificationStatus() {
    final currentUser = FirebaseAuth.instance.currentUser;
    if(currentUser != null && currentUser.emailVerified){
      Get.off(
          () => SuccessScreen(
              image: TImages.docerAnimation,
              title: TTexts.yourAccountCreatedTitle,
              subTitle: TTexts.yourAccountCreatedSubTitle,
              onPressed: () => AuthenticationRepository.instance.screenRedirect(),
          ),
      );
    }
  }
}