import 'package:app_t_shop/common/widgets/chips/choice_chip.dart';
import 'package:app_t_shop/common/widgets/images/rounded_container.dart';
import 'package:app_t_shop/common/widgets/texts/product_price_text.dart';
import 'package:app_t_shop/common/widgets/texts/product_title_text.dart';
import 'package:app_t_shop/common/widgets/texts/section_heading.dart';
import 'package:app_t_shop/features/shop/controllers/product/product_controller.dart';
import 'package:app_t_shop/features/shop/controllers/product/variation_controller.dart';
import 'package:app_t_shop/features/shop/models/product_model.dart';
import 'package:app_t_shop/utils/constants/colors.dart';
import 'package:app_t_shop/utils/constants/sizes.dart';
import 'package:app_t_shop/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductAttributes extends StatelessWidget {
  const ProductAttributes({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(VariationController());
    final dark = THelperFunctions.isDarkMode(context);
    return Obx(
        () => Column(
        children: [
          /// Giá và Mô tả thuộc tính đã chọn
          //if(controller.selectedVariation.value.id.isNotEmpty)
          TRoundedContainer(
            padding: const EdgeInsets.all(TSizes.md),
            backgroundColor: dark ? TColors.darkerGrey : TColors.grey,
            child: Column(
              children: [
                /// Tiêu đề, Giá, Tình trạng sản phẩm
                Row(
                  children: [
                    const TSectionHeading(title: 'Tình trạng:', showActionButton: false,),
                    const SizedBox(width: TSizes.spaceBtwItems,),

                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            const TProductTitleText(title: 'Giá : ', smallSize: true,),
                            const SizedBox(width: TSizes.spaceBtwItems,),

                            /// Giá gốc
                            if (controller.selectedVariation.value.salePrice > 0)
                              Text('${THelperFunctions.formatNumber(controller.selectedVariation.value.price)},000', style: Theme.of(context).textTheme.titleSmall!.apply(decoration: TextDecoration.lineThrough),),
                            const SizedBox(width: TSizes.spaceBtwItems,),

                            /// Giá khuyến mãi
                            ProductPriceText(price: controller.getVariationPrice()),
                          ],
                        ),
                        /// Tình trạng
                        Row(
                          children: [
                            const TProductTitleText(title: 'Kho hàng : ', smallSize: true,),
                            const SizedBox(width: TSizes.spaceBtwItems,),
                            Text(controller.variationStockStatus.value, style: Theme.of(context).textTheme.titleMedium,),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
                TProductTitleText(
                  title: controller.selectedVariation.value.description ?? '',
                  smallSize: true,
                  maxLines: 4,
                ),
              ],
            ),
          ),
          const SizedBox(height: TSizes.spaceBtwItems,),

          /// Thuộc tính
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: product.productAttributes!
                .map((attribute) => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TSectionHeading(title: attribute.name ?? '', showActionButton: false,),
                const SizedBox(height: TSizes.spaceBtwItems/2,),
                Obx(
                  () => Wrap(
                    spacing: 8,
                    children: attribute.values!.map((attributeValue) {
                      final isSelected = controller.selectedAttributes[attribute.name] == attributeValue;
                      final available = controller
                          .getAttributesAvailabilityInVariation(product.productVariations!, attribute.name!)
                          .contains(attributeValue);
                      return TChoiceChip(
                          text: attributeValue,
                          selected: isSelected,
                          onSelected: available ? (selected){
                            if (selected && available) {
                              controller.onAttributeSelected(product, attribute.name ?? '', attributeValue);
                            }
                          } : null);
                    }).toList()),
                )
              ],
            )).toList(),
          ),
        ],
      ),
    );
  }
}
