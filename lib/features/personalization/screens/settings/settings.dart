import 'package:app_t_shop/common/widgets/appbar/appbar.dart';
import 'package:app_t_shop/common/widgets/custom_shapes/containers/primary_header_container.dart';
import 'package:app_t_shop/common/widgets/list_titles/settings_menu_title.dart';
import 'package:app_t_shop/common/widgets/list_titles/user_profile_title.dart';
import 'package:app_t_shop/common/widgets/texts/section_heading.dart';
import 'package:app_t_shop/data/dummy_data.dart';
import 'package:app_t_shop/data/repositories/authentication/authentication_repository.dart';
import 'package:app_t_shop/data/services/category_firestore_service.dart';
import 'package:app_t_shop/features/personalization/screens/address/address.dart';
import 'package:app_t_shop/features/personalization/screens/profile/profile.dart';
import 'package:app_t_shop/features/shop/controllers/category_controller.dart';
import 'package:app_t_shop/features/shop/screens/cart/cart.dart';
import 'package:app_t_shop/features/shop/screens/order/order.dart';
import 'package:app_t_shop/utils/constants/colors.dart';
import 'package:app_t_shop/utils/constants/image_strings.dart';
import 'package:app_t_shop/utils/constants/sizes.dart';
import 'package:app_t_shop/utils/popups/full_screen_loader.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            TPrimaryHeaderContainer(
                child: Column(
                  children: [
                    /// App Bar
                    TAppBar(
                      title: Text('Account', style: Theme.of(context).textTheme.headlineMedium!.apply(color: Colors.white),),
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
                  const TSectionHeading(title: 'Account Setting',showActionButton: false,),
                  const SizedBox(height: TSizes.spaceBtwSections,),
                  SettingsMenuTile(icon: Iconsax.safe_home, title: 'My Addresses', subtitle: 'Set shopping delivery address',onTap: ()=>Get.to(()=>const UserAddressScreen()),),
                  SettingsMenuTile(icon: Iconsax.shopping_cart, title: 'My Cart', subtitle: 'Add, remove products and move to checkout',onTap: ()=>Get.to(() => const CartScreen()),),
                  SettingsMenuTile(icon: Iconsax.bag_tick, title: 'My Order', subtitle: 'In-progress and Completed Order',onTap: () => Get.to(()=>const OrderScreen()),),
                  SettingsMenuTile(icon: Iconsax.bank, title: 'Bank Account', subtitle: 'Withdraw balance to registered',onTap: (){},),
                  SettingsMenuTile(icon: Iconsax.discount_shape, title: 'My Coupons', subtitle: 'List of all the discounted coupons',onTap: (){},),
                  SettingsMenuTile(icon: Iconsax.notification, title: 'Notifications', subtitle: 'Set any kind of notification message',onTap: (){},),
                  SettingsMenuTile(icon: Iconsax.security, title: 'Account Privacy', subtitle: 'Manage data usage and connected accounts',onTap: (){},),

                  /// App Setting
                  const SizedBox(height: TSizes.spaceBtwSections,),
                  const TSectionHeading(title: 'App Setting', showActionButton: false,),
                  const SizedBox(height: TSizes.spaceBtwItems,),
                  SettingsMenuTile(
                    icon: Iconsax.document_upload,
                    title: 'Load Data',
                    subtitle: 'Upload Data to your Cloud FireBase',
                    onTap: () async {
                      final categoryService = CategoryFirestoreService();
                      final categoryController = Get.find<CategoryController>(); // Lấy instance của CategoryController

                      try {
                        TFullScreenLoader.openLoadingDialog('Đang tải lên', TImages.docerAnimation);

                        // Tải lên danh mục
                        await categoryService.uploadCategoriesToFirestore(TDummyData.categories);
                        TFullScreenLoader.stopLoading();
                        print("All categories uploaded successfully!");

                        // Hiển thị thông báo thành công cho người dùng
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Categories uploaded successfully!'))
                        );

                        // Gọi phương thức fetchCategories để reload lại dữ liệu
                        await categoryController.fetchCategories(); // Tải lại danh sách danh mục từ Firestore

                      } catch (e) {
                        print("Error uploading categories: $e");
                        // Hiển thị thông báo lỗi cho người dùng
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Failed to upload categories.'))
                        );
                      }
                    },
                  ),

                  SettingsMenuTile(
                      icon: Iconsax.location,
                      title: 'Geolocation',
                      subtitle: 'Set recommendation based on location',
                      trailing: Switch(
                          value: true,
                          activeColor: TColors.colorApp,
                          onChanged: (value) {}),
                  ),
                  SettingsMenuTile(
                      icon: Iconsax.security,
                      title: 'Safe Mode',
                      subtitle: 'Search result is safe for all ages',
                      trailing: Switch(value: false, activeColor: TColors.colorApp, onChanged: (value) {}),),
                  SettingsMenuTile(
                      icon: Iconsax.image,
                      title: 'HD Image Quality',
                      subtitle: 'Set image quality to be seen',
                      trailing: Switch(value: false, activeColor: TColors.colorApp, onChanged: (value) {}),
                  ),
                  const SizedBox(height: TSizes.spaceBtwSections,),
                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton(onPressed: () async {
                      await AuthenticationRepository.instance.logout();
                    }, child: const Text('Logout')),
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
