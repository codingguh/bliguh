import 'package:ecommerce_firebase_getx/common/widgets/containers/RoundedContainer.dart';
import 'package:ecommerce_firebase_getx/common/widgets/coupon/controller/coupon_controller.dart';
import 'package:ecommerce_firebase_getx/common/widgets/coupon/model/coupon_model.dart';
import 'package:ecommerce_firebase_getx/utils/constants/colors.dart';
import 'package:ecommerce_firebase_getx/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ContentCoupon extends StatelessWidget {
  const ContentCoupon({
    Key? key,
    required this.coupons,
    required this.coupon,
    required this.couponController,
  }) : super(key: key);
  final List<CouponModel> coupons;
  final CouponModel coupon;
  final GroupCouponController couponController;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: 0,
      bottom: 0,
      child: Obx(
        () => Container(
          width: (MediaQuery.of(context).size.width - TSizes.defaultSpace * 2) -
              110,
          height: 110,
          decoration: BoxDecoration(
            color: TColors.white,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(6),
              bottomRight: Radius.circular(6),
            ),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 9),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        coupon.title,
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                      Flexible(
                        child: Text(
                          coupon.description,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(fontSize: 12),
                          maxLines: 2,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 12,
                ),
                if (coupon.isUsed.value) // Accessing the value property
                  RoundedContainer(
                    margin: EdgeInsets.only(right: 5),
                    padding: EdgeInsets.all(1),
                    width: 22,
                    height: 22,
                    backgroundColor: coupon.color,
                    child: Icon(
                      Icons.check,
                      color: Colors.white,
                      size: 16,
                    ),
                  ),
                if (!coupon.isUsed.value &&
                    coupon.isClaimed.value) // Accessing the value property
                  GestureDetector(
                    onTap: () {
                      print('Success claimed ${coupon.id}');
                      print('Success claimed ${coupon.isClaimed}');
                      print('Success claimed ${coupon.isUsed}');
                      couponController.claimCoupon(coupons, coupon);
                    },
                    child: RoundedContainer(
                      margin: EdgeInsets.only(right: 5),
                      borderColor: TColors.black,
                      width: 20,
                      height: 20,
                      showBorder: true,
                    ),
                  ),
                if (!coupon.isUsed.value &&
                    !coupon.isClaimed.value) // Accessing the value property
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 9, vertical: 6),
                    decoration: BoxDecoration(
                      color: coupon.color,
                      borderRadius: BorderRadius.all(
                        Radius.circular(4),
                      ),
                    ),
                    child: Text(
                      'Claim',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
