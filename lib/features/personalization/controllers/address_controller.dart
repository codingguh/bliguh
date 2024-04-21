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

class StreetNoController extends GetxController {
  final streetNoController = TextEditingController();
  final streetNoFocusNode = FocusNode();
  final RxBool isFocused = false.obs;

  void setFocus(bool focused) {
    this.isFocused.value = focused;
  }

  @override
  void onInit() {
    super.onInit();

    streetNoController.addListener(() {
      isFocused.value = streetNoFocusNode.hasFocus;
    });
  }

  @override
  void onClose() {
    streetNoController.dispose();
    streetNoFocusNode.dispose();
    super.onClose();
  }
}

class OtherDetailController extends GetxController {
  final otherDetailController = TextEditingController();
  final otherDetailFocusNode = FocusNode();
  final RxBool isFocused = false.obs;

  void setFocus(bool focused) {
    this.isFocused.value = focused;
  }

  @override
  void onInit() {
    super.onInit();
    otherDetailController.addListener(() {
      isFocused.value = otherDetailFocusNode.hasFocus;
    });
  }

  @override
  void onClose() {
    otherDetailController.dispose();
    otherDetailFocusNode.dispose();
    super.onClose();
  }
}
