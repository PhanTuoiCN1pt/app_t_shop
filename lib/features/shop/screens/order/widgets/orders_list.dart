import 'package:app_t_shop/common/widgets/images/rounded_container.dart';
import 'package:app_t_shop/features/shop/controllers/order_controller.dart';
import 'package:app_t_shop/features/shop/screens/home/home.dart';
import 'package:app_t_shop/navigation_menu.dart';
import 'package:app_t_shop/utils/constants/colors.dart';
import 'package:app_t_shop/utils/constants/sizes.dart';
import 'package:app_t_shop/utils/helpers/cloud_helper_functions.dart';
import 'package:app_t_shop/utils/helpers/helper_functions.dart';
import 'package:app_t_shop/utils/loaders/animation_loader.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../utils/constants/image_strings.dart';

class OrderListItems extends StatelessWidget {
  const OrderListItems({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OrderController());
    return FutureBuilder(
      future: controller.fetchUserOrders(),
      builder: (_, snapshot){
        final emptyWidget = TAnimationLoaderWidget(
          text: 'Lỗi',
          animation: TImages.orderComplete,
          showAction: true,
          actionText: 'Thêm ngay',
          onActionPressed: () => Get.off(() => const NavigationMenuScreen(selectedIndex: 0,)),
        );
        final response = TCloudHelperFunctions.checkMultiRecordState(snapshot: snapshot,nothingFound: emptyWidget);

        if (response != null) return response;

        final orders = snapshot.data!;
        return ListView.separated(
          shrinkWrap: true,
          itemCount: orders.length,
          separatorBuilder: (_, index) => const SizedBox(height: TSizes.spaceBtwItems,),
          itemBuilder: (_, index) {
            final order = orders[index];
            return TRoundedContainer(
              showBorder: true,
              padding: const EdgeInsets.all(TSizes.md),
              backgroundColor: TColors.light,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  /// Dòng 1
                  Row(
                    children: [
                      /// 1 -- Biểu tượng
                      const Icon(Iconsax.ship),
                      const SizedBox(width: TSizes.spaceBtwItems/2,),

                      /// 2 -- Trạng thái & Ngày
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              order.orderStatusText,
                              style: Theme.of(context).textTheme.bodyLarge!.apply(color: TColors.colorApp),
                            ),
                            Text(order.formatterOrderDate, style: Theme.of(context).textTheme.headlineSmall,),
                          ],
                        ),
                      ),


                      /// 3 -- Biểu tượng
                      IconButton(onPressed: (){}, icon: const Icon(Iconsax.arrow_right_34, size: TSizes.iconSm,)),
                    ],
                  ),
                  const SizedBox(height: TSizes.spaceBtwItems,),

                  /// Dòng 2
                  Row(
                    children: [
                      Expanded(
                        child: Row(
                          children: [
                            /// 1 -- Biểu tượng
                            const Icon(Iconsax.tag),
                            const SizedBox(width: TSizes.spaceBtwItems/2,),

                            /// 2 -- Trạng thái & Ngày
                            Expanded(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Đơn hàng', style: Theme.of(context).textTheme.labelMedium,maxLines: 1,),
                                  Text(order.id, style: Theme.of(context).textTheme.titleMedium,maxLines: 1,),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Row(
                          children: [
                            /// 1 -- Biểu tượng
                            const Icon(Iconsax.calendar),
                            const SizedBox(width: TSizes.spaceBtwItems/2,),

                            /// 2 -- Trạng thái & Ngày
                            Expanded(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Ngày giao hàng', style: Theme.of(context).textTheme.labelMedium,maxLines: 1,),
                                  Text(order.formatterDeliveryDate, style: Theme.of(context).textTheme.titleMedium,maxLines: 1,),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          }
        );
      }
    );
  }
}
