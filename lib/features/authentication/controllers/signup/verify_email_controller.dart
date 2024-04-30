import 'dart:async';

import 'package:bliguh/common/widgets/loaders/loaders.dart';
import 'package:bliguh/common/widgets/success_screen/success_screen.dart';
import 'package:bliguh/utils/constants/image_strings.dart';
import 'package:bliguh/utils/constants/text_strings.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:bliguh/data/repositories/authentications/authentication_repository.dart';

class VerifyEmailController extends GetxController {
  static VerifyEmailController get instance => Get.find();

  /// send email whenever verify screen appears a set Timer for auto redirect
  @override
  void onInit() {
    sendEmailVerification();
    setTimerForAutoRedirect();
    super.onInit();
  }

  /// Send Email verification link
  sendEmailVerification() async {
    try {
      await AuhenticationRepository.instance.sendEmailVerification();
      Loaders.successSnackBar(
          title: 'Email sent',
          message: 'please check your inbox and verify your email');
    } catch (e) {
      Loaders.errorSnackBar(title: 'Oh snap', message: e.toString());
    }
  }

  /// Timer to automatically redirect on Email Verification
  setTimerForAutoRedirect() {
    Timer.periodic(const Duration(seconds: 1), (timer) {
      FirebaseAuth.instance.currentUser?.reload();

      final user = FirebaseAuth.instance.currentUser;
      if (user?.emailVerified ?? false) {
        timer.cancel();
        Get.off(() => SuccessScreen(
            image: TImages.successfullyRegisterAnimation,
            title: TTexts.yourAccountCreatedTitle,
            subTitle: TTexts.yourAccountCreatedSubTitle,
            onPressed: () =>
                AuhenticationRepository.instance.screenRedirect()));
      }
    });
  }

  /// Manually Check if Email verified
  checkEmailVerificationStatus() async {
    final currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser != null && currentUser.emailVerified) {
      Get.off(() => SuccessScreen(
          image: TImages.successfullyRegisterAnimation,
          title: TTexts.yourAccountCreatedTitle,
          subTitle: TTexts.yourAccountCreatedSubTitle,
          onPressed: () => AuhenticationRepository.instance.screenRedirect()));
    }
  }
}
