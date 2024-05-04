import 'dart:io';

import 'package:bliguh/common/widgets/loaders/loaders.dart';
import 'package:bliguh/data/repositories/authentications/authentication_repository.dart';
import 'package:bliguh/data/repositories/user/user_repository.dart';
import 'package:bliguh/features/authentication/models/user_model.dart';
import 'package:bliguh/features/authentication/screens/login/login.dart';
import 'package:bliguh/features/authentication/screens/signup/controllers/network_manager.dart';
import 'package:bliguh/features/personalization/controllers/update_name_controller.dart';
import 'package:bliguh/features/personalization/screens/profile/reauth_login_form.dart';
import 'package:bliguh/utils/constants/colors.dart';
import 'package:bliguh/utils/constants/image_strings.dart';
import 'package:bliguh/utils/constants/sizes.dart';
import 'package:bliguh/utils/helpers/loader/fullscreen_loader.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

class UserController extends GetxController {
  static UserController get instance => Get.find();

  final userRepository = Get.put(UserRepository());
  Rx<UserModel> user = UserModel.empty().obs;

  Rx<File?> file = Rx<File?>(null);

  final profileLoading = false.obs;
  final imageUploading = false.obs;
  final providers = <String>[].obs;
  final hidePassword = false.obs;
  final verifyEmail = TextEditingController();
  final verifyPassword = TextEditingController();
  GlobalKey<FormState> reAuthFormKey = GlobalKey<FormState>();

  final storage = GetStorage();

  @override
  void onInit() async {
    super.onInit();
    await fetchUserRecord();
  }

  Future<void> fetchUserRecord() async {
    try {
      profileLoading.value = true;
      final user = await userRepository.fetchUserDetails();

      print('FETCH USER ${storage.read('user')}');
      this.user(user);
    } catch (e) {
      Loaders.errorSnackBar(title: 'error get data');
      user(UserModel.empty());
    } finally {
      profileLoading.value = false;
    }
  }

  ///Save user record ffrom any Registration provider
  Future<void> saveUserRecord(UserCredential? userCredential) async {
    try {
      //First update Rx User and then check if user data is already stored. If not store new data.
      await fetchUserRecord();
      // print('Google login ${userCredential!.user!.photoURL}');
      if (user.value.id.isEmpty) {
        if (userCredential != null) {
          //convert Name to first and lastname
          final nameParts =
              UserModel.nameParts(userCredential.user!.displayName ?? '');
          final username = UserModel.generateUsername(
              userCredential.user!.displayName ?? '');
          await storage.write('photo', userCredential.user!.photoURL);
          final storedUser = await storage.read('user');
          if (storedUser == null) {
            await storage.write('user', userCredential.user);
          } else {
            await storage.remove('user');
            await storage.write('user', userCredential.user);
          }
          //Map user data
          final user = UserModel(
            id: userCredential.user!.uid,
            firstName: nameParts[0],
            lastName:
                nameParts.length > 1 ? nameParts.sublist(1).join(' ') : '',
            userName: username,
            email: userCredential.user!.email ?? "",
            phoneNumber: userCredential.user!.phoneNumber ?? "",
            profilePicture: userCredential.user!.photoURL ?? "",
          );
          // user.profilePicture = userCredential.user!.photoURL ?? '';
          // var localPhoto = await storage.read('photo');
          // if (localPhoto == null) {
          //   await storage.write('photo', userCredential.user!.photoURL);
          // } else {
          //   await storage.remove('photo');
          //   await storage.write('photo', user.profilePicture);
          // }
          // user.profilePicture.ref÷();
          //save user data
          await userRepository.saveUserRecord(user);
        }
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
      await storage.remove('photo');
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

  uploadUserProfilePicture() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image != null) {
        imageUploading.value = true;
        final imageUrl =
            await userRepository.uploadImage('Users/Images/Profile', image);
        //Update user image record
        Map<String, dynamic> json = {'ProfilePicture': imageUrl};
        await userRepository.updateSingleField(json);

        user.value.profilePicture = imageUrl;
        print('image url $imageUrl-- }');
        user.refresh();
        Loaders.successSnackBar(
            title: 'Congrulatulations',
            message: 'Your profile image has been updated');
      }
    } catch (e) {
      Loaders.errorSnackBar(
          title: 'Oh snap', message: 'something went wrong $e');
    } finally {
      imageUploading.value = false;
    }
  }

