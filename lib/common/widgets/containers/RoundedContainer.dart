import 'package:bliguh/utils/constants/colors.dart';
import 'package:bliguh/utils/constants/sizes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RoundedContainer extends StatelessWidget {
  const RoundedContainer(
      {super.key,
      this.width,
      this.widthBorder = 1,
      this.height,
      this.radius = TSizes.cardRadiusMd,
      this.child,
      this.borderColor = TColors.primary,
      this.backgroundColor = TColors.white,
      this.showBorder = false,
      this.padding,
      this.margin});

  final double? width, height;
  final double radius, widthBorder;
  final Widget? child;
  final Color borderColor, backgroundColor;
  final bool showBorder;

  final EdgeInsetsGeometry? padding, margin;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: padding,
      margin: margin,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(radius),
        border: showBorder
            ? Border.all(color: borderColor, width: widthBorder)
            : null,
      ),
      child: child,
    );
  }
}
