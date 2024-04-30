import 'package:bliguh/common/widgets/appbar/appbar.dart';
import 'package:bliguh/common/widgets/buttons/button_bottom_navigationbar.dart';
import 'package:bliguh/common/widgets/coupon/controller/coupon_controller.dart';
import 'package:bliguh/common/widgets/coupon/coupon.dart';
import 'package:bliguh/features/shop/screens/coupon/widgets/coupon_code.dart';
import 'package:bliguh/features/shop/screens/coupon/widgets/title_voucher_desc.dart';
import 'package:bliguh/utils/constants/colors.dart';
import 'package:bliguh/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CouponScreen extends StatelessWidget {
  const CouponScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final GroupCouponController controller = Get.put(GroupCouponController());
    final couponsx = controller.couponsx;
    final couponDisc = controller.couponDisc;

    return Scaffold(
      appBar: TAppBar(
        showBackArrow: true,
        onTap: () {
          Get.back();
        },
        isCenter: true,
        title: Text(
          'Select Bliguh Voucher',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CouponCode(),
              SizedBox(
                height: TSizes.spaceBtwItems * 1.5,
              ),
              TitleVoucherDesc(),
              SizedBox(
                height: TSizes.spaceBtwItems / 2,
              ),
              for (var i = 0; i < couponsx.length; i++)
                Column(
                  children: [
                    Coupon(
                      coupons: couponsx,
                      coupon: couponsx[i],
                      controller: controller,
                    ),
                    if (i < couponsx.length - 1)
                      SizedBox(height: TSizes.spaceBtwItems),
                  ],
                ),
              SizedBox(
                height: TSizes.spaceBtwSections,
              ),
              TitleVoucherDesc(
                title: 'Discount/Cashback',
              ),
              SizedBox(
                height: TSizes.spaceBtwItems / 2,
              ),
              for (var i = 0; i < couponDisc.length; i++)
                Column(
                  children: [
                    Coupon(
                      coupons: couponDisc,
                      coupon: couponDisc[i],
                      controller: controller,
                    ),
                    if (i < couponDisc.length - 1)
                      SizedBox(height: TSizes.spaceBtwItems),
                  ],
                ),
              SizedBox(
                height: TSizes.spaceBtwSections,
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: ButtonBottomNavigationbar(
        showDescription: true,
        containerHeight: 145,
        description: Text.rich(TextSpan(children: [
          TextSpan(
              text: '2 Vouchers Selected.',
              style: TextStyle(color: Colors.black)),
          TextSpan(
              text: ' Shipping promotion applied and RP 2,34RB off',
              style: TextStyle(
                  color: TColors.primary, fontWeight: FontWeight.w800))
        ])),
      ),
    );
  }
}
