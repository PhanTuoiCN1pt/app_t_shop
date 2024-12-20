import 'package:app_t_shop/common/widgets/images/circular_image.dart';
import 'package:app_t_shop/features/personalization/controllers/user_controller.dart';
import 'package:app_t_shop/features/shop/screens/load_fresh_data/shimmer.dart';
import 'package:app_t_shop/utils/constants/image_strings.dart';
import 'package:cached_network_image/cached_network_image.dart';
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
            : ClipOval(
            child: CachedNetworkImage(
            imageUrl: image,
            width: 50,
            height: 50,
            fit: BoxFit.cover, // Đảm bảo hình ảnh lấp đầy khung
            progressIndicatorBuilder: (context, url, downloadProgress) =>
            const TShimmerEffect(width: 50, height: 50, radius: 50),
            errorWidget: (context, url, error) => const Icon(Icons.error),
          ),
        );
      }),
      title: Text(controller.user.value.fullName, style: Theme.of(context).textTheme.headlineSmall!.apply(color: Colors.white),),
      subtitle: Text(controller.user.value.email,style: Theme.of(context).textTheme.bodyMedium!.apply(color: Colors.white),),
      trailing: IconButton(onPressed: onPressed, icon: const Icon(Iconsax.edit,color: Colors.white,)),
    );
  }
}