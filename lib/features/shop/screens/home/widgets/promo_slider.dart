import 'package:app_t_shop/common/widgets/custom_shapes/containers/circular_container.dart';
import 'package:app_t_shop/common/widgets/images/rounded_image.dart';
import 'package:app_t_shop/features/shop/controllers/banner_controller.dart';
import 'package:app_t_shop/features/shop/screens/load_fresh_data/shimmer.dart';
import 'package:app_t_shop/utils/constants/colors.dart';
import 'package:app_t_shop/utils/constants/sizes.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TPromoSlider extends StatelessWidget {
  const TPromoSlider({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    final controller = Get.put(BannerController());
    return Obx(
      (){

        if(controller.isLoading.value) return TShimmerEffect(width: double.infinity, height: 190);

        if(controller.banners.isEmpty){
          return Center(child: Text('Không có dữ liêu!'),);
        }else {
          return Column(
            children: [
              CarouselSlider(
                options: CarouselOptions(
                  viewportFraction: 1,
                  onPageChanged: (index, _) => controller.updatePageIndicator(index),
                ),
                items: controller.banners
                    .map(
                      (banner) => TRoundedImage(
                        imageUrl: banner.imageUrl,
                        applyImageRadius: true,
                        isNetworkImage: false,
                        borderRadius: 20, // Độ bo góc tùy chỉnh
                        onPressed: () => Get.toNamed(banner.targetScreen),
                      )
                ).toList(),
              ),
              const SizedBox(height: TSizes.spaceBtwItems,),
              Center(
                child: Obx(
                      () => Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      for (int i = 0; i < controller.banners.length; i++)
                        TCircularContainer(
                          width: 20,
                          height: 4,
                          margin: const EdgeInsets.only(right: 10),
                          backgroundColor: controller.carousalCurrentIndex.value == i ? TColors.colorApp : TColors.grey,)
                    ],
                  ),
                ),
              )
            ],
          );
        }
      }
    );
  }
}