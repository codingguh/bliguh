import 'package:flutter/material.dart';

class PriceTextDiscount extends StatelessWidget {
  const PriceTextDiscount({
    super.key,
    required this.formattedPrice,
  });

  final String formattedPrice;

  @override
  Widget build(BuildContext context) {
    return Text(
      '$formattedPrice',
      overflow: TextOverflow.ellipsis,
      maxLines: 1,
      style: Theme.of(context).textTheme.labelSmall!.copyWith(
          fontWeight: FontWeight.bold,
          decoration: TextDecoration.lineThrough,
          color: Colors.grey),
    );
  }
}
