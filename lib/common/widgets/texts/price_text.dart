import 'package:flutter/material.dart';

class PriceText extends StatelessWidget {
  const PriceText({super.key, required this.formattedPrice, this.style});

  final String formattedPrice;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    return Text(
      '$formattedPrice',
      overflow: TextOverflow.ellipsis,
      maxLines: 1,
      style: style ??
          Theme.of(context)
              .textTheme
              .labelLarge!
              .copyWith(fontWeight: FontWeight.bold),
    );
  }
}
