import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddressController extends GetxController {
  final addressController = TextEditingController();
  final addressFocusNode = FocusNode();
  final RxBool isFocused = false.obs;

  @override
  void onInit() {
    super.onInit();
    addressController.addListener(() {
      isFocused.value =
          addressFocusNode.hasFocus && addressController.text.length > 0;
    });
    addressFocusNode.addListener(() {
      isFocused.value =
          addressFocusNode.hasFocus && addressController.text.length > 0;
    });
  }

  @override
  void onClose() {
    addressController.dispose();
    addressFocusNode.dispose();
    super.onClose();
  }
}

class PhoneNoController extends GetxController {
  final phoneNoController = TextEditingController();
  final phoneNoFocusNode = FocusNode();
  final RxBool isFocused = false.obs;

  @override
  void onInit() {
    super.onInit();
    phoneNoController.addListener(() {
      isFocused.value =
          phoneNoFocusNode.hasFocus && phoneNoController.text.isNotEmpty;
    });
    phoneNoFocusNode.addListener(() {
      isFocused.value =
          phoneNoFocusNode.hasFocus && phoneNoController.text.isNotEmpty;
    });
  }

  @override
  void onClose() {
    phoneNoController.dispose();
    phoneNoFocusNode.dispose();
    super.onClose();
  }
}
