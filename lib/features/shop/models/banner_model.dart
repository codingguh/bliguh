import 'package:cloud_firestore/cloud_firestore.dart';

class BannerModel {
  String imageUrl;
  final String targetScreen;
  final bool active;

  BannerModel({
    required this.imageUrl,
    required this.targetScreen,
    required this.active,
  });

//Empty helper function
  static BannerModel empty() =>
      BannerModel(imageUrl: '', targetScreen: '', active: false);

  ///Convert Model to Json structure so that you can store data
  Map<String, dynamic> toJson() {
    return {
      'ImageUrl': imageUrl,
      'TargetScreen': targetScreen,
      'Active': active,
    };
  }

  ///Map Json oriented document snapshot from firebase to UserModel
  factory BannerModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data() as Map<String, dynamic>;
    //Map JSON Record to the Model
    return BannerModel(
        imageUrl: data['ImageUrl'] ?? '',
        targetScreen: data['TargetScreen'] ?? '',
        active: data['Active'] ?? false);
  }
}
