import 'package:app_t_shop/common/widgets/custom_shapes/containers/circular_container.dart';
import 'package:app_t_shop/common/widgets/custom_shapes/curved_edges/curved_edges_widget.dart';
import 'package:flutter/material.dart';
import '../../../../utils/constants/colors.dart';

class TPrimaryHeaderContainer extends StatelessWidget {
  const TPrimaryHeaderContainer({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return TCurvedEdgeWidget(
      child: Container(
        height: 370, // Điều chỉnh chiều cao phù hợp
        width: double.infinity, // Sử dụng toàn bộ chiều rộng có sẵn
        color: TColors.colorApp,
        padding: const EdgeInsets.only(bottom: 0), // Thêm padding để cách lề dưới
        child: Stack(
          children: [
            Positioned(
              top: -150,
              right: -250,
              child: TCircularContainer(
                backgroundColor: TColors.textWhite.withOpacity(0.1),
              ),
            ),
            Positioned(
              top: 100,
              right: -300,
              child: TCircularContainer(
                backgroundColor: TColors.textWhite.withOpacity(0.1),
              ),
            ),
            Positioned.fill(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 0.0), // Thêm padding cho phần child
                child: child, // Hiển thị nội dung bên trong (text, appbar, ...)
              ),
            ),
          ],
        ),
      ),
    );
  }
}
