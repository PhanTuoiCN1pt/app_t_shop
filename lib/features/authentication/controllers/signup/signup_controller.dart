import 'package:app_t_shop/data/repositories/authentication/authentication_repository.dart';
import 'package:app_t_shop/data/repositories/user/user_repository.dart';
import 'package:app_t_shop/features/authentication/models/user/user_model.dart';
import 'package:app_t_shop/features/authentication/screens/signup/verify_email.dart';
import 'package:app_t_shop/utils/constants/image_strings.dart';
import 'package:app_t_shop/utils/helpers/network_manager.dart';
import 'package:app_t_shop/utils/popups/full_screen_loader.dart';
import 'package:app_t_shop/utils/popups/loaders.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class SignupController extends GetxController {
  static SignupController get instance => Get.find();
  SignupController();

  /// Biến
  final hidePassword = true.obs;
  final privacyPolicy = false.obs;
  final email = TextEditingController();
  final lastname = TextEditingController();
  final username = TextEditingController();
  final password = TextEditingController();
  final firstname = TextEditingController();
  final phoneNumber = TextEditingController();
  GlobalKey<FormState> signupFormKey = GlobalKey<FormState>();

  /// -- ĐĂNG KÝ
  Future<void> signup() async {
    try {
      /// Bắt đầu tải
      TFullScreenLoader.openLoadingDialog('Chúng tôi đang xử lý thông tin của bạn...', TImages.docerAnimation);

      /// Kiểm tra kết nối Internet
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        TFullScreenLoader.stopLoading();
        return;
      }

      /// Kiểm tra tính hợp lệ của biểu mẫu
      if (!signupFormKey.currentState!.validate()) {
        TFullScreenLoader.stopLoading();
        return;
      }

      /// Kiểm tra Chính sách Quyền riêng tư
      if (!privacyPolicy.value) {
        TLoaders.warningSnackBar(
          title: 'Đồng ý điều khoản',
          message: 'Khi đăng ký tài khoản, bạn phải đồng ý với Chính sách và Điều khoản',
        );
        return;
      }

      /// Đăng ký người dùng trong Firebase Authentication & Lưu người dùng trong Firebase
      final userCredential = await AuthenticationRepository.instance.registerWithEmailAndPassword(email.text.trim(), password.text.trim());

      /// Lưu dữ liệu người dùng vào Firebase Firestore
      final newUser = UserModel(
          id: userCredential.user!.uid,
          firstName: firstname.text.trim(),
          lastName: lastname.text.trim(),
          username: username.text.trim(),
          email: email.text.trim(),
          phoneNumber: phoneNumber.text.trim(),
          profilePicture: ''
      );
      final userRepository = Get.put(UserRepository());
      await userRepository.saveUserRecord(newUser);

      TFullScreenLoader.stopLoading();

      /// Hiện thông báo thành công
      TLoaders.successSnackBar(title: 'Chúc mừng', message: 'Tài khoản của bạn đã được tạo! Vui lòng xác thực email để tiếp tục.');
      /// Chuyển đến màn hình xác thực email
      Get.to(() => VerifyEmailScreen(email: email.text.trim(),));
    } catch (e) {
      TFullScreenLoader.stopLoading();
      // Hiện thông báo lỗi chung cho người dùng
      TLoaders.errorSnackBar(title: 'Có lỗi xảy ra!', message: e.toString());
    }
  }
}
