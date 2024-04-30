import 'package:bliguh/features/authentication/controllers/forget_password/forget_password_controller.dart';
import 'package:bliguh/features/authentication/screens/login/login.dart';
import 'package:bliguh/features/authentication/screens/password/configuration/forget_password.dart';
import 'package:bliguh/utils/constants/image_strings.dart';
import 'package:bliguh/utils/constants/sizes.dart';
import 'package:bliguh/utils/constants/text_strings.dart';
import 'package:bliguh/utils/helpers/helper_functions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key, required this.email});

  final String email;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          actions: [
            IconButton(
                onPressed: () => Get.to(() => ForgetPassword()),
                icon: const Icon(CupertinoIcons.clear))
          ],
        ),
        body: Padding(
          padding: EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              ///Image
              Image(
                image: AssetImage(TImages.resetpassword),
                width: THelperFunctions.screenWidth() * 0.6,
              ),
              const SizedBox(
                height: TSizes.spaceBtwSections,
              ),

              ///Email Title and Subtitle
              Text(
                email,
                style: Theme.of(context).textTheme.bodyMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: TSizes.spaceBtwItems,
              ),
              Text(
                TTexts.changeYourPasswordTitle,
                style: Theme.of(context).textTheme.headlineMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: TSizes.spaceBtwItems,
              ),
              Text(
                TTexts.changeYourPasswordSubTitle,
                style: Theme.of(context).textTheme.labelMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: TSizes.spaceBtwSections,
              ),

              ///Buttons
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () => Get.offAll(() => const LoginScreen()),
                    child: const Text(TTexts.done)),
              ),
              const SizedBox(
                height: TSizes.spaceBtwItems,
              ),

              ///Buttons
              SizedBox(
                width: double.infinity,
                child: TextButton(
                    onPressed: () => ForgetPasswordController.instance
                        .resendPasswordResetEmail(email),
                    child: const Text(TTexts.resendEmail)),
              ),
            ],
          ),
        ));
  }
}
