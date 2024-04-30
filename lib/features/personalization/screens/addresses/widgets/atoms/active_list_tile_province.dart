import 'package:bliguh/features/personalization/models/province_model.dart';
import 'package:bliguh/utils/constants/colors.dart';
import 'package:flutter/material.dart';

class ActiveListTileProvince extends StatelessWidget {
  const ActiveListTileProvince({
    super.key,
    required this.province,
  });

  final Province province;

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Text(
        province.province,
        style: TextStyle(fontWeight: FontWeight.w600, color: TColors.primary),
      ),
      Icon(
        Icons.check,
        color: TColors.primary,
      )
    ]);
  }
}
