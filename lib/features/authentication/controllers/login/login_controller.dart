import 'package:bliguh/common/widgets/loaders/loaders.dart';
import 'package:bliguh/data/repositories/authentications/authentication_repository.dart';
import 'package:bliguh/features/authentication/screens/signup/controllers/network_manager.dart';
import 'package:bliguh/features/personalization/controllers/user_controller.dart';
import 'package:bliguh/utils/constants/image_strings.dart';
import 'package:bliguh/utils/helpers/loader/fullscreen_loader.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class LoginController extends GetxController {
  /// Variables
  final rememberMe = false.obs;
  final hidePassword = true.obs;
  final localStorage = GetStorage();
  final email = TextEditingController();
  final password = TextEditingController();
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  final userController = Get.put(UserController());

  @override
  void onInit() {
    email.text = localStorage.read('REMEMBER_ME_EMAIL') ?? '';
    password.text = localStorage.read('REMEMBER_ME_PASSWORD') ?? '';
    _checkLoggedIn();
    super.onInit();
  }

  void _checkLoggedIn() async {
    localStorage.read('GITHUB_IS_LOGIN') ?? false;
    localStorage.read('GITHUB_USERNAME') ?? '';
  }

  /// -- Email and Password SignIn
  Future<void> emailAndPasswordSignIn() async {
    try {
      // Start Loading
      FullScreenLoader.openLoadingDialog(
          'Logging you in... ', TImages.bliguhloader);

      //Check internet connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        FullScreenLoader.stopLoading();

        return;
      }

      //Form Validation
      if (!loginFormKey.currentState!.validate()) {
        FullScreenLoader.stopLoading();

        return;
      }

      //Save Data if Remember Me is selected
      if (rememberMe.value) {
        localStorage.write('REMEMBER_ME_EMAIL', email.text.trim());
        localStorage.write('REMEMBER_ME_PASSWORD', password.text.trim());
      }

      //Login user using Email & Password Authenticaation
      final userCredential = await AuhenticationRepository.instance
          .loginWithEmailAndPassword(email.text.trim(), password.text.trim());

      //save user record
      await userController.saveUserRecord(userCredential);

      //Save user records

      //Remove loader
      FullScreenLoader.stopLoading();

      //Redirect
      AuhenticationRepository.instance.screenRedirect();
    } catch (e) {
      FullScreenLoader.stopLoading();
      Loaders.errorSnackBar(title: 'Oh snap', message: e.toString());
    }
  }

  Future<void> googleSignIn() async {
    try {
      //start loading
      FullScreenLoader.openLoadingDialog('Loggin you in', TImages.bliguhloader);

      //check internet connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        FullScreenLoader.stopLoading();
        return;
      }

      //Google Authentication
      final userCredentials =
          await AuhenticationRepository.instance.signInWithGoogle();

      //save user record
      await userController.saveUserRecord(userCredentials);

      //Redirect
      AuhenticationRepository.instance.screenRedirect();

      //Remove loaders
      FullScreenLoader.stopLoading();
    } catch (e) {
      Future.delayed(Duration(microseconds: 900), () {
        FullScreenLoader.stopLoading();
        Loaders.errorSnackBar(title: 'Oh snap', message: e.toString());
      });
    }
  }

  Future<void> facebookSignIn() async {
    try {
      //start loading
      FullScreenLoader.openLoadingDialog('Loggin you in', TImages.bliguhloader);

      //check internet connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        FullScreenLoader.stopLoading();
        return;
      }

      //Google Authentication
      final userCredentials =
          await AuhenticationRepository.instance.signInWithFacebook();

      //save user record
      await userController.saveUserRecord(userCredentials);

      //Redirect
      AuhenticationRepository.instance.screenRedirect();

      //Remove loaders
      FullScreenLoader.stopLoading();
    } catch (e) {
      FullScreenLoader.stopLoading();
      Loaders.errorSnackBar(title: 'Oh snap', message: e.toString());
    }
  }

  Future<void> githubSignIn(BuildContext context) async {
    try {
      //start loading
      FullScreenLoader.openLoadingDialog('Loggin you in', TImages.bliguhloader);

      //check internet connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        FullScreenLoader.stopLoading();
        return;
      }

      //Google Authentication
      final UserCredential userCredentials =
          await AuhenticationRepository.instance.signInWithGithub();

      print('my github user ${userCredentials}');
      //save user record
      // await userController.saveUserRecord(userCredentials);

      //Redirect
      // AuhenticationRepository.instance.screenRedirect();

      //Remove loaders
      // FullScreenLoader.stopLoading();
    } catch (e) {
      FullScreenLoader.stopLoading();
      Loaders.errorSnackBar(title: 'Oh snap', message: e.toString());
    }
  }
}
