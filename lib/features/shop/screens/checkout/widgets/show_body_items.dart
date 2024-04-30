import 'package:bliguh/utils/constants/colors.dart';
import 'package:bliguh/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class ShowBodyItem extends StatelessWidget {
  const ShowBodyItem({
    super.key,
    required this.title,
    required this.price,
    this.isTotal = false,
  });

  final String title, price;
  final bool isTotal;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: TextStyle(fontSize: isTotal ? 16 : 12),
            ),
            Text(
              price,
              style: TextStyle(
                  fontSize: isTotal ? 16 : 12,
                  color: isTotal ? TColors.primary : Colors.black,
                  fontWeight: isTotal ? FontWeight.w800 : FontWeight.normal),
            ),
          ],
        ),
        SizedBox(
          height: TSizes.xs,
        )
      ],
    );
  }
}
