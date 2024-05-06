import 'package:bliguh/bindings/general_bindings.dart';
import 'package:bliguh/features/authentication/screens/onboarding/onboarding.dart';
import 'package:bliguh/routes/app_routes.dart';
import 'package:bliguh/utils/constants/colors.dart';
import 'package:bliguh/utils/constants/image_strings.dart';
import 'package:bliguh/utils/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        themeMode: ThemeMode.system,
        theme: TAppTheme.lightTheme,
        darkTheme: TAppTheme.darkTheme,
        debugShowCheckedModeBanner: false,
        initialBinding: GeneralBindings(),
        getPages: AppRoutes.screens,
        home: Scaffold(
          backgroundColor: TColors.primary,
          body: Lottie.asset(TImages.loadingAnimation,
              repeat: true, animate: true, alignment: Alignment.center),
        ));
  }
}
