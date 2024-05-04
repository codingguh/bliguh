import 'package:bliguh/features/shop/models/category_model.dart';
import 'package:bliguh/services/firebaase_storage_service.dart';
import 'package:bliguh/utils/exceptions/firebase_exceptions.dart';
import 'package:bliguh/utils/exceptions/platform_exceptions.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class CategoryRepository extends GetxController {
  static CategoryRepository get instance => Get.find();

  //variables
  final _db = FirebaseFirestore.instance;

  // Get all categories
  Future<List<CategoryModel>> getAllCategories() async {
    try {
      final snapshot = await _db.collection('Categories').get();
      // print('snapshot ${snapshot.docs}');
      final list = snapshot.docs
          .map((document) => CategoryModel.fromSnapshot(document))
          .toList();
      print('list ${list[0].name}');
      return list;
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again $e';
    }
  }
  //Get Sub Categories

  //Upload Categories to the cloud Firebase
//Uplaod categories to the cloud firebase
  Future<void> uploadDumyDataCategory(List<CategoryModel> categories) async {
    try {
      final storage = Get.put(TFirebaseStorageService());

      //Loop through each category
      for (var category in categories) {
        final file = await storage.getImageDataFromAsset(category.image);

        print('file name ${file}');

        //Upload image nd get its url
        final url =
            await storage.uploadImageData('Categories', file, category.name);

//assign url to category.image attribute
        category.image = url;
        //store category in firestore
        await _db
            .collection('Categories')
            .doc(category.id)
            .set(category.toJson());
      }
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } catch (e) {
      throw 'shomething went wrong $e';
    }
  }
}
