import 'package:bliguh/common/widgets/loaders/loaders.dart';
import 'package:bliguh/data/repositories/user/user_repository.dart';
import 'package:bliguh/features/authentication/screens/signup/controllers/network_manager.dart';
import 'package:bliguh/features/personalization/controllers/user_controller.dart';
import 'package:bliguh/features/personalization/screens/profile/profile.dart';
import 'package:bliguh/utils/constants/image_strings.dart';
import 'package:bliguh/utils/helpers/loader/fullscreen_loader.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UpdateNameController extends GetxController {
  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final userController = UserController.instance;
  final userRepository = Get.put(UserRepository());
  GlobalKey<FormState> updateUsernameFormKey = GlobalKey<FormState>();

  @override
  void onInit() {
    initializeNames();
    super.onInit();
  }

  Future<void> initializeNames() async {
    firstName.text = userController.user.value.firstName;
    lastName.text = userController.user.value.lastName;
  }

  Future<void> updateUsername() async {
    try {
      FullScreenLoader.openLoadingDialog(
          'We are updating your information...', TImages.bliguhloader);

      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        FullScreenLoader.stopLoading();
        return;
      }

      if (!updateUsernameFormKey.currentState!.validate()) {
        FullScreenLoader.stopLoading();
        return;
      }

      //update user first & last name in the firebase firestore
      Map<String, dynamic> name = {
        'FirstName': firstName.text.trim(),
        'LastName': lastName.text.trim()
      };
      await userRepository.updateSingleField(name);

      //update the user value
      userController.user.value.firstName = firstName.text.trim();
      userController.user.value.lastName = lastName.text.trim();

      FullScreenLoader.stopLoading();

      Loaders.successSnackBar(
          title: 'Congrulatulations', message: 'Your name has been updated');

      //back
      Get.off(() => const ProfileScreen());
    } catch (e) {
      FullScreenLoader.stopLoading();
      Loaders.errorSnackBar(title: 'Ohh snap', message: e.toString());
    }
  }
}
