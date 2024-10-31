import 'package:app_t_shop/common/widgets/images/rounded_container.dart';
import 'package:app_t_shop/utils/constants/colors.dart';
import 'package:app_t_shop/utils/constants/sizes.dart';
import 'package:app_t_shop/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class OrderListItems extends StatelessWidget {
  const OrderListItems({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return ListView.separated(
      shrinkWrap: true,
      itemCount: 5,
      separatorBuilder: (_, __) => const SizedBox(height: TSizes.spaceBtwItems,),
      itemBuilder: (_, index) => TRoundedContainer(
        showBorder: true,
        padding: const EdgeInsets.all(TSizes.md),
        backgroundColor: dark ? TColors.dark : TColors.light,
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
                        'Đang xử lý',
                        style: Theme.of(context).textTheme.bodyLarge!.apply(color: TColors.colorApp),
                      ),
                      Text('24 07 2003', style: Theme.of(context).textTheme.headlineSmall,),
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
                            Text('Đơn hàng', style: Theme.of(context).textTheme.labelMedium),
                            Text('[#22003]', style: Theme.of(context).textTheme.titleMedium,),
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
                            Text('Ngày giao hàng', style: Theme.of(context).textTheme.labelMedium),
                            Text('24 07 2003', style: Theme.of(context).textTheme.titleMedium,),
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
      ),
    );
  }
}
