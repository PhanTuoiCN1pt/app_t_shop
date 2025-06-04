import 'package:app_t_shop/common/widgets/appbar/appbar.dart';
import 'package:app_t_shop/common/widgets/custom_shapes/containers/primary_header_container.dart';
import 'package:app_t_shop/common/widgets/list_titles/settings_menu_title.dart';
import 'package:app_t_shop/common/widgets/list_titles/user_profile_title.dart';
import 'package:app_t_shop/common/widgets/texts/section_heading.dart';
import 'package:app_t_shop/data/dummy_data.dart';
import 'package:app_t_shop/data/repositories/authentication/authentication_repository.dart';
import 'package:app_t_shop/features/personalization/controllers/user_controller.dart';
import 'package:app_t_shop/features/personalization/screens/address/address.dart';
import 'package:app_t_shop/features/personalization/screens/profile/profile.dart';
import 'package:app_t_shop/features/personalization/screens/settings/upload_data.dart';
import 'package:app_t_shop/features/shop/controllers/category_controller.dart';
import 'package:app_t_shop/features/shop/screens/cart/cart.dart';
import 'package:app_t_shop/features/shop/screens/order/order.dart';
import 'package:app_t_shop/utils/constants/colors.dart';
import 'package:app_t_shop/utils/constants/image_strings.dart';
import 'package:app_t_shop/utils/constants/sizes.dart';
import 'package:app_t_shop/utils/popups/full_screen_loader.dart';
import 'package:app_t_shop/utils/popups/loaders.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            TPrimaryHeaderContainer(
              child: Column(
                children: [
                  /// App Bar
                  TAppBar(
                    title: Text('Tài khoản', style: Theme.of(context).textTheme.headlineMedium!.apply(color: Colors.white),),
                  ),

                  /// User Profile Card
                  UserProfileTile(onPressed: () => Get.to(() => const ProfileScreen()),),
                  const SizedBox(height: TSizes.spaceBtwSections,),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(TSizes.defaultSpace),
              child: Column(
                children: [
                  /// Account Setting
                  const TSectionHeading(title: 'Cài đặt tài khoản', showActionButton: false,),
                  const SizedBox(height: TSizes.spaceBtwSections/3,),
                  SettingsMenuTile(icon: Iconsax.safe_home, title: 'Địa chỉ', trailing: const Icon(Icons.arrow_forward_ios, size: 16), onTap: () => Get.to(() => const UserAddressScreen()),),
                  SettingsMenuTile(icon: Iconsax.shopping_cart, title: 'Giỏ hàng', trailing: const Icon(Icons.arrow_forward_ios, size: 16), onTap: () => Get.to(() => const CartScreen()),),
                  SettingsMenuTile(icon: Iconsax.bag_tick, title: 'Đơn hàng', trailing: const Icon(Icons.arrow_forward_ios, size: 16), onTap: () => Get.to(() => const OrderScreen()),),
                  SettingsMenuTile(icon: Iconsax.bank, title: 'Tài khoản', trailing: const Icon(Icons.arrow_forward_ios, size: 16),  onTap: () {},),
                  SettingsMenuTile(icon: Iconsax.discount_shape, title: 'Phiếu giảm giá', trailing: const Icon(Icons.arrow_forward_ios, size: 16), onTap: () {},),
                  SettingsMenuTile(icon: Iconsax.notification, title: 'Thông báo', trailing: const Icon(Icons.arrow_forward_ios, size: 16),onTap: () {},),
                  SettingsMenuTile(icon: Iconsax.security, title: 'Quyền riêng tư tài khoản', trailing: const Icon(Icons.arrow_forward_ios, size: 16), onTap: () {},),

                  /// App Setting
                  const SizedBox(height: TSizes.spaceBtwSections/2,),
                  // const TSectionHeading(title: 'Cài đặt ứng dụng', showActionButton: false,),
                  // const SizedBox(height: TSizes.spaceBtwItems/3,),
                  // SettingsMenuTile(
                  //   icon: Iconsax.document_upload,
                  //   title: 'Tải dữ liệu',
                  //   onTap: () => Get.to(() => UploadDataScreen())
                  // ),
                  //
                  // SettingsMenuTile(
                  //   icon: Iconsax.location,
                  //   title: 'Vị trí địa lý',
                  //   trailing: Switch(
                  //       value: true,
                  //       activeColor: TColors.colorApp,
                  //       onChanged: (value) {}),
                  // ),
                  // SettingsMenuTile(
                  //   icon: Iconsax.security,
                  //   title: 'Chế độ an toàn',
                  //   trailing: Switch(value: false, activeColor: TColors.colorApp, onChanged: (value) {}),),
                  // SettingsMenuTile(
                  //   icon: Iconsax.image,
                  //   title: 'Chất lượng hình ảnh',
                  //   trailing: Switch(value: false, activeColor: TColors.colorApp, onChanged: (value) {}),
                  // ),
                  const SizedBox(height: TSizes.spaceBtwSections,),
                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton(
                      onPressed: () => controller.logoutPopup(), // Gọi hàm hiển thị popup
                      child: const Text('Đăng xuất'),),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
