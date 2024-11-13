import 'package:app_t_shop/utils/constants/colors.dart';
import 'package:app_t_shop/utils/constants/sizes.dart';
import 'package:app_t_shop/utils/device/device_utility.dart';
import 'package:app_t_shop/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class TSearchContainer extends StatelessWidget {
  const TSearchContainer({
    super.key,
    required this.text,
    this.icon = Iconsax.search_normal,
    this.showBackground = true,
    this.showBorder = true,
    this.onTap,
    this.padding = const EdgeInsets.symmetric(horizontal: TSizes.defaultSpace),
    this.controller,
    this.textFieldBorderRadius = 16.0, // New border radius for TextField
  });

  final String text;
  final IconData? icon;
  final bool showBackground, showBorder;
  final VoidCallback? onTap;
  final EdgeInsetsGeometry padding;
  final TextEditingController? controller;
  final double textFieldBorderRadius; // New field for TextField border radius

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: padding,
        child: Container(
          width: TDeviceUtils.getScreenWidth(context),
          decoration: BoxDecoration(
            color: showBackground
                ? dark
                ? TColors.dark
                : TColors.light
                : Colors.transparent,
            borderRadius: BorderRadius.circular(textFieldBorderRadius),
            border: showBorder ? Border.all(color: TColors.grey) : null,
          ),
          child: TextField(
            controller: controller,
            style: Theme.of(context).textTheme.bodySmall,
            decoration: InputDecoration(
              isDense: true,
              contentPadding: const EdgeInsets.all(TSizes.sm),
              prefixIcon: Icon(icon, color: dark ? TColors.white : TColors.black),
              hintText: text,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(textFieldBorderRadius),
                borderSide: BorderSide.none, // Remove default border
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(textFieldBorderRadius),
                borderSide: BorderSide.none,
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(textFieldBorderRadius),
                borderSide: BorderSide(color: TColors.grey, width: 1.0),
              ),
              hintStyle: TextStyle(
                color: dark ? TColors.white.withOpacity(0.7) : TColors.black.withOpacity(0.5),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
