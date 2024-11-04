import 'package:app_t_shop/data/dummy_data.dart';
import 'package:app_t_shop/data/services/firebase_storage_service.dart';
import 'package:app_t_shop/features/shop/controllers/category_controller.dart';
import 'package:app_t_shop/features/shop/models/category_model.dart';
import 'package:app_t_shop/utils/constants/image_strings.dart';
import 'package:app_t_shop/utils/exceptions/firebase_exceptions.dart';
import 'package:app_t_shop/utils/exceptions/platform_exceptions.dart';
import 'package:app_t_shop/utils/popups/full_screen_loader.dart';
import 'package:app_t_shop/utils/popups/loaders.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class CategoryRepository extends GetxController {
  static CategoryRepository get instance => Get.find();

  /// Biến
  final _db = FirebaseFirestore.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  /// Lấy tất cả các danh mục
  Future<List<CategoryModel>> getAllCategories() async {
    try {
      final snapshot = await _db.collection('Categories').get();
      final list = snapshot.docs.map((document) => CategoryModel.fromSnapshot(document)).toList();
      return list;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Có gì đó không đúng';
    }
  }

  /// Tải lên danh mục vào đám mây Firebase
  Future<void> uploadCategories() async {
    final categoryController = Get.find<CategoryController>();

    try {
      TFullScreenLoader.openLoadingDialog('Đang tải lên', TImages.docerAnimation);

      // Tải lên danh mục
      await uploadCategoriesToFirestore(TDummyData.categories);

      TFullScreenLoader.stopLoading();
      print("Tất cả danh mục đã được tải lên thành công!");

      // Gọi phương thức fetchCategories để reload lại dữ liệu
      await categoryController.fetchCategories();

      // Hiển thị thông báo thành công cho người dùng
      TLoaders.successSnackBar(title: 'Thành công', message: 'Tải dữ liệu thành công!');

    } catch (e) {
      print("Lỗi tải lên: $e");
    }
  }


  Future<List<CategoryModel>> getSubCategories(String categoryId) async {
    try {
      final snapshot = await _db.collection("Categories").where('ParentId', isEqualTo: categoryId).get();
      final result = snapshot.docs.map((e) => CategoryModel.fromSnapshot(e)).toList();
      return result;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Có gì đó không đúng';
    }
  }




  Future<void> uploadCategoriesToFirestore(List<CategoryModel> categories) async {
    for (var category in categories) {
      try {
        // Tạo một document với ID riêng hoặc sử dụng ID của category
        await _firestore.collection('Categories').doc(category.id).set({
          'Name': category.name,
          'Image': category.image,
          'IsFeatured': category.isFeatured,
          'ParentId': category.parentId,
        });
        print('Đã tải: ${category.name}');
      } catch (e) {
        print('Không tải được ${category.name}: $e');
      }
    }
  }


}
