import 'package:bliguh/features/personalization/models/province_model.dart';
import 'package:bliguh/utils/constants/colors.dart';
import 'package:flutter/material.dart';

class ActiveListTileRegion extends StatelessWidget {
  const ActiveListTileRegion({
    super.key,
    required this.city,
  });

  final Regencies city;

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Text(
        city.city,
        style: TextStyle(fontWeight: FontWeight.w600, color: TColors.primary),
      ),
      Icon(
        Icons.check,
        color: TColors.primary,
      )
    ]);
  }
}
