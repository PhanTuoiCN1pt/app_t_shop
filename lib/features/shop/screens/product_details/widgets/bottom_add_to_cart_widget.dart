import 'package:app_t_shop/common/widgets/icons/cicular_icon.dart';
import 'package:app_t_shop/features/shop/controllers/cart_controller.dart';
import 'package:app_t_shop/features/shop/screens/cart/cart.dart';
import 'package:app_t_shop/features/shop/screens/checkout/checkout.dart';
import 'package:app_t_shop/utils/constants/colors.dart';
import 'package:app_t_shop/utils/constants/sizes.dart';
import 'package:app_t_shop/utils/helpers/helper_functions.dart';
import 'package:app_t_shop/utils/popups/loaders.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../utils/constants/enums.dart';
import '../../../controllers/product/variation_controller.dart';
import '../../../models/product_model.dart';

class BottomAddToCart extends StatelessWidget {
  const BottomAddToCart({super.key, required this.product});
  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final controller = CartController.instance;
    controller.updateAlreadyAddedProductCount(product);
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
              onPressed: () {
                final variationController = VariationController.instance;
                final productType = product.productType;

                if (productType == ProductType.variable.toString()) {
                  // Sản phẩm có biến thể
                  final variation = variationController.selectedVariation.value;

                  if (variationController.selectedAttributes.isEmpty) {
                    TLoaders.customToast(message: 'Vui lòng chọn thuộc tính (màu, size,...)');
                    return;
                  }

                  if (variation.stock <= 0 ) {
                    TLoaders.customToast(message: 'Sp đã hết hàng');
                    return;
                  }

                  final cartItem = controller.convertToCartItem(product, 1);
                  controller.addOneToCart(cartItem);

                } else {
                  // Sản phẩm đơn lẻ
                  if (product.stock <= 0) {
                    TLoaders.customToast(message: 'Ohh!!! Hết hàng rồi');
                    return;
                  }

                  final cartItem = controller.convertToCartItem(product, 1);
                  controller.addOneToCart(cartItem);
                }
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.only(top: 10),
                backgroundColor: Colors.teal.withOpacity(0.75),
                side: BorderSide(color: Colors.teal.withOpacity(0.75)),
                shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
              ),
              child: Column(
                children: const [
                  Icon(Iconsax.shopping_cart),
                  Text('Thêm vào Giỏ hàng', style: TextStyle(fontSize: 11)),
                ],
              ),
            ),
          ),

          Expanded(
            child: ElevatedButton(
              onPressed: () {
                final variationController = VariationController.instance;
                final productType = product.productType;

                if (productType == ProductType.variable.toString()) {
                  // Sản phẩm có biến thể
                  final variation = variationController.selectedVariation.value;

                  if (variationController.selectedAttributes.isEmpty) {
                    TLoaders.customToast(message: 'Vui lòng chọn thuộc tính (màu, size,...)');
                    return;
                  }

                  if (variation.stock <= 0 ) {
                    TLoaders.customToast(message: 'Sản phẩm đã hết hàng');
                    return;
                  }

                  final cartItem = controller.convertToCartItem(product, 1);
                  controller.addOneToCart(cartItem);

                  // 👉 Điều hướng đến giỏ hàng
                  Get.to(() => CheckoutScreen(customCartItems: [cartItem]));

                } else {
                  // Sản phẩm đơn lẻ
                  if (product.stock <= 0) {
                    TLoaders.customToast(message: 'Ohh!!! Hết hàng rồi');
                    return;
                  }

                  final cartItem = controller.convertToCartItem(product, 1);
                  controller.addOneToCart(cartItem);

                  // 👉 Điều hướng đến giỏ hàng
                  Get.to(() => CheckoutScreen(customCartItems: [cartItem]));
                }
              },
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