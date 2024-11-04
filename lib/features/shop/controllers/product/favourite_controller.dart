import 'dart:convert';

import 'package:app_t_shop/data/repositories/product/product_repository.dart';
import 'package:app_t_shop/features/shop/models/product_model.dart';
import 'package:app_t_shop/utils/local_storage/storage_utility.dart';
import 'package:app_t_shop/utils/popups/loaders.dart';
import 'package:get/get.dart';

class FavouritesController extends GetxController {
  static FavouritesController get instance => Get.find();

  final favourites = <String, bool>{}.obs;

  @override
  void onInit() {
    initFavourites();
    super.onInit();
  }

  Future<void> initFavourites() async {
    final json = TLocalStorage.instance().readData('favorites');
    if (json != null){
      final storedFavourites = jsonDecode(json) as Map<String, dynamic>;
      favourites.assignAll(storedFavourites.map((key, value) => MapEntry(key, value as bool)));
    }
  }

  bool isFavourite(String productId){
    return favourites[productId] ?? false ;
  }

  void toggleFavouriteProduct(String productId){
    if(!favourites.containsKey(productId)){
      favourites[productId] = true;
      saveFavouritesToStorage();
      TLoaders.customToast(message: 'Đã thêm sản phẩm vào list yêu thích');

    }else {
      TLocalStorage.instance().removeData(productId);
      favourites.remove(productId);
      saveFavouritesToStorage();
      favourites.refresh();
      TLoaders.customToast(message: 'Gỡ sản phẩm khỏi list yêu thích');
    }
  }

  void saveFavouritesToStorage() {
    final encodedFavourites = json.encode(favourites);
    TLocalStorage.instance().saveData('favorites', encodedFavourites);
  }

  Future<List<ProductModel>> favouriteProduct() async {
    return await ProductRepository.instance.getFavouriteProduct(favourites.keys.toList());
  }

}