import 'package:ecommerce_firebase_getx/bindings/general_bindings.dart';
import 'package:ecommerce_firebase_getx/features/authentication/screens/onboarding/onboarding.dart';
import 'package:ecommerce_firebase_getx/utils/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      themeMode: ThemeMode.system,
      theme: TAppTheme.lightTheme,
      darkTheme: TAppTheme.darkTheme,
      debugShowCheckedModeBanner: false,
      initialBinding: GeneralBindings(),
      home: const OnBoardingScreen(),
      // home: Scaffold(
      //   backgroundColor: TColors.primaryBackground,
      //   body: Lottie.asset(TImages.loadingAnimation,
      //       repeat: true, animate: true, alignment: Alignment.center),)
    );
  }
}
