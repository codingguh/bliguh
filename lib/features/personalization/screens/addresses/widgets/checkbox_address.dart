import 'package:bliguh/utils/constants/colors.dart';
import 'package:flutter/material.dart';

class CheckBoxAddress extends StatelessWidget {
  const CheckBoxAddress({
    super.key,
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              text,
              style: TextStyle(
                  color: Color.fromARGB(255, 105, 105, 105),
                  fontSize: 15.5,
                  fontWeight: FontWeight.w400),
            ),
            Switch(
              value: false,
              onChanged: (value) {},
              activeColor: TColors.primary,
            )
          ],
        ),
        Divider(
          height: 0,
        )
      ],
    );
  }
}
