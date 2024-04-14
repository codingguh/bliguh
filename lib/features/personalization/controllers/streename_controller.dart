import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StreetNameController extends GetxController {
  final controller = TextEditingController();
  final addressFocusNode = FocusNode();
  final RxBool isFocused = false.obs;

  @override
  void onInit() {
    super.onInit();
    controller.addListener(() {
      isFocused.value = addressFocusNode.hasFocus && controller.text.length > 0;
    });
    addressFocusNode.addListener(() {
      isFocused.value = addressFocusNode.hasFocus && controller.text.length > 0;
    });
  }

  @override
  void onClose() {
    controller.dispose();
    addressFocusNode.dispose();
    super.onClose();
  }
}
