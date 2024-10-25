import 'package:app_t_shop/common/widgets/appbar/appbar.dart';
import 'package:app_t_shop/common/widgets/images/circular_image.dart';
import 'package:app_t_shop/common/widgets/texts/section_heading.dart';
import 'package:app_t_shop/features/personalization/screens/profile/widgets/profile_menu.dart';
import 'package:app_t_shop/utils/constants/image_strings.dart';
import 'package:app_t_shop/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
                    const CircularImage(image: TImages.user,width: 80,height: 80,),
                    TextButton(onPressed: (){}, child: const Text('Change Profile Picture')),

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

              ProfileMenu(title: 'Name', value: 'Phan Van Tuoi',onPressed: () {  }),
              ProfileMenu(title: 'Username', value: 'PhanTuoi IT',onPressed: () {  }),

              const SizedBox(height: TSizes.spaceBtwItems,),
              const Divider(),
              const SizedBox(height: TSizes.spaceBtwItems,),

              ///  Heading Personal Info
              const TSectionHeading(title: 'Personal Information',showActionButton: false,),
              const SizedBox(height: TSizes.spaceBtwItems,),

              ProfileMenu(title: 'User ID', value: '35247', icon: Iconsax.copy,onPressed: () {  }),
              ProfileMenu(title: 'E-mail', value: 'phantuoi1xa@gmail.com',onPressed: () {  }),
              ProfileMenu(title: 'Phone Number', value: '0394475952',onPressed: () {  }),
              ProfileMenu(title: 'Gender', value: 'Male',onPressed: () {  }),
              ProfileMenu(title: 'Date of Birth', value: '24/07/2003',onPressed: () {  }),
              const Divider(),
              const SizedBox(height: TSizes.spaceBtwItems*2,),

              Center(
                child: TextButton(onPressed: (){}, child: const Text('Close Account',style: TextStyle(color: Colors.red),)),
              )


            ],
          ),
        ),
      ),
    );
  }
}
