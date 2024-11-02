import 'package:app_t_shop/common/widgets/layouts/grid_layout.dart';
import 'package:app_t_shop/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:app_t_shop/features/shop/controllers/product/product_controller.dart';
import 'package:app_t_shop/features/shop/models/product_model.dart';
import 'package:app_t_shop/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class SortableProduct extends StatelessWidget {
  const SortableProduct({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProductController());

    return Column(
      children: [
        /// Dropdown
        DropdownButtonFormField(
          decoration: const InputDecoration(prefixIcon: Icon(Iconsax.sort)),
          onChanged: (value) {},
          items: ['Tên', 'Giá Cao Nhất', 'Giá Thấp Nhất', 'Giảm Giá', 'Mới Nhất', 'Phổ Biến']
              .map((option) => DropdownMenuItem(value: option, child: Text(option)))
              .toList(),
        ),
        const SizedBox(height: TSizes.spaceBtwItems,),
        /// Sản phẩm
        GridLayout(itemCount: controller.featuredProducts.length, itemBuilder: (_, index) => TProductCardVertical(product: controller.featuredProducts[index],)),
      ],
    );
  }
}
