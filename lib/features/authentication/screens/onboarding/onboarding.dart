import 'package:bliguh/features/authentication/controllers/onboarding/onboarding_controller.dart';
import 'package:bliguh/features/authentication/screens/onboarding/widgets/onboarding_dot_navigation.dart';
import 'package:bliguh/utils/constants/colors.dart';
import 'package:bliguh/utils/constants/sizes.dart';
import 'package:bliguh/utils/device/device_utility.dart';
import 'package:flutter/material.dart';
import 'package:bliguh/features/authentication/screens/onboarding/widgets/onboarding_screen.dart';
import 'package:bliguh/features/authentication/screens/onboarding/widgets/onboarding_skip.dart';
import 'package:bliguh/utils/constants/image_strings.dart';
import 'package:bliguh/utils/constants/text_strings.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OnBoardingController());
    return Scaffold(
        body: Stack(
      children: [
        ///Horizontal Scrollable Pages
        PageView.builder(
          controller: controller.pageController,
          itemCount: 3, // Total number of pages
          onPageChanged: controller.updatePageIndicatior,
          itemBuilder: (context, index) {
            return OnBoardingPage(
              image: _getOnBoardingImage(index),
              title: _getOnBoardingTitle(index),
              subTitle: _getOnBoardingSubTitle(index),
            );
          },
        ),

        ///Skip Button
        OnBoardingSkip(),

        ///Dot Navigation SmoothPageIndicator
        OnBoardingDotNavigation(),

        ///Circular Button
        OnBoardingNextButton()
      ],
    ));
  }
}

class OnBoardingNextButton extends StatelessWidget {
  const OnBoardingNextButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
        right: TSizes.defaultSpace,
        bottom: TDeviceUtils.getBottomNavigationBarHeight(),
        child: ElevatedButton(
          onPressed: () => OnBoardingController.instance.nextPage(),
          style: ElevatedButton.styleFrom(
              shape: const CircleBorder(), backgroundColor: TColors.primary),
          child: const Icon(Iconsax.arrow_right_3),
        ));
  }
}

// Function to get OnBoarding Image based on index
String _getOnBoardingImage(int index) {
  switch (index) {
    case 0:
      return TImages.onBoardingImage1;
    case 1:
      return TImages.onBoardingImage2;
    case 2:
      return TImages.onBoardingImage3;
    default:
      return '';
  }
}

// Function to get OnBoarding Title based on index
String _getOnBoardingTitle(int index) {
  switch (index) {
    case 0:
      return TTexts.onBoardingTitle1;
    case 1:
      return TTexts.onBoardingTitle2;
    case 2:
      return TTexts.onBoardingTitle3;
    default:
      return '';
  }
}

// Function to get OnBoarding SubTitle based on index
String _getOnBoardingSubTitle(int index) {
  switch (index) {
    case 0:
      return TTexts.onBoardingSubTitle1;
    case 1:
      return TTexts.onBoardingSubTitle2;
    case 2:
      return TTexts.onBoardingSubTitle3;
    default:
      return '';
  }
}
