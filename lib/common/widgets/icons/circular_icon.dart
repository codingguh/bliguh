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
      this.padding = 0,
      this.backgroundColor,
      this.onPressed,
      this.overlayColor});

  final double? width, height, size;
  final double padding;
  final IconData icon;
  final Color? color, backgroundColor, overlayColor;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: padding != 0 ? EdgeInsets.all(padding) : EdgeInsets.zero,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(80),
        color: backgroundColor,
      ),
      child: InkWell(
        onTap: onPressed,
        child: Icon(
          icon,
          color: overlayColor,
          // fill: 1.5,
          weight: 9,
          size: size,
        ),
      ),
    );
  }
}
