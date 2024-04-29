import 'package:ecommerce_firebase_getx/common/widgets/loaders/loaders.dart';
import 'package:ecommerce_firebase_getx/data/repositories/authentications/authentication_repository.dart';
import 'package:ecommerce_firebase_getx/data/repositories/user/user_repository.dart';
import 'package:ecommerce_firebase_getx/features/authentication/models/user.dart';
import 'package:ecommerce_firebase_getx/features/authentication/screens/signup/controllers/network_manager.dart';
import 'package:ecommerce_firebase_getx/features/authentication/screens/signup/verify_email.dart';
import 'package:ecommerce_firebase_getx/utils/constants/image_strings.dart';
import 'package:ecommerce_firebase_getx/utils/helpers/loader/fullscreen_loader.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupController extends GetxController {
  static SignupController get instance => Get.find();

  ///variables
  final hidePassword = true.obs;
  final privacyPolicy = true.obs;
  final email = TextEditingController();
  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final password = TextEditingController();
  final userName = TextEditingController();
  final phoneNumber = TextEditingController();
  GlobalKey<FormState> signUpFormKey = GlobalKey<FormState>();

  ///method signup
  void signUp() async {
    try {
      //start loading
      FullScreenLoader.openLoadingDialog(
          'We are preserving your information', TImages.bliguhloader);

      //check internet connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        FullScreenLoader.stopLoading();
        return;
      }
      ;

      //Form validation
      if (!signUpFormKey.currentState!.validate()) {
        FullScreenLoader.stopLoading();
        return;
      }
      ;

      //privacy ploicy check
      if (!privacyPolicy.value) {
        Loaders.warningSnackBar(
            title: 'Accept Privacy Policy',
            message:
                'In order to create account, you must to read and accept the privacy policy');
        return;
      }

      //register user in the firebase authentication & save user data in the firebase
      final userCredential = await AuhenticationRepository.instance
          .registerWithEmailAndPassword(
              email.text.trim(), password.text.trim());

      //save Authenticated user data in the Firebase Firestpre
      final newUser = UserModel(
          id: userCredential.user!.uid,
          firstName: firstName.text.trim(),
          lastName: lastName.text.trim(),
          userName: userName.text.trim(),
          email: email.text.trim(),
          phoneNumber: phoneNumber.text.trim(),
          profilePicture: '');
      print("User new $newUser");
      final userRepository = Get.put(UserRepository());
      final userRepo = await userRepository.saveUserRecord(newUser);

      // FullScreenLoader.stopLoading();
      // //show success message
      // Loaders.successSnackBar(
      //     title: 'Congrulatulations',
      //     message: 'Your account has been created verify email to continue');

      // //move to verify email screen
      // Get.to(() => VerifyEmailScreen(
      //       email: email.text.trim(),
      //     ));
    } catch (e) {
      //Remove loader
      FullScreenLoader.stopLoading();
      //Show some Generic error to the user
      Loaders.errorSnackBar(title: 'Oh Snap !', message: e.toString());
    }
  }
}
