import 'package:app_t_shop/common/widgets/icons/cicular_icon.dart';
import 'package:app_t_shop/utils/constants/colors.dart';
import 'package:app_t_shop/utils/constants/enums.dart';
import 'package:app_t_shop/utils/constants/sizes.dart';
import 'package:app_t_shop/utils/helpers/helper_functions.dart';
import 'package:app_t_shop/utils/popups/loaders.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:iconsax/iconsax.dart';

class ProductAddRemoveButton extends StatelessWidget {
  const ProductAddRemoveButton({
    super.key, this.add, this.remove, required this.quantity,required this.maxQuantity,
  });
  final int quantity;
  final VoidCallback? add, remove ;
  final int maxQuantity;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        TCircularIcon(
          icon: Iconsax.minus,
          width: 32,
          height: 32,
          size: TSizes.md,
          color: TColors.black ,
          backgroundColor: TColors.grey,
          onPressed: remove,
        ),
        const SizedBox(width: TSizes.spaceBtwItems,),
        Text(quantity.toString(), style: Theme.of(context).textTheme.titleSmall,),
        const SizedBox(width: TSizes.spaceBtwItems,),
        quantity < maxQuantity
            ? TCircularIcon(
          icon: Iconsax.add,
          width: 32,
          height: 32,
          size: TSizes.md,
          color: TColors.white,
          backgroundColor: TColors.colorApp,
          onPressed: add,
        )
            : TCircularIcon(
          icon: Iconsax.add,
          width: 32,
          height: 32,
          size: TSizes.md,
          color: TColors.white,
          backgroundColor: TColors.darkGrey,
          onPressed: () {
            TLoaders.warningSnackBar(title: 'Ohh', message: 'Số lượng sản phẩm tối đa');
          },
        )
      ],
    );
  }
}
