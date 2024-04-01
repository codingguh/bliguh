import 'package:ecommerce_firebase_getx/features/authentication/screens.onboarding/onboarding.dart';
import 'package:ecommerce_firebase_getx/utils/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      themeMode: ThemeMode.system,
      darkTheme: TAppTheme.darkTheme,
      theme: TAppTheme.lightTheme,
      home: const OnBoardingScreen(),
    );
  }
}
