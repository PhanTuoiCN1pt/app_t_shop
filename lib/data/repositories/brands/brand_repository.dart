import 'package:app_t_shop/features/shop/models/brand_model.dart';
import 'package:app_t_shop/utils/constants/image_strings.dart';
import 'package:app_t_shop/utils/exceptions/firebase_exceptions.dart';
import 'package:app_t_shop/utils/exceptions/format_exceptions.dart';
import 'package:app_t_shop/utils/exceptions/platform_exceptions.dart';
import 'package:app_t_shop/utils/popups/full_screen_loader.dart';
import 'package:app_t_shop/utils/popups/loaders.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class BrandRepository extends GetxController {
  static BrandRepository get instance => Get.find();

  final _db = FirebaseFirestore.instance;

  Future<List<BrandModel>> getAllBrands() async {
    try {
      final snapshot = await _db.collection('Brands').get();
      final result = snapshot.docs.map((e) => BrandModel.fromSnapshot(e)).toList();
      return result;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException {
      throw const TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Có gì đó không đúng, vui lòng thử lại';
    }
  }

  Future<List<BrandModel>> getFeatureBrands() async {
    try {
      final snapshot = await _db.collection('Brands').where('IsFeatured',isEqualTo: true).limit(4).get();
      return snapshot.docs.map((e) => BrandModel.fromSnapshot(e)).toList();
    } on FirebaseException catch (e) {
      throw e.message!;
    } on PlatformException catch (e) {
      throw e.message!;
    } catch (e) {
      throw e.toString();
    }
  }


  /// Tải lên danh sách thương hiệu vào Firestore
  Future<void> uploadBrands(List<BrandModel> brands) async {
    try {
      TFullScreenLoader.openLoadingDialog('Đang tải lên', TImages.docerAnimation);

      // Tải lên từng thương hiệu
      for (var brand in brands) {
        await _db.collection('Brands').doc(brand.id).set({
          'Id': brand.id,
          'Name': brand.name,
          'Image': brand.image,
          'IsFeatured': brand.isFeatured,
          'ProductsCount': brand.productsCount,
        });
      }

      TFullScreenLoader.stopLoading();
      print("Tất cả thương hiệu đã được tải lên thành công!");

      // Hiển thị thông báo thành công cho người dùng
      TLoaders.successSnackBar(title: 'Thành công', message: 'Tải dữ liệu thành công!');
    } catch (e) {
      print("Lỗi tải lên: $e");
    }
  }
}


