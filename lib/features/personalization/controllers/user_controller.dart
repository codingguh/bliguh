import 'package:bliguh/common/widgets/loaders/loaders.dart';
import 'package:bliguh/data/repositories/authentications/authentication_repository.dart';
import 'package:bliguh/data/repositories/user/user_repository.dart';
import 'package:bliguh/features/authentication/models/user.dart';
import 'package:bliguh/features/authentication/screens/login/login.dart';
import 'package:bliguh/features/authentication/screens/signup/controllers/network_manager.dart';
import 'package:bliguh/features/personalization/screens/profile/reauth_login_form.dart';
import 'package:bliguh/utils/constants/image_strings.dart';
import 'package:bliguh/utils/constants/sizes.dart';
import 'package:bliguh/utils/helpers/loader/fullscreen_loader.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserController extends GetxController {
  static UserController get instance => Get.find();
  final userRepository = Get.put(UserRepository());
  final profileLoading = false.obs;
  final providers = <String>[].obs;
  final hidePassword = false.obs;
  final verifyEmail = TextEditingController();
  final verifyPassword = TextEditingController();
  GlobalKey<FormState> reAuthFormKey = GlobalKey<FormState>();
  Rx<UserModel> user = UserModel.empty().obs;

  @override
  void onInit() async {
    super.onInit();
    await fetchUserRecord();
  }

  Future<void> fetchUserRecord() async {
    try {
      profileLoading.value = true;
      final user = await userRepository.fetchUserDetails();
      this.user(user);
    } catch (e) {
      user(UserModel.empty());
    } finally {
      profileLoading.value = false;
    }
  }

  ///Save user record ffrom any Registration provider
  Future<void> saveUserRecord(UserCredential? userCredential) async {
    try {
      if (userCredential != null) {
        //convert Name to first and lastname
        final nameParts =
            UserModel.nameParts(userCredential.user!.displayName ?? '');
        final username =
            UserModel.generateUsername(userCredential.user!.displayName ?? '');

        //Map user data
        final user = UserModel(
          id: userCredential.user!.uid,
          firstName: nameParts[0],
          lastName: nameParts.length > 1 ? nameParts.sublist(1).join(' ') : '',
          userName: username,
          email: userCredential.user!.email ?? "",
          phoneNumber: userCredential.user!.phoneNumber ?? "",
          profilePicture: userCredential.user!.photoURL ?? "",
        );

        //save user data
        await userRepository.saveUserRecord(user);
      }
    } catch (e) {
      Loaders.warningSnackBar(
          title: 'Data Not saved',
          message:
              'Something went wrong while saving your information. You can resave your data in your profile');
    }
  }

  void deleteAccountWarningPopup() {
    Get.defaultDialog(
        backgroundColor: Colors.white,
        contentPadding: const EdgeInsets.all(TSizes.md),
        title: 'Delete Account',
        middleText:
            'Are you sure you want to delete your account permanently? This is not reversible and all of your data will be removed permanently',
        confirm: ElevatedButton(
            onPressed: () async => deleteUserAccount(),
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: TSizes.lg),
              child: Text('Delete'),
            )),
        cancel: OutlinedButton(
            onPressed: () => Navigator.of(Get.overlayContext!).pop(),
            child: const Text('Cancel')));
  }

  void updateProviders(List<String> newProviders) {
    providers.assignAll(newProviders);
  }

  void deleteUserAccount() async {
    try {
      FullScreenLoader.openLoadingDialog('Processing...', TImages.bliguhloader);

      final auth = AuhenticationRepository.instance;
      // final provider =
      //     auth.authUser!.providerData.map((e) => e.providerId).toList();
      // updateProviders(provider);
      // final provider =
      //     auth.authUser!.providerData.map((e) => e.providerId).first;
      // if (providers.isNotEmpty) {
      //   print('not empty');
      //   if (providers.contains('password') &&
      //       providers.contains('google.com')) {
      //     print('not empty 1');
      //     FullScreenLoader.stopLoading();
      //     Get.to(() => const ReAuthLoginForm());
      //   } else if (providers.contains('password') &&
      //       !providers.contains('google.com')) {
      //     print('not empty 2');
      //     FullScreenLoader.stopLoading();
      //     Get.to(() => const ReAuthLoginForm());
      //   } else if (!providers.contains('password') &&
      //       providers.contains('google.com')) {
      //     print('not empty 3');
      //     await auth.signInWithGoogle();
      //     await auth.deleteAccount();
      //     FullScreenLoader.stopLoading();
      //     Get.offAll(() => const ReAuthLoginForm());
      //   }

      //   FullScreenLoader.stopLoading();
      // }
      final provider =
          auth.authUser!.providerData.map((e) => e.providerId).first;
      if (provider.isNotEmpty) {
        print('not empty');
        if (providers.contains('password') &&
            providers.contains('google.com')) {
          await auth.signInWithGoogle();
          await auth.deleteAccount();
          FullScreenLoader.stopLoading();
          Get.offAll(() => const LoginScreen());
        } else if (providers.contains('password') &&
            !providers.contains('google.com')) {
          print('not empty 2');
          FullScreenLoader.stopLoading();
          Get.to(() => const ReAuthLoginForm());
        }
      }
    } catch (e) {
      FullScreenLoader.stopLoading();
      Loaders.warningSnackBar(title: 'Oh snap!', message: e.toString());
    }
  }

  Future<void> reAuthEmailAndPassword() async {
    try {
      FullScreenLoader.openLoadingDialog('Processing', TImages.bliguhloader);

      //check internet connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        FullScreenLoader.stopLoading();
        return;
      }

      if (!reAuthFormKey.currentState!.validate()) {
        FullScreenLoader.stopLoading();
        return;
      }
      await AuhenticationRepository.instance.reAuthEmailAndPassword(
          verifyEmail.text.trim(), verifyPassword.text.trim());
      await AuhenticationRepository.instance.deleteAccount();
      FullScreenLoader.stopLoading();
      Get.offAll(() => const LoginScreen());
    } catch (e) {
      FullScreenLoader.stopLoading();
      Loaders.warningSnackBar(title: 'Oh snap', message: e.toString());
    }
  }
}
