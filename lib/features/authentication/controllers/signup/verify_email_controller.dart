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

  /// Gửi Email xác thực
  sendEmailVerification() async {
    try {
      await AuthenticationRepository.instance.sendEmailVerification();
      TLoaders.successSnackBar(title: 'Email đã được gửi', message: 'Vui lòng kiểm tra email của bạn.');
    } catch (e) {
      TLoaders.errorSnackBar(title: 'Có lỗi xảy ra', message: e.toString());
    }
  }

  /// Bộ đếm thời gian để tự động chuyển hướng khi xác thực email
  setTimeForAutoRedirect() {
    Timer.periodic(
      const Duration(seconds: 1),
          (timer) async {
        await FirebaseAuth.instance.currentUser?.reload();
        final user = FirebaseAuth.instance.currentUser;
        if (user?.emailVerified ?? false) {
          timer.cancel();
          Get.off(
                () => SuccessScreen(
              image: TImages.docerAnimation,
              title: TTexts.yourAccountCreatedTitle,
              subTitle: TTexts.yourAccountCreatedSubTitle,
              onPressed: () => AuthenticationRepository.instance.screenRedirect(),
            ),
          );
        }
      },
    );
  }

  /// Kiểm tra thủ công xem Email đã được xác thực
  checkEmailVerificationStatus() {
    final currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser != null && currentUser.emailVerified) {
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
