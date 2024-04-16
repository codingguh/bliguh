import 'package:ecommerce_firebase_getx/common/widgets/containers/RoundedContainer.dart';
import 'package:ecommerce_firebase_getx/common/widgets/coupon/controller/coupon_controller.dart';
import 'package:ecommerce_firebase_getx/common/widgets/coupon/coupon_painter.dart';
import 'package:ecommerce_firebase_getx/common/widgets/coupon/model/coupon_model.dart';
import 'package:ecommerce_firebase_getx/common/widgets/coupon/widgets/content_coupon.dart';
import 'package:ecommerce_firebase_getx/common/widgets/coupon/widgets/image_coupon.dart';
import 'package:ecommerce_firebase_getx/utils/constants/colors.dart';
import 'package:ecommerce_firebase_getx/utils/constants/image_strings.dart';
import 'package:ecommerce_firebase_getx/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Coupon extends StatelessWidget {
  const Coupon({
    super.key,
    required this.coupons,
    required this.coupon,
    required this.controller,
  });

  final List<CouponModel> coupons;
  final CouponModel coupon;
  final GroupCouponController controller;

  @override
  Widget build(BuildContext context) {
    // final CouponController _controller = Get.put(CouponController());
    return Container(
      height: 110,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(5)),
          color: Colors.white),
      child: Stack(
        children: [
          CustomPaint(
            painter: CouponPainter(
              bgColor: coupon.color,
            ),
            child: Container(),
          ),
          ImageCoupon(),
          ContentCoupon(
            coupons: coupons,
            coupon: coupon,
            couponController: controller,
          ),
        ],
      ),
    );
  }
}
