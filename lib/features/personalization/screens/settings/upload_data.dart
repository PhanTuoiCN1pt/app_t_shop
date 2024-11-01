import 'package:app_t_shop/data/dummy_data.dart';
import 'package:app_t_shop/data/repositories/banners/banner_repository.dart';
import 'package:app_t_shop/data/repositories/categories/category_repository.dart';
import 'package:app_t_shop/features/shop/controllers/banner_controller.dart';
import 'package:app_t_shop/features/shop/controllers/category_controller.dart';
import 'package:app_t_shop/utils/constants/image_strings.dart';
import 'package:app_t_shop/utils/popups/full_screen_loader.dart';
import 'package:app_t_shop/utils/popups/loaders.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:app_t_shop/common/widgets/appbar/appbar.dart';
import 'package:app_t_shop/common/widgets/custom_shapes/containers/primary_header_container.dart';
import 'package:app_t_shop/common/widgets/list_titles/settings_menu_title.dart';
import 'package:app_t_shop/common/widgets/texts/section_heading.dart';
import 'package:app_t_shop/utils/constants/colors.dart';
import 'package:app_t_shop/utils/constants/sizes.dart';
import 'package:iconsax/iconsax.dart';

class UploadDataScreen extends StatelessWidget {
  const UploadDataScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final categoriesRepo = CategoryRepository();
    final bannerRepo = BannerRepository();
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            /// Header với TAppBar và phần tiêu đề
            TAppBar(
              showBackArrow: true,
              title: Text(
                'Upload Data',
                style: Theme.of(context)
                    .textTheme
                    .headlineMedium!
                    .apply(color: Colors.black),
              ),
            ),

            /// Nội dung chính
            Padding(
              padding: const EdgeInsets.all(TSizes.defaultSpace),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// Main Record Section
                  const TSectionHeading(title: 'Main Record', showActionButton: false),
                  const SizedBox(height: TSizes.spaceBtwSections/2),
                  SettingsMenuTile(
                    iconColor: TColors.primary,
                    icon: Iconsax.category,
                    title: 'Upload Categories',
                    trailing: const Icon(Iconsax.export, size: 25,color: TColors.primary),
                    onTap: () => categoriesRepo.uploadCategories(),
                  ),
                  SettingsMenuTile(
                    iconColor: TColors.primary,
                    icon: Iconsax.image,
                    title: 'Upload Banners',
                    trailing: const Icon(Iconsax.export, size: 25, color: TColors.primary),
                    onTap: () => bannerRepo.uploadBanners(),/*async {
                      final bannerService = BannerFirestoreService(); // Khởi tạo service cho banners
                      final bannerController = Get.find<BannerController>(); // Tìm controller của banners nếu có

                      try {
                        TFullScreenLoader.openLoadingDialog('Đang tải lên', TImages.docerAnimation);

                        // Tải lên danh sách Banners
                        await bannerService.uploadBannersToFirestore(TDummyData.banners);
                        TFullScreenLoader.stopLoading();
                        print("Tất cả banners đã được tải lên thành công!");

                        // Hiển thị thông báo thành công cho người dùng
                        TLoaders.successSnackBar(title: 'Thành công', message: 'Tải dữ liệu banners thành công!');

                        // Reload lại dữ liệu banners nếu cần
                        await bannerController.fetchBanners();

                      } catch (e) {
                        print("Lỗi tải lên: $e");
                        // Hiển thị thông báo lỗi cho người dùng
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Lỗi tải lên banners.'))
                        );
                      }
                    },*/
                  ),
                  SettingsMenuTile(
                    iconColor: TColors.primary,
                    icon: Iconsax.shopping_cart,
                    title: 'Upload Products',
                    trailing: const Icon(Iconsax.export, size: 25,color: TColors.primary),
                    onTap: () {
                      // Functionality for uploading products
                    },
                  ),
                  SettingsMenuTile(
                    iconColor: TColors.primary,
                    icon: Iconsax.image,
                    title: 'Upload Banners',
                    trailing: const Icon(Iconsax.export, size: 25,color: TColors.primary,),
                    onTap: () {
                      // Functionality for uploading banners
                    },
                  ),

                  /// Relationships Section
                  const SizedBox(height: TSizes.spaceBtwSections),
                  const TSectionHeading(title: 'Relationships', showActionButton: false),
                  const SizedBox(height: TSizes.spaceBtwItems),
                  SettingsMenuTile(
                    iconColor: TColors.primary,
                    icon: Iconsax.link,
                    title: 'Upload Brands & Categories Relation Data',
                    trailing: const Icon(Iconsax.export, size: 25,color: TColors.primary),
                    onTap: () {
                      // Functionality for uploading brands & categories relation data
                    },
                  ),
                  SettingsMenuTile(
                    iconColor: TColors.primary,
                    icon: Iconsax.link,
                    title: 'Upload Product Categories Relational Data',
                    trailing: const Icon(Iconsax.export, size: 25,color: TColors.primary),
                    onTap: () {
                      // Functionality for uploading product categories relational data
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
