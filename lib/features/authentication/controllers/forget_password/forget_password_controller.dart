import 'package:app_t_shop/data/repositories/authentication/authentication_repository.dart';
import 'package:app_t_shop/features/authentication/screens/password_configuration/reset_password.dart';
import 'package:app_t_shop/utils/constants/image_strings.dart';
import 'package:app_t_shop/utils/helpers/network_manager.dart';
import 'package:app_t_shop/utils/popups/full_screen_loader.dart';
import 'package:app_t_shop/utils/popups/loaders.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgetPasswordController extends GetxController {
  static ForgetPasswordController get instance => Get.find();

  /// Biến
  final email = TextEditingController();
  GlobalKey<FormState> forgetPasswordFormKey = GlobalKey<FormState>();

  /// Gửi Email đặt lại mật khẩu
  sendPasswordResetEmail() async {
    try {
      /// Tải
      TFullScreenLoader.openLoadingDialog('Đang xử lý yêu cầu của bạn...', TImages.docerAnimation);

      /// Kiểm tra Internet
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        TFullScreenLoader.stopLoading();
        return;
      }

      /// Kiểm tra tính hợp lệ của biểu mẫu
      if (!forgetPasswordFormKey.currentState!.validate()) {
        TFullScreenLoader.stopLoading();
        return;
      }

      /// Gửi Email để đặt lại mật khẩu
      await AuthenticationRepository.instance.sendPasswordResetEmail(email.text.trim());

      TFullScreenLoader.stopLoading();

      TLoaders.successSnackBar(title: 'Email đã được gửi', message: 'Liên kết email đã được gửi để đặt lại mật khẩu của bạn'.tr);

      Get.to(() => ResetPasswordScreen(email: email.text.trim(),));

    } catch (e) {
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: 'Lỗi', message: e.toString());
    }
  }

  /// Gửi lại
  resendPasswordResetEmail(String email) async {
    try {
      /// Tải
      TFullScreenLoader.openLoadingDialog('Đang xử lý yêu cầu của bạn...', TImages.docerAnimation);

      /// Kiểm tra Internet
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        TFullScreenLoader.stopLoading();
        return;
      }

      await AuthenticationRepository.instance.sendPasswordResetEmail(email);

      TFullScreenLoader.stopLoading();

      TLoaders.successSnackBar(title: 'Email đã được gửi', message: 'Liên kết email đã được gửi để đặt lại mật khẩu của bạn'.tr);

    } catch (e) {
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: 'Lỗi', message: e.toString());
    }
  }
}
