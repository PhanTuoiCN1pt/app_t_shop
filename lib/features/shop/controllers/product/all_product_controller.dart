import 'package:app_t_shop/data/repositories/product/product_repository.dart';
import 'package:app_t_shop/features/shop/models/product_model.dart';
import 'package:app_t_shop/utils/popups/loaders.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class AllProductController extends GetxController {
  static AllProductController get instance => Get.find();

  final repository = ProductRepository.instance;
  final RxString selectedSortOption = 'Tên'.obs;
  final RxList<ProductModel> products = <ProductModel>[].obs;

  Future<List<ProductModel>> fetchProductsByQuery(Query? query) async {
    try {
      if(query == null) return [];
      final products = await repository.fetchProductsByQuery(query);
      return products;
    } catch (e) {
      TLoaders.errorSnackBar(title: 'Lỗi', message: e.toString());
      return [];
    }
  }

  void sortProducts(String sortOption) {
    selectedSortOption.value = sortOption;

    switch (sortOption) {
      case 'Tên':
        products.sort((a, b) => a.title.compareTo(b.title));
        break;
      case 'Giá cao nhất':
        products.sort((a, b) => b.price.compareTo(a.price));
        break;
      case 'Giá thấp nhất':
        products.sort((a, b) => a.price.compareTo(b.price));
        break;
      case 'Mới nhất':
        products.sort((a, b) => a.date!.compareTo(b.date!));
        break;
      case 'Giảm giá':
        products.sort((a, b) {
          if(b.salePrice > 0) {
            return b.salePrice.compareTo(a.salePrice);
          } else if (a.salePrice > 0) {
            return -1;
          } else {
            return 1;
          }
        });
        break;
      default:
        products.sort((a, b) => a.title.compareTo(b.title));
    }
  }

  void assignProducts(List<ProductModel> products) {
    this.products.assignAll(products);
    sortProducts('Tên');
  }
}
