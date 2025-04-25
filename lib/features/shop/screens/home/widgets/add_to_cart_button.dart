
import 'package:app_t_shop/features/shop/controllers/cart_controller.dart';
import 'package:app_t_shop/features/shop/models/product_model.dart';
import 'package:app_t_shop/features/shop/screens/product_details/product_detail.dart';
import 'package:app_t_shop/utils/constants/enums.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';

class ProductCardAddToCartButton extends StatelessWidget{
  const ProductCardAddToCartButton({super.key, required this.product});
  final ProductModel product;
  
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final cartController = CartController.instance;
    return InkWell(
      onTap: (){
        if(product.productType == ProductType.single.toString()){
          final cartItem = cartController.convertToCartItem(product, 1);
          cartController.addOneToCart(cartItem);
        }else{
          Get.to(() => ProductDetail(product: product));
        }
      },
      child: Obx(() {
        final productQuantityInCart = cartController.getProductQuantityInCart(product.id);
        return Container(
          decoration:  BoxDecoration(
            color:productQuantityInCart > 0 ? TColors.primary : TColors.dark,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(TSizes.cardRadiusMd),
              bottomRight: Radius.circular(TSizes.productImageRadius)
            )
          ),
          child: const SizedBox(
            width: TSizes.iconLg*1.2,
            height: TSizes.iconLg*1.2,
            child: Center(child: Icon(Iconsax.add, color: TColors.white,),),
          ),
        );
      }),
    );
  }
}