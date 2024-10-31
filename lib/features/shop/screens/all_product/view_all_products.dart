import 'package:app_t_shop/common/widgets/appbar/appbar.dart';
import 'package:app_t_shop/common/widgets/products/sortable/sortable_products.dart';
import 'package:app_t_shop/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class ViewAllProduct extends StatelessWidget {
  const ViewAllProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: TAppBar(title: Text('Sản phẩm phổ biến'), showBackArrow: true,),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(TSizes.defaultSpace),
          child: SortableProduct(),
        ),
      ),
    );
  }
}

