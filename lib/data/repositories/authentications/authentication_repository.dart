import 'package:ecommerce_firebase_getx/features/authentication/screens/login/login.dart';
import 'package:ecommerce_firebase_getx/features/authentication/screens/onboarding/onboarding.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AuhenticationRepository extends GetxController {
  static AuhenticationRepository get instance => Get.find();

  ///variables
  final deviceStorage = GetStorage();
  final _auth = FirebaseAuth.instance;

  ///Called from man.dart on app launch

  @override
  void onReady() {
    FlutterNativeSplash.remove();
    screenRedirect();
  }

  ///Function to show Relevant screen
  screenRedirect() async {
    //Local Storage
    deviceStorage.writeIfNull('isFirstTime', true);
    deviceStorage.read('iisFirstTime') != true
        ? Get.offAll(() => const LoginScreen())
        : Get.offAll(() => const OnBoardingScreen());
  }

  /*============ Email & Password Signin =================*/

  ///[EmailAuthentication] SIGNIN
  ///[EmailAuthentication] REGISTER
  Future<UserCredential> registerWithEmailAndPassword(
      String email, String password) async {
    try {
      return await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      print(e.message);
      throw "auth exeption ${e.message.toString()}";
      // throw FirebaseAuthException(message: e.message, code: e.code).message;
    } on FirebaseException catch (e) {
      print(e.message);
      throw "exeption ${e.message.toString()}";
      // throw FirebaseAuthException(message: e.message, code: e.code).message;
    } on FormatException catch (e) {
      print(e.message);
      throw "format exeption ${e.message.toString()}";
      // throw FirebaseAuthException(message: e.message, code: e.code).message;
    } on PlatformException catch (e) {
      print(e.message);
      throw "platform exeption ${e.message.toString()}";
      // throw FirebaseAuthException(message: e.message, code: e.code).message;
    } catch (e) {
      throw "something went wrong ${e.toString()}";
    }
  }
}
