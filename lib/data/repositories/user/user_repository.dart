import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_firebase_getx/features/authentication/models/user.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class UserRepository extends GetxController {
  static UserRepository get instance => Get.find();

  final FirebaseFirestore _db = FirebaseFirestore.instance;

  //Function to save user data to firestore
  Future<void> saveUserRecord(UserModel user) async {
    try {
      await _db.collection("Users").doc(user.id).set(user.toJson());
    } on FirebaseException catch (e) {
      throw "firebase exceptions ${e.message.toString()}";
    } on FormatException catch (e) {
      throw "format exceptions ${e.message.toString()}";
    } on PlatformException catch (e) {
      throw "platform ecception ${e.message.toString()}";
    } catch (e) {
      throw "shomething error here ${e.toString()}";
    }
  }
}
