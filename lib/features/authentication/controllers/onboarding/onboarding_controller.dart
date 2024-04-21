import 'package:ecommerce_firebase_getx/features/authentication/screens/login/login.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class OnBoardingController extends GetxController {
  static OnBoardingController get instance => Get.find();

  ///Variables
  final pageController = PageController();
  Rx<int> currentPageIndex = 0.obs;

  ///Update Current index when Page Scroll
  void updatePageIndicatior(index) => currentPageIndex.value = index;

  ///Jump to the specific dot selected page.
  void dotNavigationClick(index) {
    currentPageIndex.value = index;
    pageController.jumpTo(index);
  }

  ///Update Current Index & Jump to next page
  void nextPage() {
    if (currentPageIndex.value == 2) {
      final storage = GetStorage();
      storage.write('isFirstTime', false);
      //get.toLoginScreen

      Get.offAll(
        const LoginScreen(),
        transition: Transition.rightToLeft,
        curve: Curves.ease, // Example of transition animation
        duration: const Duration(
            milliseconds: 500), // Adjust animation duration as needed
      );
    } else {
      int page = currentPageIndex.value + 1;
      pageController.animateToPage(
        page,
        duration: const Duration(
            milliseconds: 300), // Adjust animation duration as needed
        curve: Curves.ease, // Adjust animation curve as needed
      );
    }
  }

  ///Update Current Index & Jump to last Page
  void skipPage() {
    currentPageIndex.value = 2;
    pageController.jumpToPage(2);
  }
}
