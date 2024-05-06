import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class TFirebaseStorageService extends GetxController {
  static TFirebaseStorageService get instance => Get.find();

  final _firebaseStorage = FirebaseStorage.instance;

  ///Upload local asset from IDE
  /// Returns a UintList containig Image data
  Future<Uint8List> getImageDataFromAsset(String path) async {
    try {
      final byteData = await rootBundle.load(path);
      final imageData = byteData.buffer
          .asUint8List(byteData.offsetInBytes, byteData.lengthInBytes);
      return imageData;
    } catch (e) {
      throw 'error loading image data $e';
    }
  }

  ///Upload Image using image data as cloud Firebase Storage
  /// Returns the downlaod URL of the uploaded image
  Future<String> uploadImageData(
      String path, Uint8List image, String name) async {
    try {
      final ref = _firebaseStorage.ref(path).child(name);
      await ref.putData(image);
      final url = await ref.getDownloadURL();
      return url;
    } catch (e) {
      throw 'error upload image data $e';
    }
  }

  ///Upload Image using image data as cloud Firebase Storage
  /// Returns the downlaod URL of the uploaded image
  Future<String> uploadImageFile(String path, XFile image) async {
    try {
      final ref = _firebaseStorage.ref(path).child(image.name);
      await ref.putFile(File(image.path));
      final url = await ref.getDownloadURL();
      return url;
    } catch (e) {
      if (e is FirebaseException) {
        throw 'Firebae exception ${e.message}';
      } else if (e is SocketException) {
        throw 'Network Error ${e.message}';
      } else if (e is PlatformException) {
        throw 'Platform exceptiom ${e.message}';
      } else {
        throw '${e.toString()}';
      }
    }
  }
}
