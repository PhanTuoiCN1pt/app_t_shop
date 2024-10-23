import 'package:app_t_shop/utils/constants/colors.dart';
import 'package:app_t_shop/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class TCartCounterIcon extends StatelessWidget {
  const TCartCounterIcon({
    super.key, required this.onPressed,
  });

  final VoidCallback onPressed;


  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        IconButton(onPressed: (){}, icon: Icon(Iconsax.shopping_bag, color: THelperFunctions.isDarkMode(context) ? TColors.white : TColors.black)),
        Positioned(
          right: 0,
          child: Container(
            width: 18,
            height: 18,
            decoration: BoxDecoration(
              color: THelperFunctions.isDarkMode(context) ? TColors.white : TColors.black ,
              borderRadius: BorderRadius.circular(180),
            ),
            child: Center(
              child: Text('2', style: Theme.of(context).textTheme.labelLarge!.apply(color: THelperFunctions.isDarkMode(context) ? TColors.black : TColors.white, fontSizeFactor: 0.8),),
            ),
          ),),
      ],
    );
  }
}