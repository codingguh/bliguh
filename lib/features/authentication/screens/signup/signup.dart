import 'package:ecommerce_firebase_getx/common/widgets/login_signup/form_divider.dart';
import 'package:ecommerce_firebase_getx/common/widgets/login_signup/social_buttons.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_firebase_getx/features/authentication/screens/signup/widgets/signup_form.dart';
import 'package:ecommerce_firebase_getx/utils/constants/sizes.dart';
import 'package:ecommerce_firebase_getx/utils/constants/text_strings.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                TTexts.signupTitle,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(
                height: TSizes.spaceBtwSections,
              ),

              ///Form
              SignUpForm(),
              const SizedBox(
                height: TSizes.spaceBtwItems,
              ),

              ///Divider
              FormDivider(textDivider: TTexts.orSignUpWith),
              const SizedBox(
                height: TSizes.spaceBtwItems,
              ),

              ///Social Buttons
              SocialButton()
            ],
          ),
        ),
      ),
    );
  }
}
