import 'package:app_t_shop/common/widgets/appbar/appbar.dart';
import 'package:app_t_shop/features/shop/screens/order/widgets/orders_list.dart';
import 'package:app_t_shop/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /// Thanh tiêu đề
      appBar: TAppBar(
        showBackArrow: true,
        title: Text('Đơn hàng của tôi', style: Theme.of(context).textTheme.headlineSmall,),
      ),
      body: const Padding(
        padding: EdgeInsets.all(TSizes.defaultSpace),

        /// Danh sách đơn hàng
        child: OrderListItems(),
      ),
    );
  }
}
