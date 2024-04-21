import 'package:ecommerce_firebase_getx/common/widgets/buttons/custom_button.dart';
import 'package:ecommerce_firebase_getx/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class ButtonBottomNavigationbar extends StatelessWidget {
  const ButtonBottomNavigationbar(
      {super.key,
      this.showDescription = false,
      this.containerHeight = 125,
      this.buttonHeight = 55,
      this.isLeft = true,
      this.onTap,
      this.text = 'Submit',
      this.description = const Text('description')});

  final String text;
  final bool showDescription, isLeft;
  final double containerHeight, buttonHeight;
  final Widget description;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width,
        height: containerHeight,
        color: Colors.white,
        child: Padding(
          padding: EdgeInsets.only(
            bottom: TSizes.sm,
            left: TSizes.md,
            top: TSizes.sm,
            right: TSizes.md,
          ),
          child: CustomButton(
            height: buttonHeight,
            fontSize: 18,
            isLeft: false,
            text: text,
            fontWeight: FontWeight.w500,
            showDescription: showDescription,
            description: description,
            onTap: onTap,
          ),
        ));
  }
}
