import 'package:ecommerce_firebase_getx/features/authentication/screens/login/login.dart';
import 'package:ecommerce_firebase_getx/features/authentication/screens/onboarding/onboarding.dart';
import 'package:ecommerce_firebase_getx/features/authentication/screens/signup/verify_email.dart';
import 'package:ecommerce_firebase_getx/navigation_menu.dart';
import 'package:ecommerce_firebase_getx/utils/exceptions/firebase_exceptions.dart';
import 'package:ecommerce_firebase_getx/utils/exceptions/platform_exceptions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuhenticationRepository extends GetxController {
  static AuhenticationRepository get instance => Get.find();

  ///variables
  final deviceStorage = GetStorage();
  final _auth = FirebaseAuth.instance;
  final GithubAuthProvider _githubProvider = GithubAuthProvider();

  ///Called from man.dart on app launch

  @override
  void onReady() {
    FlutterNativeSplash.remove();
    screenRedirect();
  }

  ///Function to show Relevant screen
  screenRedirect() async {
    final user = await _auth.currentUser;

    if (user != null) {
      if (user.emailVerified) {
        Get.to(() => const NavigationMenu());
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

  ///[GoogleOAUTH] GOOGLE
  Future<UserCredential> signInWithGoogle() async {
    try {
      //trigger the authentication flow
      final GoogleSignInAccount? userAccount = await GoogleSignIn().signIn();

      //Obtain the auth details from the request
      final GoogleSignInAuthentication? googleAuth =
          await userAccount?.authentication;

      //create a new credential
      final credential = GoogleAuthProvider.credential(
          accessToken: googleAuth?.accessToken, idToken: googleAuth?.idToken);

      //once sign in return the userCredential
      return await _auth.signInWithCredential(credential);
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

  ///[FacebookOAUTH] GOOGLE
  Future<UserCredential> signInWithFacebook() async {
    try {
      //trigger the authentication flow
      final LoginResult userAccount = await FacebookAuth.instance.login();
      print("login result fb $userAccount");

      //Create a new credential
      final OAuthCredential facebookAuthCredential =
          await FacebookAuthProvider.credential(userAccount.accessToken!.token);

      //once sign in return the userCredential
      return await FirebaseAuth.instance
          .signInWithCredential(facebookAuthCredential);
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

  ///[GithubOAUTH] GOOGLE
  Future<UserCredential> signInWithGithub() async {
    try {
      final GithubAuthProvider githubAuthProvider = GithubAuthProvider();
      print("USER CREDENTIALS github $githubAuthProvider");
      final result =
          FirebaseAuth.instance.signInWithProvider(githubAuthProvider);
      UserCredential token = await _auth.signInWithProvider(githubAuthProvider);

      print("Token $token");
      print("result ${result}");
      var provider = OAuthProvider("github.com");

      print("Provider ${provider.credential()}");
      final Map<String, String> params = {"allow_signup": "false"};
      final List<String> scope = ["user:email"];
      provider.setCustomParameters(params);
      provider.setScopes(scope);
      provider.credential(
          idToken: '9e10a0f38abd6ac80f96',
          secret: "e7724844fb551556a01f648cca82f968e31c63a9");

      // print("result $provider");
      return result;
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

  ///[EmailAuthentication] Forget Password
  ///[EmailVerification] Forget Password

  Future<void> sendPasswordResetEmail(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
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

  ///  /*============ Federated identity & Social Login =================*/
  ///   /*============ End of Federated identity & Social Login  =================*/

  ///[LogoutUser] Valid for authentication
  Future<void> logout() async {
    try {
      await GoogleSignIn().signOut();
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
