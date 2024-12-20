
import 'package:app_t_shop/features/personalization/screens/settings/settings.dart';
import 'package:app_t_shop/features/shop/screens/home/home.dart';
import 'package:app_t_shop/features/shop/screens/store/store.dart';
import 'package:app_t_shop/features/shop/screens/wishlist/wishlist.dart';
import 'package:app_t_shop/utils/constants/colors.dart';
import 'package:app_t_shop/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class NavigationMenuScreen extends StatelessWidget {
  const NavigationMenuScreen({super.key,this.selectedIndex = 0, });
  final int selectedIndex;// Mặc định là 0

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationController());

    // Đặt selectedIndex ban đầu nếu truyền vào
    controller.selectedIndex.value = selectedIndex;

    final darkMode = THelperFunctions.isDarkMode(context);
    return Scaffold(
      bottomNavigationBar: Obx(
            () => NavigationBar(
          height: 80,
          elevation: 0,
          selectedIndex: controller.selectedIndex.value,
          onDestinationSelected: (index) => controller.selectedIndex.value = index,
          backgroundColor: darkMode ? TColors.black : TColors.white,
          indicatorColor: darkMode ? TColors.white.withOpacity(0.1) : TColors.colorApp.withOpacity(0.5),
          destinations: const [
            NavigationDestination(icon: Icon(Iconsax.home), label: 'Trang chủ'),
            NavigationDestination(icon: Icon(Iconsax.shop), label: 'Cửa hàng'),
            NavigationDestination(icon: Icon(Iconsax.heart), label: 'Yêu thích'),
            NavigationDestination(icon: Icon(Iconsax.user), label: 'Tài khoản'),
          ],
        ),
      ),
      body: Obx(() => controller.screens[controller.selectedIndex.value]),
    );
  }
}


class NavigationController extends GetxController {
  final Rx<int> selectedIndex = 0.obs;

  final screens = [
    const HomeScreen(),
    const StoreScreen(),
    const FavouriteScreen(),
    const SettingScreen()
  ];

  void navigateToSetting() {
    selectedIndex.value; // Chỉ số của SettingScreen
  }
}
