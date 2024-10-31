import 'package:app_t_shop/common/widgets/images/circular_image.dart';
import 'package:app_t_shop/features/personalization/controllers/user_controller.dart';
import 'package:app_t_shop/features/shop/screens/home/widgets/shimmer.dart';
import 'package:app_t_shop/utils/constants/image_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class UserProfileTile extends StatelessWidget {
  const UserProfileTile({
    super.key, required this.onPressed,
  });
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    return ListTile(
      leading: Obx(() {
        final networkImage = controller.user.value.profilePicture;
        final image = networkImage.isNotEmpty ? networkImage : TImages.user; // Sử dụng hình ảnh mặc định nếu không có hình ảnh
        return controller.imageUploading.value
            ? const TShimmerEffect(width: 50, height: 50, radius: 50,) // Hiệu ứng khi đang tải
            : CircularImage(image: image, width: 50, height: 50, isNetworkImage: networkImage.isNotEmpty,);
      }),
      title: Text(controller.user.value.fullName, style: Theme.of(context).textTheme.headlineSmall!.apply(color: Colors.white),),
      subtitle: Text(controller.user.value.email,style: Theme.of(context).textTheme.bodyMedium!.apply(color: Colors.white),),
      trailing: IconButton(onPressed: onPressed, icon: const Icon(Iconsax.edit,color: Colors.white,)),
    );
  }
}