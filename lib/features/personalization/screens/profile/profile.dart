import 'package:app_t_shop/common/widgets/appbar/appbar.dart';
import 'package:app_t_shop/common/widgets/images/circular_image.dart';
import 'package:app_t_shop/common/widgets/texts/section_heading.dart';
import 'package:app_t_shop/features/personalization/controllers/user_controller.dart';
import 'package:app_t_shop/features/personalization/screens/profile/update_profile/change_name.dart';
import 'package:app_t_shop/features/personalization/screens/profile/widgets/profile_menu.dart';
import 'package:app_t_shop/features/shop/screens/home/widgets/shimmer.dart';
import 'package:app_t_shop/navigation_menu.dart';
import 'package:app_t_shop/utils/constants/image_strings.dart';
import 'package:app_t_shop/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    final navigationController = Get.find<NavigationController>();
    return Scaffold(
      appBar: TAppBar(
        title: const Text('Hồ sơ'),
        actions: [
          IconButton(
            icon: const Icon(Icons.close),
            onPressed: () {
              navigationController.navigateToSetting(); // Chuyển đến SettingsScreen
              Get.off(() => const NavigationMenuScreen(selectedIndex: 3,)); // Quay lại NavigationMenuScreen
            },
            tooltip: 'Chuyển đến Cài đặt',
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              /// Ảnh đại diện
              SizedBox(
                width: double.infinity,
                child: Column(
                  children: [
                    Obx(() {
                      final networkImage = controller.user.value.profilePicture;
                      final image = networkImage.isNotEmpty ? networkImage : TImages.user;
                      return controller.imageUploading.value
                          ? const TShimmerEffect(width: 100, height: 100, radius: 100,)
                          : CircularImage(image: image, width: 100, height: 100, isNetworkImage: networkImage.isNotEmpty,);
                    }),
                    TextButton(onPressed: () => controller.uploadUserProfilePicture(), child: const Text('Thay đổi ảnh đại diện'))
                  ],
                ),
              ),
              /// Chi tiết
              const SizedBox(height: TSizes.spaceBtwItems / 2,),
              const Divider(),
              const SizedBox(height: TSizes.spaceBtwItems,),

              /// Tiêu đề thông tin hồ sơ
              const TSectionHeading(title: 'Thông tin hồ sơ', showActionButton: false,),
              const SizedBox(height: TSizes.spaceBtwItems,),

              ProfileMenu(title: 'Tên', value: controller.user.value.fullName, onPressed: () => Get.to(() => const ChangeName())),
              ProfileMenu(title: 'Tên người dùng', value: controller.user.value.username, onPressed: () { }),

              const SizedBox(height: TSizes.spaceBtwItems,),
              const Divider(),
              const SizedBox(height: TSizes.spaceBtwItems,),

              /// Tiêu đề thông tin cá nhân
              const TSectionHeading(title: 'Thông tin cá nhân', showActionButton: false,),
              const SizedBox(height: TSizes.spaceBtwItems,),

              ProfileMenu(title: 'ID', value: controller.user.value.id, icon: Iconsax.copy, onPressed: () { }),
              ProfileMenu(title: 'Email', value: controller.user.value.email, onPressed: () { }),
              ProfileMenu(title: 'Số điện thoại', value: controller.user.value.phoneNumber, onPressed: () { }),
              ProfileMenu(title: 'Giới tính', value: 'Nam', onPressed: () { }),
              ProfileMenu(title: 'Ngày sinh', value: '24/07/2003', onPressed: () { }),
              const Divider(),
              const SizedBox(height: TSizes.spaceBtwItems * 2,),

              Center(
                child: TextButton(onPressed: () => controller.deleteAccountWarningPopup(), child: const Text('Xóa tài khoản', style: TextStyle(color: Colors.red),)),
              )
            ],
          ),
        ),
      ),
    );
  }
}
