import 'package:app_t_shop/data/repositories/user/user_repository.dart';
import 'package:app_t_shop/features/personalization/controllers/user_controller.dart';
import 'package:app_t_shop/features/personalization/screens/profile/profile.dart';
import 'package:app_t_shop/utils/constants/image_strings.dart';
import 'package:app_t_shop/utils/helpers/network_manager.dart';
import 'package:app_t_shop/utils/popups/full_screen_loader.dart';
import 'package:app_t_shop/utils/popups/loaders.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class UpdateNameController extends GetxController {
  static UpdateNameController get instance => Get.find();

  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final userController = UserController.instance;
  final userRepository = Get.put(UserRepository());
  GlobalKey<FormState> updateUserNameFormKey = GlobalKey<FormState>();

  @override
  void onInit() {
    initializeNames();
    super.onInit();
  }

  /// Fetch User Record
  Future<void> initializeNames() async {
    firstName.text = userController.user.value.firstName;
    lastName.text = userController.user.value.lastName;
  }

  Future<void> updateUserName() async {
    try {
      /// Bắt đầu loading
      TFullScreenLoader.openLoadingDialog('Chúng tôi đang cập nhật thông tin của bạn...', TImages.docerAnimation);

      /// Kiểm tra kết nối Internet
      final isConnected = await NetworkManager.instance.isConnected();
      if(!isConnected) {
        TFullScreenLoader.stopLoading();
        return;
      }

      /// Kiểm tra form
      if(!updateUserNameFormKey.currentState!.validate()){
        TFullScreenLoader.stopLoading();
        return;
      }

      /// Cập nhật
      Map<String, dynamic> name = {'FirstName': firstName.text.trim(), 'LastName': lastName.text.trim()};
      await userRepository.updateSingleField(name);

      userController.user.value.firstName = firstName.text.trim();
      userController.user.value.lastName = lastName.text.trim();

      /// Dừng loader
      TFullScreenLoader.stopLoading();

      TLoaders.successSnackBar(title: 'Hoàn thành', message: 'Tên của bạn đã được cập nhật');

      Get.off(() => const ProfileScreen());

    } catch (e) {
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: 'Ôi không', message: e.toString());
    }
  }
}
