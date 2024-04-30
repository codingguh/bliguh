import 'package:bliguh/utils/constants/colors.dart';
import 'package:flutter/material.dart';

class BadgeLabel extends StatelessWidget {
  const BadgeLabel({
    super.key,
    this.color = TColors.third,
    this.text = 'Free shipping voucher',
  });

  final Color color;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 2, horizontal: 4),
        decoration: BoxDecoration(
            border: Border.all(
          color: TColors.thirdDark,
        )),
        child: SizedBox(
          child: Text(
            text,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(fontSize: 12, color: color),
          ),
        ),
      ),
    );
  }
}
