import 'package:ecommerce_firebase_getx/features/authentication/screens/signup/controllers/signup_controller.dart';
import 'package:ecommerce_firebase_getx/utils/constants/colors.dart';
import 'package:ecommerce_firebase_getx/utils/constants/sizes.dart';
import 'package:ecommerce_firebase_getx/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class TermsandConditions extends StatelessWidget {
  const TermsandConditions({
    super.key,
    required this.dark,
  });

  final bool dark;

  @override
  Widget build(BuildContext context) {
    final controller = SignupController.instance;
    return Row(
      children: [
        Obx(
          () => Container(
            padding: const EdgeInsets.all(4.0),
            decoration: BoxDecoration(
                color: controller.privacyPolicy.value
                    ? TColors.primary
                    : Colors.transparent,
                borderRadius: BorderRadius.circular(7),
                border: Border.all(color: TColors.black)),
            width: 24.5,
            height: 24.5,
            child: Checkbox(
              onChanged: (value) => controller.privacyPolicy.value =
                  !controller.privacyPolicy.value,
              value: controller.privacyPolicy.value,
              hoverColor: Colors.transparent,
              side: BorderSide(width: 0, color: Colors.transparent),
            ),
          ),
        ),
        const SizedBox(
          width: TSizes.spaceBtwItems,
        ),
        Text.rich(TextSpan(children: [
          TextSpan(
              text: '${TTexts.iAgreeTo} ',
              style: Theme.of(context).textTheme.bodySmall),
          TextSpan(
              text: TTexts.privacyPolicy,
              style: Theme.of(context).textTheme.bodyMedium!.apply(
                    color: dark ? TColors.white : TColors.black,
                    decoration: TextDecoration.underline,
                    decorationColor: dark ? TColors.white : TColors.black,
                  )),
          TextSpan(
              text: ' ${TTexts.and} ',
              style: Theme.of(context).textTheme.bodySmall),
          TextSpan(
              text: TTexts.termsOfUse,
              style: Theme.of(context).textTheme.bodyMedium!.apply(
                    color: dark ? TColors.white : TColors.primary,
                    decoration: TextDecoration.underline,
                    decorationColor: dark ? TColors.white : TColors.primary,
                  )),
        ]))
      ],
    );
  }
}
