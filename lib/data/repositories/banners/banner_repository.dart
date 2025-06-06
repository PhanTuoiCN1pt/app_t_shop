import 'dart:io';

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




}
