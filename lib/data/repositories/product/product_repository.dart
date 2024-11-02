import 'dart:io';
import 'package:app_t_shop/data/services/firebase_storage_service.dart';
import 'package:app_t_shop/features/shop/controllers/product/product_controller.dart';
import 'package:app_t_shop/features/shop/models/product_model.dart';
import 'package:app_t_shop/utils/constants/enums.dart';
import 'package:app_t_shop/utils/constants/image_strings.dart';
import 'package:app_t_shop/utils/exceptions/firebase_auth_exceptions.dart';
import 'package:app_t_shop/utils/exceptions/firebase_exceptions.dart';
import 'package:app_t_shop/utils/popups/full_screen_loader.dart';
import 'package:app_t_shop/utils/popups/loaders.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class ProductRepository extends GetxController {
  static ProductRepository get instance => Get.find();

  final _db = FirebaseFirestore.instance;

Future<List<ProductModel>> getFeatureProducts() async {
  try {
    final snapshot = await _db.collection('Products').where('IsFeatured',isEqualTo: true).limit(4).get();
    return snapshot.docs.map((e) => ProductModel.fromSnapshot(e)).toList();
  } on FirebaseException catch (e) {
    throw e.message!;
  } on PlatformException catch (e) {
    throw e.message!;
  } catch (e) {
    throw e.toString();
  }
}


  Future<void> uploadDummyData(List<ProductModel> products) async {
    try {
      TFullScreenLoader.openLoadingDialog('Đang tải lên', TImages.docerAnimation);

      final storage = Get.put(TFirebaseStorageService());
      final productController = Get.find<ProductController>();

      for (var product in products) {
        final thumbnail = await storage.getImageDataFormAssets(
            product.thumbnail);

        final url = await storage.uploadImageData('Products/Images', thumbnail, product.thumbnail.toString());

        product.thumbnail = url;

        if (product.images != null && product.images!.isNotEmpty) {
          List<String> imagesUrl = [];
          for (var image in product.images!) {
            final assetImage = await storage.getImageDataFormAssets(image);

            final url = await storage.uploadImageData('Products/Images', assetImage, image);

            imagesUrl.add(url);
          }
          product.images!.clear();
          product.images!.addAll(imagesUrl);
        }
        if (product.productType == ProductType.variable.toString()) {
          for (var variation in product.productVariations!) {
            final assetImage = await storage.getImageDataFormAssets(
                variation.image);
            final url = await storage.uploadImageData(
                'Products/Images', assetImage, variation.image);
            variation.image = url;
          }
        }
        await productController.featuredProducts();
        await _db.collection("Products").doc(product.id).set(product.toJson());
        print("Tất cả danh mục đã được tải lên thành công!");
        TLoaders.successSnackBar(title: 'Thành công', message: 'Tải dữ liệu thành công!');
        TFullScreenLoader.stopLoading();
      }
    } on FirebaseException catch (e) {
      throw e.message!;
    } on SocketException catch (e) {
      throw e.message;
    } on PlatformException catch (e) {
      throw e.message!;
    } catch (e) {
      throw e.toString();
    }
  }
}