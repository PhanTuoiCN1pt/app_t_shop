import 'package:app_t_shop/data/repositories/categories/category_repository.dart';
import 'package:app_t_shop/utils/popups/loaders.dart';
import 'package:get/get.dart';

class BannerController extends GetxController {

  final carousalCurrentIndex = 0.obs;
  final isLoading = false.obs;
  final _categoryRepository = Get.put(CategoryRepository());

  void updatePageIndicator (index) {
    carousalCurrentIndex.value = index;
  }

  Future<void> fetchBanners() async {
    try {
      isLoading.value = true;

      final categories = await _categoryRepository.getAllCategories();


    } catch (e) {
      TLoaders.errorSnackBar(title: 'Lỗi',message: e.toString());
    } finally {
      isLoading.value = false;
    }
  }
}
