import 'package:bliguh/common/widgets/buttons/custom_button.dart';
import 'package:bliguh/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class ButtonBottomNavigationbar extends StatelessWidget {
  const ButtonBottomNavigationbar(
      {super.key,
      this.text = 'Submit',
      this.showDescription = false,
      this.containerHeight = 125,
      this.isLeft = true,
      this.color = Colors.white,
      this.buttonHeight = 55,
      this.onTap,
      this.description = const Text('description')});

  final String text;
  final Color color;
  final bool showDescription, isLeft;
  final double containerHeight, buttonHeight;
  final Widget description;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width,
        height: containerHeight,
        color: color,
        child: Padding(
          padding: EdgeInsets.only(
            bottom: TSizes.sm,
            left: TSizes.md,
            top: TSizes.sm,
            right: TSizes.md,
          ),
          child: CustomButton(
            text: text,
            fontSize: 18,
            isLeft: false,
            height: buttonHeight,
            fontWeight: FontWeight.w500,
            showDescription: showDescription,
            description: description,
            onTap: onTap,
          ),
        ));
  }
}
