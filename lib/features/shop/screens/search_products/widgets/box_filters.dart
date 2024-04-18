import 'package:ecommerce_firebase_getx/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class BoxFilter extends StatelessWidget {
  const BoxFilter({
    super.key,
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: TSizes.sm, vertical: TSizes.xs),
      child: Center(
          child: Text(
        text,
        maxLines: 2,
        style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w400,
            overflow: TextOverflow.ellipsis),
      )),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 230, 230, 230),
      ),
    );
  }
}
