import 'package:ecommerce_firebase_getx/features/authentication/screens/login/login.dart';
import 'package:ecommerce_firebase_getx/features/authentication/screens/onboarding/onboarding.dart';
import 'package:ecommerce_firebase_getx/features/authentication/screens/signup/verify_email.dart';
import 'package:ecommerce_firebase_getx/navigation_menu.dart';
import 'package:ecommerce_firebase_getx/utils/exceptions/firebase_exceptions.dart';
import 'package:ecommerce_firebase_getx/utils/exceptions/platform_exceptions.dart';
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
    final user = _auth.currentUser;
    if (user != null) {
      if (user.emailVerified) {
        Get.offAll(() => const NavigationMenu());
      } else {
        Get.offAll(() => VerifyEmailScreen(
              email: _auth.currentUser?.email,
            ));
      }
    } else {
      //Local Storage
      deviceStorage.writeIfNull('isFirstTime', true);
      //check if it's the first time launching the app
      deviceStorage.read('iisFirstTime') != true
          ? Get.offAll(() => const LoginScreen())
          : Get.offAll(() => const OnBoardingScreen());
    }
  }

  /*============ Email & Password Signin =================*/

  ///[EmailAuthentication] SIGNIN
  Future<UserCredential> loginWithEmailAndPassword(
      String email, String password) async {
    try {
      return await _auth.signInWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthException(e.code).message;
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

  ///[EmailVerification] Mail Verification
  Future<void> sendEmailVerification() async {
    try {
      await _auth.currentUser?.sendEmailVerification();
    } on FirebaseAuthException catch (e) {
      print(e.message);
      throw TFirebaseAuthException(e.code).message;
      // throw FirebaseAuthException(message: e.message, code: e.code).message;
    } on FirebaseException catch (e) {
      print(e.message);
      throw TFirebaseException(e.code).message;
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

  ///[EmailReauthenticate] Reauthenticate User
  ///[EmailAuthentication] Forget Password

  ///  /*============ Federated identity & Social Login =================*/
  ///   /*============ End of Federated identity & Social Login  =================*/

  ///[LogoutUser] Valid for authentication
  Future<void> logout() async {
    try {
      await FirebaseAuth.instance.signOut();
      Get.offAll(() => const LoginScreen());
    } on FirebaseAuthException catch (e) {
      print(e.message);
      throw TFirebaseAuthException(e.code).message;
      // throw FirebaseAuthException(message: e.message, code: e.code).message;
    } on FirebaseException catch (e) {
      print(e.message);
      throw TFirebaseException(e.code).message;
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

  ///[DeleteUser] Remove user Auth and Firestore Account
}
