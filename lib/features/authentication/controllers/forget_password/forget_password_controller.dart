import 'package:bliguh/common/widgets/loaders/loaders.dart';
import 'package:bliguh/data/repositories/authentications/authentication_repository.dart';
import 'package:bliguh/features/authentication/screens/password/configuration/reset_password.dart';
import 'package:bliguh/features/authentication/screens/signup/controllers/network_manager.dart';
import 'package:bliguh/utils/constants/image_strings.dart';
import 'package:bliguh/utils/helpers/loader/fullscreen_loader.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgetPasswordController extends GetxController {
  static ForgetPasswordController get instance => Get.find();

  ///variables
  final email = TextEditingController();
  GlobalKey<FormState> forgetPasswordFormKey = GlobalKey<FormState>();

  ///send reset password email
  sendPasswordResetEmail() async {
    try {
      // Start Loading
      FullScreenLoader.openLoadingDialog(
          'Processing your request', TImages.authloader);

      //check internet connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        FullScreenLoader.stopLoading();
        return;
      }

      //Form validation
      if (!forgetPasswordFormKey.currentState!.validate()) {
        FullScreenLoader.stopLoading();
        return;
      }

      await AuhenticationRepository.instance
          .sendPasswordResetEmail(email.text.trim());
      Loaders.successSnackBar(
          title: 'Email Sent',
          message: 'Reset Password Link has been sent to your account  $email');
      //Redirect
      Get.to(() => ResetPassword(
            email: email.text.trim(),
          ));
    } catch (e) {
      FullScreenLoader.stopLoading();
      Loaders.errorSnackBar(title: 'Oh snap', message: e.toString());
    }
  }

  resendPasswordResetEmail(String email) async {
    try {
      // Start Loading
      FullScreenLoader.openLoadingDialog(
          'Processing your request', TImages.authloader);

      //check internet connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        FullScreenLoader.stopLoading();
        return;
      }

      //Form validation
      if (!forgetPasswordFormKey.currentState!.validate()) {
        FullScreenLoader.stopLoading();
        return;
      }

      await AuhenticationRepository.instance.sendPasswordResetEmail(email);
      FullScreenLoader.stopLoading();
      Loaders.successSnackBar(
          title: 'Email Sent',
          message: 'Resend forgot password link email to your account $email');
    } catch (e) {
      FullScreenLoader.stopLoading();
      Loaders.errorSnackBar(title: 'Oh snap', message: e.toString());
    }
  }
}
