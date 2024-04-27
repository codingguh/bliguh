import 'package:ecommerce_firebase_getx/common/widgets/loaders/animation_loader.dart';
import 'package:ecommerce_firebase_getx/utils/constants/colors.dart';
import 'package:ecommerce_firebase_getx/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FullScreenLoader {
  static void openLoadingDialog(String text, String animation) {
    //ope a ful screen dialog with a given text amd animation
    //this method does'nt return anything

    showDialog(
        context: Get.overlayContext!,
        builder: (_) => PopScope(
            canPop: false,
            child: Container(
              color: THelperFunctions.isDarkMode(Get.context!)
                  ? TColors.dark
                  : TColors.light.withOpacity(0.45),
              width: double.infinity,
              height: double.infinity,
              child: Column(
                children: [
                  const SizedBox(
                    height: 250,
                  ),
                  AnimationLoader(text: text, animation: animation)
                ],
              ),
            )));
  }

  //Stop the currently open loading dialog
  //this method does'nt return anything
  static stopLoading() {
    Navigator.of(Get.overlayContext!).pop();
  }
}
