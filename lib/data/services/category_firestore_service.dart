import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:app_t_shop/features/shop/models/category_model.dart';

class CategoryFirestoreService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Hàm thêm danh sách categories vào Firestore
  Future<void> uploadCategoriesToFirestore(List<CategoryModel> categories) async {
    for (var category in categories) {
      try {
        // Tạo một document với ID riêng hoặc sử dụng ID của category
        await _firestore.collection('Categories').doc(category.id).set({
          'Id': category.id,
          'Name': category.name,
          'Image': category.image,
          'IsFeatured': category.isFeatured,
          'ParentId': category.parentId,
        });
        print('Uploaded category: ${category.name}');
      } catch (e) {
        print('Failed to upload category ${category.name}: $e');
      }
    }
  }
}
