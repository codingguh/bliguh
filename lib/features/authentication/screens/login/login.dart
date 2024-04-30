import 'package:bliguh/common/styles/spacing_styles.dart';
import 'package:bliguh/common/widgets/login_signup/form_divider.dart';
import 'package:bliguh/common/widgets/login_signup/social_buttons.dart';
import 'package:bliguh/features/authentication/screens/login/widgets/login_form.dart';
import 'package:bliguh/features/authentication/screens/login/widgets/login_header.dart';
import 'package:bliguh/utils/constants/sizes.dart';
import 'package:bliguh/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Padding(
        padding: TSpacingStyle.paddingWithBarHeight,
        child: Column(
          children: [
            /// Logo
            LoginHeader(),

            ///FORM
            LoginForm(),

            ///Divder
            FormDivider(
              textDivider: TTexts.orSignInWith.capitalize!,
            ),
            const SizedBox(height: TSizes.spaceBtwSections / 2),

            ///Footer
            SocialButton()
          ],
        ),
      ),
    ));
  }
}
