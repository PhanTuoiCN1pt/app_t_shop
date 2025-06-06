import 'package:app_t_shop/data/repositories/categories/category_repository.dart';
import 'package:app_t_shop/data/repositories/product/product_repository.dart';
import 'package:app_t_shop/features/shop/models/category_model.dart';
import 'package:app_t_shop/features/shop/models/product_model.dart';
import 'package:app_t_shop/utils/popups/loaders.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class CategoryController extends GetxController {
  static CategoryController get instance => Get.find();

  final isLoading = false.obs;
  final _db = FirebaseFirestore.instance;

  final _categoryRepository = Get.put(CategoryRepository());
  RxList<CategoryModel> allCategories = <CategoryModel>[].obs;
  RxList<CategoryModel> featuredCategories = <CategoryModel>[].obs;

  @override
  void onInit() {
    fetchCategories();
    super.onInit();
  }

  Future<void> fetchCategories() async {
    try {

      isLoading.value = true;

      final categories = await _categoryRepository.getAllCategories();

      allCategories.assignAll(categories);

      featuredCategories.assignAll(allCategories.where((category) => category.isFeatured && category.parentId.isEmpty).take(8).toList());

    } catch (e) {
      TLoaders.errorSnackBar(title: 'Lỗi',message: e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  Future<List<CategoryModel>> getSubCategories(String categoryId) async{

    try {
      final subCategories = await _categoryRepository.getSubCategories(categoryId);
      return subCategories;

    } catch (e) {
      return [];
    }
  }

  Future<List<ProductModel>> getCategoryProductsHome({required String categoryId, int limit = 10}) async {
    try {

      final snapshot = await _db.collection('Products').where('CategoryId', isEqualTo: categoryId).limit(limit).get();
      final products = snapshot.docs.map((doc) => ProductModel.fromSnapshot(doc)).toList();
      return products;
    } catch (e) {
      print('Lỗi khi lấy sản phẩm: $e');
      return [];
    }
  }
  Future<List<ProductModel>> getCategoryProductsStore({required String categoryId, int limit = 10}) async {
    try {

      final products = await ProductRepository.instance.getProductsForCategory(categoryId: categoryId, limit: limit);
      return products;
    } catch (e) {
      print('Lỗi khi lấy sản phẩm: $e');
      return [];
    }
  }

}