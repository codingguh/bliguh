import 'package:bliguh/features/authentication/controllers/login/login_controller.dart';
import 'package:bliguh/utils/constants/colors.dart';
import 'package:bliguh/utils/constants/image_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SocialButton extends StatelessWidget {
  const SocialButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: EdgeInsets.all(3),
          decoration: BoxDecoration(
            border: Border.all(color: TColors.grey),
            borderRadius: BorderRadius.circular(100),
          ),
          child: IconButton(
            onPressed: () => controller.googleSignIn(),
            icon: const Image(
                width: 33, height: 33, image: AssetImage(TImages.google)),
          ),
        ),
        const SizedBox(width: 9),
        Container(
          padding: EdgeInsets.all(3),
          // padding: EdgeInsets.zero,
          decoration: BoxDecoration(
            border: Border.all(color: TColors.grey),
            borderRadius: BorderRadius.circular(100),
          ),
          child: IconButton(
            onPressed: () => controller.facebookSignIn(),
            icon: const Image(
                width: 33, height: 33, image: AssetImage(TImages.facebook)),
          ),
        ),
        const SizedBox(width: 9),
        Container(
          padding: EdgeInsets.all(3),
          decoration: BoxDecoration(
            border: Border.all(color: TColors.grey),
            borderRadius: BorderRadius.circular(100),
          ),
          child: IconButton(
            onPressed: () => controller.githubSignIn(context),
            icon: const Image(
                width: 33, height: 33, image: AssetImage(TImages.github)),
          ),
        ),
      ],
    );
  }
}
