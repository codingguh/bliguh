import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:bliguh/data/repositories/authentications/authentication_repository.dart';
import 'package:bliguh/features/authentication/models/user.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

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

  //Function to save user data to firestore
  Future<UserModel> fetchUserDetails() async {
    try {
      final userId = await AuhenticationRepository.instance.authUser?.uid;
      print("user id ${userId}");
      final documentSnapshot = await _db.collection("Users").doc(userId).get();
      print(
          "user id ${documentSnapshot.exists} montonnsda ${documentSnapshot}");
      if (documentSnapshot.exists) {
        return UserModel.fromSnapshot(documentSnapshot);
      } else {
        return UserModel.empty();
      }
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

  //Function to save user data to firestore
  Future<void> updateUserDetail(UserModel updatedUser) async {
    try {
      await _db
          .collection("Users")
          .doc(updatedUser.id)
          .update(updatedUser.toJson());
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

  //Function to save user data to firestore
  Future<void> updateSingleField(Map<String, dynamic> json) async {
    try {
      await _db
          .collection("Users")
          .doc(AuhenticationRepository.instance.authUser?.uid)
          .update(json);
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

  //Function to save user data to firestore
  Future<void> removeUserRecord(String userId) async {
    try {
      await _db.collection("Users").doc(userId).delete();
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

  // Future<String> uploadImage(String path, XFile image) async {
  //   try {} on FirebaseException catch (e) {
  //     throw "firebase exceptions ${e.message.toString()}";
  //   } on FormatException catch (e) {
  //     throw "format exceptions ${e.message.toString()}";
  //   } on PlatformException catch (e) {
  //     throw "platform ecception ${e.message.toString()}";
  //   } catch (e) {
  //     throw "shomething error here ${e.toString()}";
  //   }
  // }
}
