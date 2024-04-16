import 'package:ecommerce_firebase_getx/utils/constants/colors.dart';
import 'package:ecommerce_firebase_getx/utils/constants/enums.dart';
import 'package:flutter/material.dart';

class ProductTitleText extends StatelessWidget {
  const ProductTitleText({
    super.key,
    this.color = TColors.black,
    required this.title,
    this.smallSize = false,
    this.isBold = false,
    this.maxLines = 2,
    this.textAlign = TextAlign.left,
    this.brandTextSizes = TextSizes.small,
  });

  final String title;
  final Color? color;
  final bool smallSize, isBold;
  final int maxLines;
  final TextAlign? textAlign;
  final TextSizes brandTextSizes;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: isBold
          ? TextStyle(
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 71, 96, 219),
              fontSize: 14)
          : brandTextSizes == TextSizes.small
              ? Theme.of(context).textTheme.labelMedium!.apply(color: color)
              : brandTextSizes == TextSizes.medium
                  ? Theme.of(context).textTheme.bodyLarge!.apply(color: color)
                  : brandTextSizes == TextSizes.large
                      ? Theme.of(context)
                          .textTheme
                          .titleLarge!
                          .apply(color: color)
                      : Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .apply(color: color),
      overflow: TextOverflow.ellipsis,
      maxLines: maxLines,
      textAlign: textAlign,
    );
  }
}
