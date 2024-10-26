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
    return TCurvedEdgesWidget(
      child: Container(
        color: TColors.colorApp,
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
                /*Positioned.fill(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 0.0), // Thêm padding cho phần child
                    child: child, // Hiển thị nội dung bên trong (text, appbar, ...)
                  ),
                ),*/
                child,
              ],
            ),
          ),
        );
  }
}
