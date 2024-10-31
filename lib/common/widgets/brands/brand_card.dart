import 'package:app_t_shop/common/widgets/images/circular_image.dart';
import 'package:app_t_shop/common/widgets/images/rounded_container.dart';
import 'package:app_t_shop/common/widgets/texts/brand_title_text_with_verified_icon.dart';
import 'package:app_t_shop/utils/constants/colors.dart';
import 'package:app_t_shop/utils/constants/enums.dart';
import 'package:app_t_shop/utils/constants/image_strings.dart';
import 'package:app_t_shop/utils/constants/sizes.dart';
import 'package:app_t_shop/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

/// Widget đại diện cho một thương hiệu.
class TBrandCard extends StatelessWidget {
  /// Constructor mặc định cho TBrandCard.
  ///
  /// Tham số:
  ///   - showBorder: Cờ chỉ định có hiển thị đường viền quanh thẻ hay không.
  ///   - onTap: Hàm callback khi thẻ được chạm.
  const TBrandCard({
    super.key,
    required this.showBorder,
    this.onTap,
  });

  final bool showBorder;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    final isDark = THelperFunctions.isDarkMode(context);

    return GestureDetector(
      onTap: onTap,
      /// Thiết kế Container
      child: TRoundedContainer(
        showBorder: showBorder,
        backgroundColor: Colors.transparent,
        padding: const EdgeInsets.all(TSizes.sm),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            /// -- Biểu tượng
            Flexible(
              child: CircularImage(
                image: TImages.clothIcon,
                isNetworkImage: false,
                backgroundColor: Colors.transparent,
                overlayColor: isDark ? TColors.white : TColors.black,
              ),
            ),
            const SizedBox(width: TSizes.spaceBtwItems / 2),

            /// -- Văn bản
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const TBrandTitleWithVerifiedIcon(title: 'Nike', brandTextSize: TextSizes.large),
                  Text(
                    '25 Sản phẩm',
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
