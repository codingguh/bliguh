import 'package:bliguh/features/authentication/screens/login/login.dart';
import 'package:bliguh/features/authentication/screens/signup/controllers/signup_controller.dart';
import 'package:bliguh/utils/constants/colors.dart';
import 'package:bliguh/utils/validators/validation.dart';
import 'package:flutter/material.dart';
import 'package:bliguh/features/authentication/screens/signup/widgets/signup_terms_and_conditions.dart';
import 'package:bliguh/utils/constants/sizes.dart';
import 'package:bliguh/utils/constants/text_strings.dart';
import 'package:bliguh/utils/helpers/helper_functions.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class SignUpForm extends StatelessWidget {
  const SignUpForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    final controller = Get.put(SignupController());
    return Form(
        key: controller.signUpFormKey,
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: controller.firstName,
                    validator: (value) =>
                        TValidator.validateEmptyText('First name', value),
                    expands: false,
                    decoration: InputDecoration(
                        labelText: TTexts.firstName,
                        prefixIcon: Icon(Iconsax.user)),
                  ),
                ),
                const SizedBox(
                  width: TSizes.spaceBtwInputFields,
                ),
                Expanded(
                  child: TextFormField(
                    controller: controller.lastName,
                    validator: (value) =>
                        TValidator.validateEmptyText('Last name', value),
                    expands: false,
                    decoration: InputDecoration(
                      labelText: TTexts.lastName,
                      prefixIcon: Icon(Iconsax.user),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: TSizes.spaceBtwInputFields,
            ),
            TextFormField(
              controller: controller.userName,
              validator: (value) =>
                  TValidator.validateEmptyText('Username', value),
              expands: false,
              decoration: InputDecoration(
                  labelText: TTexts.username,
                  prefixIcon: Icon(Iconsax.user_edit)),
            ),
            const SizedBox(
              height: TSizes.spaceBtwInputFields,
            ),
            TextFormField(
              controller: controller.email,
              validator: (value) => TValidator.validateEmail(value),
              decoration: InputDecoration(
                  labelText: TTexts.email, prefixIcon: Icon(Iconsax.direct)),
            ),
            const SizedBox(
              height: TSizes.spaceBtwInputFields,
            ),
            TextFormField(
              controller: controller.phoneNumber,
              validator: (value) => TValidator.validatePhoneNumber(value),
              decoration: InputDecoration(
                  labelText: TTexts.phoneNo, prefixIcon: Icon(Iconsax.call)),
            ),
            const SizedBox(
              height: TSizes.spaceBtwInputFields,
            ),

            /// Password
            Obx(
              () => TextFormField(
                controller: controller.password,
                obscureText: controller.hidePassword.value,
                validator: (value) => TValidator.validatePassword(value),
                decoration: InputDecoration(
                    labelText: TTexts.password,
                    prefixIcon: Icon(Iconsax.password_check),
                    suffixIcon: IconButton(
                        onPressed: () => controller.hidePassword.value =
                            !controller.hidePassword.value,
                        icon: Icon(controller.hidePassword.value
                            ? Iconsax.eye_slash
                            : Iconsax.eye))),
              ),
            ),
            const SizedBox(height: TSizes.spaceBtwItems / 1.5),

            ///Terms and cONDITION cHECKBOX
            TermsandConditions(dark: dark),
            const SizedBox(
              height: TSizes.spaceBtwItems,
            ),

            ///SignUp Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => controller.signUp(),
                child: Text(TTexts.createAccount),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            InkWell(
              onTap: () {
                Get.offAll(() => LoginScreen());
              },
              child: SizedBox(
                width: double.infinity,
                child: Text.rich(
                    textAlign: TextAlign.left,
                    TextSpan(style: TextStyle(), children: [
                      TextSpan(
                          text: 'Do you want to login? ',
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall!
                              .copyWith(fontSize: 12)),
                      TextSpan(
                          text: ' Login here',
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall!
                              .copyWith(
                                fontSize: 12.5,
                                fontWeight: FontWeight.w800,
                                color: dark ? TColors.white : TColors.primary,
                                decoration: TextDecoration.underline,
                                decorationColor:
                                    dark ? TColors.white : TColors.primary,
                              )),
                    ])),
              ),
            ),
            const SizedBox(
              height: TSizes.spaceBtwItems / 1.5,
            ),
          ],
        ));
  }
}
