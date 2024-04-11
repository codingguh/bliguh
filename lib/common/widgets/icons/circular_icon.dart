import 'package:ecommerce_firebase_getx/utils/constants/colors.dart';
import 'package:ecommerce_firebase_getx/utils/constants/sizes.dart';
import 'package:ecommerce_firebase_getx/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class CircularIcon extends StatelessWidget {
  const CircularIcon(
      {super.key,
      this.width,
      this.height,
      this.size = TSizes.lg,
      required this.icon,
      this.color,
      this.backgroundColor,
      this.onPressed,
      this.overlayColor});

  final double? width, height, size;
  final IconData icon;
  final Color? color, backgroundColor, overlayColor;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(80),
        color: backgroundColor != null
            ? backgroundColor!
            : THelperFunctions.isDarkMode(context)
                ? TColors.black.withOpacity(0.9)
                : TColors.white.withOpacity(0.9),
      ),
      child: Center(
        child: IconButton(
          onPressed: onPressed,
          icon: Center(
            child: Icon(
              icon,
              color: overlayColor,
              fill: 1,
              weight: 2,
            ),
          ),
          color: color,
          iconSize: size,
        ),
      ),
    );
  }
}
