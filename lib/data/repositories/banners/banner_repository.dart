import 'dart:io';

import 'package:app_t_shop/data/dummy_data.dart';
import 'package:app_t_shop/features/shop/controllers/banner_controller.dart';
import 'package:app_t_shop/features/shop/models/banner_model.dart';
import 'package:app_t_shop/utils/constants/image_strings.dart';
import 'package:app_t_shop/utils/exceptions/firebase_exceptions.dart';
import 'package:app_t_shop/utils/exceptions/format_exceptions.dart';
import 'package:app_t_shop/utils/exceptions/platform_exceptions.dart';
import 'package:app_t_shop/utils/popups/full_screen_loader.dart';
import 'package:app_t_shop/utils/popups/loaders.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:path/path.dart'; // Import để sử dụng basename

class BannerRepository extends GetxController {
  static BannerRepository get instance => Get.find();

  final FirebaseFirestore _db = FirebaseFirestore.instance;

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;


  // Fetch danh sách banners từ Firestore
  Future<List<BannerModel>> getAllBanner() async {
    try {
      final result = await _db.collection('Banners').get();
      return result.docs.map((documentSnapshot) => BannerModel.fromSnapshot(documentSnapshot)).toList();
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


  /// Tải lên danh mục vào đám mây Firebase
  Future<void> uploadBanners() async {
    final bannerController = Get.find<BannerController>();

    try {
      TFullScreenLoader.openLoadingDialog('Đang tải lên', TImages.docerAnimation);

      // Tải lên danh mục
      await uploadCategoriesToFirestore(TDummyData.banners);

      TFullScreenLoader.stopLoading();
      print("Tất cả danh mục đã được tải lên thành công!");

      // Gọi phương thức fetchCategories để reload lại dữ liệu
      await bannerController.fetchBanners();

      // Hiển thị thông báo thành công cho người dùng
      TLoaders.successSnackBar(title: 'Thành công', message: 'Tải dữ liệu thành công!');

    } catch (e) {
      print("Lỗi tải lên: $e");
    }
  }

  Future<void> uploadCategoriesToFirestore(List<BannerModel> banners) async {
    for (var banner in banners) {
      try {
        // Tạo một document với ID riêng hoặc sử dụng ID của category
        await _firestore.collection('Banners').doc().set({
          'ImageUrl': banner.imageUrl,
          'TargetScreen': banner.targetScreen,
          'Active': banner.active,
        });
        ///print('Đã tải: ${banner.name}');
      } catch (e) {
        ///print('Không tải được ${banner.name}: $e');
      }
    }
  }

}
