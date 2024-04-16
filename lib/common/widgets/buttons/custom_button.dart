import 'package:ecommerce_firebase_getx/utils/constants/colors.dart';
import 'package:ecommerce_firebase_getx/utils/constants/sizes.dart';
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
      this.onTap});

  final String text;
  final double fontSize, height;
  final bool showDescription;
  final Widget description;
  final FontWeight fontWeight;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
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
            padding: EdgeInsets.only(
                top: TSizes.sm,
                bottom: TSizes.sm,
                right: TSizes.md,
                left: TSizes.md),
            decoration: BoxDecoration(
              color: TColors.primary,
              borderRadius: BorderRadius.all(Radius.circular(9)),
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
