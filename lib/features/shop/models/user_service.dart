import 'package:cloud_firestore/cloud_firestore.dart';

class UserData {
  final String id;
  final String name;
  final String avatarUrl;

  UserData({
    required this.id,
    required this.name,
    required this.avatarUrl,
  });

  factory UserData.fromMap(Map<String, dynamic> map, String id) {
    return UserData(
      id: id,
      name: map['Username'] ?? 'Người dùng',
      avatarUrl: map['ProfilePicture'] ?? '',
    );
  }
}

class UserService {
  static final _db = FirebaseFirestore.instance;

  /// Lấy thông tin người dùng từ Firestore theo userId
  static Future<UserData> getUserById(String userId) async {
    final doc = await _db.collection('Users').doc(userId).get();

    if (!doc.exists || doc.data() == null) {
      throw Exception('Không tìm thấy người dùng');
    }

    return UserData.fromMap(doc.data()!, doc.id);
  }
}
