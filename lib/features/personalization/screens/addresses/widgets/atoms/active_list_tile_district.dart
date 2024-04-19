import 'package:ecommerce_firebase_getx/features/personalization/models/province_model.dart';
import 'package:ecommerce_firebase_getx/utils/constants/colors.dart';
import 'package:flutter/material.dart';

class ActiveListTileDistrict extends StatelessWidget {
  const ActiveListTileDistrict({
    super.key,
    required this.district,
  });

  final Districts district;

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Text(
        district.name,
        style: TextStyle(fontWeight: FontWeight.w600, color: TColors.primary),
      ),
      Icon(
        Icons.check,
        color: TColors.primary,
      )
    ]);
  }
}