  Future<void> updatePhotoProfilePicture(
      String userId, ImageSource source) async {
    try {
      imageUploading.value = true;
      ImagePicker imagePicker = ImagePicker();
      final controller = Get.put(UpdateNameController());
      XFile? file = await imagePicker.pickImage(
        source: source,
        preferredCameraDevice: CameraDevice.front,
      );

      if (file == null) {
        print('No image selected');
        return;
      }

      // Crop the image
      CroppedFile? croppedImage = await ImageCropper().cropImage(
          sourcePath: file.path,
          aspectRatio: CropAspectRatio(
            ratioX: 1, // Same width and height
            ratioY: 1,
          ),
          maxWidth: 666, // Desired width
          maxHeight: 666, // Desired height
          compressQuality: 100,
          uiSettings: [
            AndroidUiSettings(
              toolbarTitle: 'Crop Image',
              toolbarColor: TColors.primary,
              toolbarWidgetColor: Colors.white,
              initAspectRatio: CropAspectRatioPreset.square,
              lockAspectRatio: true,
            ),
            IOSUiSettings(
              minimumAspectRatio: 1.0,
            ),
          ]);

      if (croppedImage == null) {
        print('Image cropping cancelled');
        return;
      }

      // Get reference to the storage
      //  final imageUrl =
      //     await userRepository.uploadImage('Users/Images/Profile', image);
      Reference ref = FirebaseStorage.instance.ref();
      final photoName =
          controller.firstName.text + '_' + controller.lastName.text;

      '';
      Reference referenceDirImages = ref.child('Users/Images/$photoName');

// Convert CroppedFile to File
      File croppedFile = File(croppedImage.path);

      // Upload the cropped image file
      UploadTask uploadTask = referenceDirImages.putFile(croppedFile);

      // Wait for the upload task to complete
      await uploadTask.whenComplete(() async {
        // Get the URL of the uploaded image

        // Update metadata of the uploaded image
        SettableMetadata newMetadata = SettableMetadata(
          cacheControl: 'public,max-age=300',
          contentType: "image/jpeg",
        );
        await referenceDirImages.updateMetadata(newMetadata);

        //Update field in firebase service
        String downloadUrl = await referenceDirImages.getDownloadURL();
        Map<String, dynamic> json = {'ProfilePicture': downloadUrl};
        await userRepository.updateSingleField(json);
        user.value.profilePicture = downloadUrl;

        user.refresh();

        print('download url $downloadUrl');
        Loaders.successSnackBar(
            title: 'Congratulations',
            message: 'Your profile image has been updated');
      });
    } catch (e) {
      Loaders.errorSnackBar(
          title: 'Oh snap', message: 'something went wrong $e');
    } finally {
      imageUploading.value = false;
    }
  }

  void showImageSourceBottomSheet(String userId) {
    Get.bottomSheet(
      Container(
        color: Colors.white,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ListTile(
              leading: Icon(Icons.camera_alt),
              title: Text('Take a photo'),
              onTap: () {
                Get.back();
                updatePhotoProfilePicture(userId, ImageSource.camera);
              },
            ),
            ListTile(
              leading: Icon(Icons.photo_library),
              title: Text('Choose from gallery'),
              onTap: () {
                Get.back();
                updatePhotoProfilePicture(userId, ImageSource.gallery);
              },
            ),
          ],
        ),
      ),
    );
  }
}
