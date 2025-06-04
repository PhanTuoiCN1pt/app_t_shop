import 'package:app_t_shop/data/repositories/product/product_repository.dart';
import 'package:app_t_shop/features/shop/models/product_model.dart';
import 'package:app_t_shop/utils/constants/enums.dart';
import 'package:app_t_shop/utils/popups/loaders.dart';
import 'package:get/get.dart';

import '../../../../utils/helpers/helper_functions.dart';

class ProductController extends GetxController {
  static ProductController get instance => Get.find();

  final isLoading = false.obs;
  final productRepository = Get.put(ProductRepository());
  RxList<ProductModel> featuredProducts = <ProductModel>[].obs;

  @override
  void onInit() {
    fetchFeatureProducts();
    super.onInit();
  }

  void fetchFeatureProducts() async {
    try{
      isLoading.value = true;

      final products = await productRepository.getFeatureProducts();

      featuredProducts.assignAll(products);
    } catch (e) {
      TLoaders.errorSnackBar(title: 'Lỗi',message: e.toString());
    }
    finally {
      isLoading.value = false;
    }
  }

  Future<List<ProductModel>> fetchAllFeatureProducts() async {
    try{

      final products = await productRepository.getAllFeatureProducts();
      return products;
    } catch (e) {
      TLoaders.errorSnackBar(title: 'Lỗi',message: e.toString());
      return [];
    }
  }

  String getProductPrice(ProductModel product) {
    double smallestPrice = double.infinity;
    double largestPrice = 0.0;

    if(product.productType == ProductType.single.toString()) {
      return THelperFunctions.formatNumber(product.salePrice > 0 ? product.salePrice : product.price);
    }else {
      for(var variation in product.productVariations!){
        double priceToConsider = variation.salePrice > 0.0 ? variation.salePrice : variation.price;
        if(priceToConsider < smallestPrice) {
          smallestPrice = priceToConsider;
        }
        if(priceToConsider > largestPrice){
          largestPrice = priceToConsider;
        }
       }
      if (smallestPrice.isEqual(largestPrice)){
        return '${THelperFunctions.formatNumber(largestPrice)},000 đ';
      } else {
        return '${THelperFunctions.formatNumber(smallestPrice)},000 - ${THelperFunctions.formatNumber(largestPrice)}';
      }
    }
  }

  String? calculateSalePercentage(double originalPrice, double? salePrice) {
    if (salePrice == null || salePrice <= 0.0) return null;
    if (originalPrice <= 0) return null;

    double percentage = ((originalPrice - salePrice) / originalPrice) * 100;
    return percentage.toStringAsFixed(0);
  }

  String getProductStockStatus(int stock) {
    return stock > 0 ? 'Còn hàng' : 'Hết hàng';
  }

}