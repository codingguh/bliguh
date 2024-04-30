import 'package:bliguh/features/personalization/models/province_model.dart';
import 'package:bliguh/utils/constants/colors.dart';
import 'package:flutter/material.dart';

class ActiveListTileSubDistrict extends StatelessWidget {
  const ActiveListTileSubDistrict({
    super.key,
    required this.subdistrict,
  });

  final SubDistricts subdistrict;

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Text(
        subdistrict.name,
        style: TextStyle(fontWeight: FontWeight.w600, color: TColors.primary),
      ),
      Icon(
        Icons.check,
        color: TColors.primary,
      )
    ]);
  }
}
