import 'package:ecommerce_firebase_getx/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

class TReadMoreText extends StatelessWidget {
  const TReadMoreText({
    super.key,
    required this.text,
  });
  final String text;

  @override
  Widget build(BuildContext context) {
    return ReadMoreText(
      text,
      trimLines: 2,
      trimMode: TrimMode.Line,
      trimExpandedText: ' ',
      trimCollapsedText: ' show more',
      style: TextStyle(fontSize: 12),
      textAlign: TextAlign.justify,
      moreStyle: TextStyle(
          fontSize: 12, fontWeight: FontWeight.bold, color: TColors.primary),
      lessStyle: TextStyle(
          fontSize: 14, fontWeight: FontWeight.bold, color: TColors.primary),
    );
  }
}
