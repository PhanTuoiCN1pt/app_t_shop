import 'package:flutter/material.dart';

class ProductPriceText extends StatelessWidget {
  const ProductPriceText({
    super.key,
    this.currencySign = ',000 đ',
    required this.price,
    this.maxLines = 1,
    this.isLarge = false,
    this.lineThrough = false,
  });

  final String currencySign, price;
  final int maxLines;
  final bool isLarge;
  final bool lineThrough;

  @override
  Widget build(BuildContext context) {
    return Text(
      price + currencySign ,
      maxLines: maxLines,
      overflow: TextOverflow.ellipsis,
      style: isLarge
          ? Theme.of(context).textTheme.headlineMedium!.apply(
        decoration: lineThrough ? TextDecoration.lineThrough : null,
        fontSizeFactor: 0.8,
      )
          : Theme.of(context).textTheme.titleLarge!.apply(
        decoration: lineThrough ? TextDecoration.lineThrough : null,
        fontSizeFactor: 0.8,
      ),
    );
  }
}
