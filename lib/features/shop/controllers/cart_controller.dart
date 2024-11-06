import 'package:app_t_shop/features/shop/controllers/product/variation_controller.dart';
import 'package:app_t_shop/features/shop/models/cart_item_model.dart';
import 'package:app_t_shop/features/shop/models/product_model.dart';
import 'package:app_t_shop/utils/constants/enums.dart';
import 'package:app_t_shop/utils/popups/loaders.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  static CartController get instance => Get.find();

  RxInt noOfCartItems = 0.obs;
  RxDouble totalCartPrice = 0.0.obs;
  RxInt productQuantityInCart = 0.obs;
  RxList<CartItemModel> cartItems = <CartItemModel>[].obs;
  final variationController = VariationController.instance;


  // Add items in the Cart
  void adaToCart(ProductModel product) {
// Quantity Check
    if (productQuantityInCart.value < 1) {
      TLoaders.customToast(message: 'Chọn số lượng');
      return;
    }
// Variation Selected?
    if (product.productType == ProductType.variable.toString() &&
        variationController.selectedVariation.value.id.isEmpty) {
      TLoaders.customToast(message: 'Chọn thể loại');
      return;
    }
// Out of stock Status
    if (product.productType == ProductType.variable.toString()) {
      if (variationController.selectedVariation.value.stock < 1) {
        TLoaders.warningSnackBar(
            message: 'Đã hết hàng.', title: 'Opp!');
        return;
      }
    } else if (product.stock < 1) {
      TLoaders.warningSnackBar(
          message: 'Đã hết hàng!', title: 'Opp!');
      return;
    }
  }

  // Convert the ProductModel to a CartItemModel with the given quantity

  // Thís function convert a ProductModel to a CartItemModel
  CartItemModel convertToCartItem(ProductModel product, int quantity) {
    if (product.productType == ProductType.single.toString()){
      // Reset Variation in case of single product type
      variationController.resetSelectedAttributes();
    }

    final variation = variationController.selectedVariation.value;
    final isVariation = variation.id.isNotEmpty;
    final price = isVariation
        ? variation. salePrice > 0.0
          ? variation.salePrice
          : variation.price
        : product.salePrice > 0.0
          ? product.salePrice
          : product.price;

    return CartItemModel(
        productId: product.id,
        title: product.title,
        price: price,
        quantity: quantity,
        variationId: variation.id,
        image: isVariation ? variation.image : product.thumbnail,
        brandName: product.brand != null ? product.brand!.name : '',
        selectedVariation: isVariation ? variation.attributeValues : null
    );
  }

}