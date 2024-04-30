import 'package:bliguh/common/styles/spacing_styles.dart';
import 'package:bliguh/utils/constants/sizes.dart';
import 'package:bliguh/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({
    super.key,
    required this.image,
    required this.title,
    required this.subTitle,
    required this.onPressed,
  });

  final String image, title, subTitle;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: TSpacingStyle.paddingWithBarHeight * 2,
          child: Column(
            children: [
              ///Image
              Lottie.asset(image,
                  repeat: false, animate: true, alignment: Alignment.center),
              // Image(
              //   image: AssetImage(image),
              //   width: THelperFunctions.screenWidth() * 0.6,
              // ),
              const SizedBox(
                height: TSizes.spaceBtwSections,
              ),

              ///Title and Subtitle
              Text(
                title,
                style: Theme.of(context).textTheme.headlineMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: TSizes.spaceBtwItems,
              ),
              Text(
                subTitle,
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
                    onPressed: onPressed, child: const Text(TTexts.tContinue)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
