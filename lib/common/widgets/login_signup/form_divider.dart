import 'package:ecommerce_firebase_getx/utils/constants/colors.dart';
import 'package:flutter/material.dart';

class FormDivider extends StatelessWidget {
  final String textDivider;
  final double firstIndent, firstEndIndent, secondIndent, secondEndIndent;
  final bool customTextStyle;
  final TextStyle textStyle;
  final Color colorDivider;

  const FormDivider({
    super.key,
    required this.textDivider,
    this.firstIndent = 60,
    this.firstEndIndent = 5,
    this.secondIndent = 5,
    this.customTextStyle = false,
    this.secondEndIndent = 60,
    this.colorDivider = TColors.grey,
    this.textStyle = const TextStyle(),
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Flexible(
          child: Divider(
            color: colorDivider,
            thickness: 0.7,
            indent: firstEndIndent,
            endIndent: firstEndIndent,
          ),
        ),
        Text(
          textDivider,
          style: customTextStyle
              ? textStyle
              : Theme.of(context).textTheme.labelMedium,
        ),
        Flexible(
          child: Divider(
            color: colorDivider,
            thickness: 0.7,
            indent: secondIndent,
            endIndent: secondEndIndent,
          ),
        )
      ],
    );
  }
}
