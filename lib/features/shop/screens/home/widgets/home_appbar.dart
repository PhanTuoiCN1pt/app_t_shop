import 'package:app_t_shop/common/widgets/appbar/appbar.dart';
import 'package:app_t_shop/common/widgets/products/cart/cart_menu_icon.dart';
import 'package:app_t_shop/features/personalization/controllers/user_controller.dart';
import 'package:app_t_shop/features/shop/screens/cart/cart.dart';
import 'package:app_t_shop/features/shop/screens/shimmer/shimmer.dart';
import 'package:app_t_shop/features/shop/screens/wishlist/wishlist.dart';
import 'package:app_t_shop/navigation_menu.dart';
import 'package:app_t_shop/utils/constants/colors.dart';
import 'package:app_t_shop/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class THomeAppBar extends StatelessWidget {
  const THomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UserController());
    return TAppBar(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(TTexts.homeAppbarTitle, style: Theme.of(context).textTheme.labelMedium!.apply(color: TColors.grey)),
          Obx( () {
            if (controller.profileLoading.value){
              /// Hiển thị một bộ tải shimmer trong khi thông tin người dùng đang được tải
              return const TShimmerEffect(width: 80, height: 15,);
            } else {
              return Text(controller.user.value.fullName, style: Theme.of(context).textTheme.headlineMedium!.apply(color: TColors.white));
            }
          },
          ),
        ],
      ),
      actions: [
        TCartCounterIcon(onPressed: () => Get.to(() => CartScreen()), )
      ],
    );
  }
}
