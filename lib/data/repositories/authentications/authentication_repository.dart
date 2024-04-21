import 'package:ecommerce_firebase_getx/features/authentication/screens/login/login.dart';
import 'package:ecommerce_firebase_getx/features/authentication/screens/onboarding/onboarding.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AuhenticationRepository extends GetxController {
  static AuhenticationRepository get instamce => Get.find();

  ///variables
  final deviceStorage = GetStorage();

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
}
