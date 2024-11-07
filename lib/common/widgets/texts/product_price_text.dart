import 'package:flutter/material.dart';

class ProductPriceText extends StatelessWidget {
  const ProductPriceText({
    super.key,
    this.currencySign = '\₫', // Biểu tượng tiền tệ mặc định là đồng Việt Nam
    required this.price,      // Giá sản phẩm
    this.maxLines = 1,       // Số dòng tối đa
    this.isLarge = false,    // Kiểu chữ lớn hay nhỏ
    this.lineThrough = false, // Có gạch ngang hay không (dùng cho giảm giá)
  });

  final String currencySign, price;  // Ký hiệu tiền và giá sản phẩm
  final int maxLines;                // Số dòng hiển thị
  final bool isLarge;                // Kiểu chữ lớn hay nhỏ
  final bool lineThrough;           // Gạch ngang nếu có giảm giá

  @override
  Widget build(BuildContext context) {
    return Text(
      currencySign + price, // Hiển thị giá kèm theo ký hiệu tiền tệ
      maxLines: maxLines,   // Giới hạn số dòng
      overflow: TextOverflow.ellipsis,  // Thêm dấu ba chấm nếu quá dài
      style: isLarge
          ? Theme.of(context).textTheme.headlineMedium!.apply(
        decoration: lineThrough ? TextDecoration.lineThrough : null, // Nếu có giảm giá, thêm gạch ngang
        fontSizeFactor: 0.8,  // Làm nhỏ chữ so với kích thước mặc định
      )
          : Theme.of(context).textTheme.titleLarge!.apply(
        decoration: lineThrough ? TextDecoration.lineThrough : null, // Nếu có giảm giá, thêm gạch ngang
        fontSizeFactor: 0.8,  // Làm nhỏ chữ so với kích thước mặc định
      ),
    );
  }
}
