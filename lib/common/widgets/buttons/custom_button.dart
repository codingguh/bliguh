import 'package:bliguh/utils/constants/colors.dart';
import 'package:bliguh/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key,
      this.text = 'Submit',
      this.fontSize = 14,
      this.height = 55,
      this.showDescription = false,
      this.description = const Text('Your description is here'),
      this.fontWeight = FontWeight.normal,
      this.isLeft = true,
      this.radius = const BorderRadius.all(Radius.circular(9)),
      this.padding = const EdgeInsets.only(
          top: TSizes.sm, bottom: TSizes.sm, right: TSizes.md, left: TSizes.md),
      this.onTap});

  final String text;
  final double fontSize, height;
  final bool showDescription, isLeft;
  final Widget description;
  final FontWeight fontWeight;
  final EdgeInsetsGeometry padding;
  final BorderRadius radius;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        crossAxisAlignment:
            isLeft ? CrossAxisAlignment.start : CrossAxisAlignment.end,
        children: [
          if (showDescription)
            Column(
              children: [
                description,
                SizedBox(
                  height: 6,
                )
              ],
            ),
          Container(
            height: height,
            padding: padding,
            decoration: BoxDecoration(
              color: TColors.primary,
              borderRadius: radius,
            ),
            child: Center(
              child: Text(
                text,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: fontSize,
                    fontWeight: fontWeight),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
