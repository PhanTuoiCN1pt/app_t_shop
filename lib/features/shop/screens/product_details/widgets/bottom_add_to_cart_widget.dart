import 'package:app_t_shop/common/widgets/icons/cicular_icon.dart';
import 'package:app_t_shop/utils/constants/colors.dart';
import 'package:app_t_shop/utils/constants/sizes.dart';
import 'package:app_t_shop/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class BottomAddToCart extends StatelessWidget {
  const BottomAddToCart({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Container(
      height: 60,
      padding: EdgeInsets.only(bottom: 5),

      child: Row(
        children: [
          Expanded(
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.only(top: 10),
                backgroundColor: Colors.teal.withOpacity(0.75),
                side: const BorderSide(color: TColors.colorApp),
                shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero), // Square corners
              ),
              child: Column(
                children: [
                  Icon(Iconsax.messages),
                  Text('Chat ngay',style: TextStyle(fontSize: 11),),
                ],
              ),
            ),
          ),
          Expanded(
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.only(top: 10),
                backgroundColor: Colors.teal.withOpacity(0.75),
                side: BorderSide(color: Colors.teal.withOpacity(0.75)),
                shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
              ),
              child: Column(
                children: [
                  Icon(Iconsax.shopping_cart),
                  Text('Thêm vào Giỏ hàng',style: TextStyle(fontSize: 11),),
                ],
              ),
            ),
          ),
          Expanded(
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 17.0),
                backgroundColor: TColors.error,
                side: const BorderSide(color: TColors.error),
                shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
              ),
              child: const Text('Mua ngay'),
            ),
          ),
        ],
      ),
    );
  }
}