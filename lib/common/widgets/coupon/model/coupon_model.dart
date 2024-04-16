import 'package:flutter/material.dart';

import 'package:get/get.dart';

class CouponModel {
  final int id;
  final String title;
  final String description;
  final Color color;
  final RxBool isClaimed;
  final RxBool isUsed;

  CouponModel({
    required this.id,
    required this.title,
    required this.description,
    required this.color,
    required this.isClaimed,
    required this.isUsed,
  });
}

// final List<CouponModel> couponsx = [
//   CouponModel(
//     id: 1,
//     color: TColors.primary,
//     title: 'Discount 10%',
//     description: 'Min Spend 20 RB',
//     isClaimed: true,
//     isUsed: false,
//   ),
//   CouponModel(
//     id: 2,
//     color: TColors.primary,
//     title: 'Discount 10%',
//     description: 'Min Spend 20 RB',
//     isClaimed: true,
//     isUsed: false,
//   ),
//   CouponModel(
//     id: 3,
//     color: TColors.primary,
//     title: 'Discount 10%',
//     description: 'Min Spend 20 RB',
//     isClaimed: true,
//     isUsed: false,
//   )
// ];
