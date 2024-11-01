import 'package:app_t_shop/data/repositories/banners/banner_repository.dart';
import 'package:app_t_shop/data/repositories/categories/category_repository.dart';
import 'package:app_t_shop/features/shop/models/banner_model.dart';
import 'package:app_t_shop/utils/popups/loaders.dart';
import 'package:get/get.dart';

class BannerController extends GetxController {

  final carousalCurrentIndex = 0.obs;
  final isLoading = false.obs;
  final RxList<BannerModel> banners = <BannerModel>[].obs;


  @override
  void onInit() {
    fetchBanners();
    super.onInit();
  }

  void updatePageIndicator (index) {
    carousalCurrentIndex.value = index;
  }

  Future<void> fetchBanners() async {
    try {
      isLoading.value = true;

      final bannerRepo = Get.put(BannerRepository());
      final banners = await bannerRepo.getAllBanner();

      this.banners.assignAll(banners);

    } catch (e) {
      TLoaders.errorSnackBar(title: 'Lỗi',message: e.toString());
    } finally {
      isLoading.value = false;
    }
  }

}
