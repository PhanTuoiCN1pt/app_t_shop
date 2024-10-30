import 'package:app_t_shop/common/widgets/appbar/appbar.dart';
import 'package:app_t_shop/common/widgets/images/circular_image.dart';
import 'package:app_t_shop/common/widgets/texts/section_heading.dart';
import 'package:app_t_shop/features/personalization/controllers/user_controller.dart';
import 'package:app_t_shop/features/personalization/screens/profile/update_profile/change_name.dart';
import 'package:app_t_shop/features/personalization/screens/profile/widgets/profile_menu.dart';
import 'package:app_t_shop/features/shop/screens/home/widgets/shimmer.dart';
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
    return  Scaffold(
      appBar: const TAppBar(
        showBackArrow: true,
        title: Text('Profile'),

      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              /// Profile Picture
              SizedBox(
                width: double.infinity,
                child: Column(
                  children: [
                    Obx( () {
                      final networkImage = controller.user.value.profilePicture;
                      final image = networkImage.isNotEmpty ? networkImage : TImages.user;
                      return controller.imageUploading.value
                          ? const TShimmerEffect(width: 100, height: 100,radius: 100,)
                          : CircularImage(image: image, width: 100,height: 100, isNetworkImage: networkImage.isNotEmpty,);
                    }),
                    TextButton(onPressed: () => controller.uploadUserProfilePicture(), child: const Text('Change Profile Picture'))
                  ],
                ),
              ),
              /// Deltails
              const SizedBox(height: TSizes.spaceBtwItems/2,),
              const Divider(),
              const SizedBox(height: TSizes.spaceBtwItems,),

              /// Heading Profile Info
              const TSectionHeading(title: 'Profile Information',showActionButton: false,),
              const SizedBox(height: TSizes.spaceBtwItems,),

              ProfileMenu(title: 'Name', value: controller.user.value.fullName,onPressed: () => Get.to(() => const ChangeName())),
              ProfileMenu(title: 'Username', value:controller.user.value.username,onPressed: () {  }),

              const SizedBox(height: TSizes.spaceBtwItems,),
              const Divider(),
              const SizedBox(height: TSizes.spaceBtwItems,),

              ///  Heading Personal Info
              const TSectionHeading(title: 'Personal Information',showActionButton: false,),
              const SizedBox(height: TSizes.spaceBtwItems,),

              ProfileMenu(title: 'User ID', value: controller.user.value.id, icon: Iconsax.copy,onPressed: () {  }),
              ProfileMenu(title: 'E-mail', value: controller.user.value.email,onPressed: () {  }),
              ProfileMenu(title: 'Phone Number', value: controller.user.value.phoneNumber,onPressed: () {  }),
              ProfileMenu(title: 'Gender', value: 'Male',onPressed: () {  }),
              ProfileMenu(title: 'Date of Birth', value: '24/07/2003',onPressed: () {  }),
              const Divider(),
              const SizedBox(height: TSizes.spaceBtwItems*2,),

              Center(
                child: TextButton(onPressed: () => controller.deleteAccountWarningPopup (), child: const Text('Close Account',style: TextStyle(color: Colors.red),)),
              )


            ],
          ),
        ),
      ),
    );
  }
}
