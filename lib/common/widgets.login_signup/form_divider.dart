import 'package:ecommerce_firebase_getx/utils/constants/colors.dart';
import 'package:flutter/material.dart';

class FormDivider extends StatelessWidget {
  final String textDivider;
  const FormDivider({super.key, required this.textDivider});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Flexible(
          child: Divider(
            color: TColors.grey,
            thickness: 0.7,
            indent: 60,
            endIndent: 5,
          ),
        ),
        Text(
          textDivider,
          style: Theme.of(context).textTheme.labelMedium,
        ),
        Flexible(
          child: Divider(
            color: TColors.grey,
            thickness: 0.7,
            indent: 5,
            endIndent: 60,
          ),
        )
      ],
    );
  }
}
