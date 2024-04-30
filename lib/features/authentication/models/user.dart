import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:bliguh/utils/formatters/formatter.dart';

class UserModel {
  final String id;
  String firstName;
  String lastName;
  final String userName;
  final String email;
  String phoneNumber;
  String profilePicture;

  UserModel(
      {required this.id,
      required this.firstName,
      required this.lastName,
      required this.userName,
      required this.email,
      required this.phoneNumber,
      required this.profilePicture});

  ///Helper function to get full name
  String get fullName => '$firstName $lastName';

  ///Helper function to format phone nu
  String get formattedPhoneNo => TFormatter.formatPhoneNumber(phoneNumber);

  ///Static function to split  full name into forst and last name
  static List<String> nameParts(fullName) => fullName.split(" ");

  ///Static function to generaate a username from the fullname;
  static String generateUsername(fullName) {
    List<String> nameParts = fullName.split(" ");
    String firstName = nameParts[0].toLowerCase();
    String lastName = nameParts.length > 1 ? nameParts[0].toLowerCase() : "";

    String camelCaseUsername =
        '$firstName$lastName'; //combine first and lastname
    String usernameWithPrefix = "bl_$camelCaseUsername";
    return usernameWithPrefix;
  }

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
        id: json["id"],
        firstName: json["FirstName"],
        lastName: json["LastName"],
        userName: json["UserName"],
        email: json["email"],
        phoneNumber: json["PhoneNumber"],
        profilePicture: json["ProfilePicture"]);
  }

  ///static function to create an empty user model
  static UserModel empty() => UserModel(
      id: '',
      firstName: '',
      lastName: '',
      userName: '',
      email: '',
      phoneNumber: '',
      profilePicture: '');

  Map<String, dynamic> toJson() {
    return {
      'FirstName': firstName,
      'LastName': lastName,
      'UserName': userName,
      'email': email,
      'PhoneNumber': phoneNumber,
      'ProfilePicture': profilePicture,
    };
  }

  factory UserModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    if (document.data() != null) {
      final data = document.data()!;
      return UserModel(
          id: document.id,
          firstName: data["FirstName"] ?? "",
          lastName: data["LastName"] ?? "",
          userName: data["userName"] ?? "",
          email: data["email"] ?? "",
          phoneNumber: data["PhoneNumber"] ?? "",
          profilePicture: data["profilePicture"] ?? "");
    } else {
      return UserModel.empty();
    }
  }
}
