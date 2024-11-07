import 'package:app_t_shop/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class ProductAddRemoveButton extends StatelessWidget {
  const ProductAddRemoveButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Minus button with a circular background
        CircleAvatar(
          radius: 32 / 2,  // Half of the width and height
          backgroundColor: TColors.error.withOpacity(1),  // Background color
          child: Icon(
            Iconsax.minus,
            color: Colors.white,  // Icon color
            size: 24, // Icon size
          ),
        ),
        const SizedBox(width: 20),  // Space between items
        Text(
          '2',  // Quantity text
          style: Theme.of(context).textTheme.titleSmall,
        ),
        const SizedBox(width: 20),  // Space between items
        // Add button with a circular background
        CircleAvatar(
          radius: 32 / 2,  // Half of the width and height
          backgroundColor: TColors.colorApp,  // Background color
          child: Icon(
            Iconsax.add,
            color: Colors.white,  // Icon color
            size: 24,  // Icon size
          ),
        ),
      ],
    );
  }
}
