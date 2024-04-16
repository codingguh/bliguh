import 'package:ecommerce_firebase_getx/common/widgets/appbar/appbar.dart';
import 'package:ecommerce_firebase_getx/common/widgets/products/cart/button_checkout_all_list.dart';
import 'package:ecommerce_firebase_getx/common/widgets/success_screen/success_screen.dart';
import 'package:ecommerce_firebase_getx/features/shop/screens/cart/widgets/cart_items.dart';
import 'package:ecommerce_firebase_getx/features/shop/screens/checkout/widgets/label_shipping_option.dart';
import 'package:ecommerce_firebase_getx/features/shop/screens/checkout/widgets/label_shop_voucher.dart';
import 'package:ecommerce_firebase_getx/features/shop/screens/coupon/coupon_screen.dart';
import 'package:ecommerce_firebase_getx/features/shop/screens/coupon/widgets/coupon_badge_label.dart';
import 'package:ecommerce_firebase_getx/features/shop/screens/payment/payment_screen.dart';
import 'package:ecommerce_firebase_getx/navigation_menu.dart';
import 'package:ecommerce_firebase_getx/utils/constants/colors.dart';
import 'package:ecommerce_firebase_getx/utils/constants/image_strings.dart';
import 'package:ecommerce_firebase_getx/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 242, 242, 242),
        appBar: TAppBar(
          showBackArrow: true,
          showBackground: true,
          bgColor: Colors.white,
          onTap: () {
            Get.back();
          },
          isCenter: true,
          title: Text(
            'Checkout',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              CartItems(
                showAddRemoveButtons: false,
                total: 3,
              ),
              SizedBox(
                height: TSizes.spaceBtwItems / 1.5,
              ),
              LabeShopVoucher(
                title: 'Shop Vouchers',
                onTap: () {
                  Get.to(() => const CouponScreen());
                },
                iconTitle: Icon(
                  Iconsax.ticket,
                  size: 19,
                  color: TColors.thirdDark,
                ),
                showRightContent: true,
                rightContentWidget: Row(
                  children: [
                    BadgeLabel(
                      color: TColors.primary,
                      text: '-Rp2,34 RB',
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    BadgeLabel(),
                  ],
                ),
              ),
              LabelShippigOption(),
              SizedBox(
                height: TSizes.spaceBtwItems / 1.5,
              ),
              LabeShopVoucher(
                title: 'Payment Option',
                onTap: () {
                  Get.to(() => PaymentScreen());
                },
                iconTitle: Icon(
                  Iconsax.wallet_search,
                  size: 21,
                  color: TColors.primary,
                ),
                showRightContent: true,
                widthRightContent: 140,
                rightContentWidget: Container(
                  // width: 125,
                  child: Row(
                    children: [
                      Flexible(
                        child: Text(
                          'Bank Transfer - Bank Mandiri',
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: TextStyle(fontSize: 12),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: TSizes.spaceBtwItems / 1.5,
              ),
              LabeShopVoucher(
                title: 'Payment Details',
                onTap: () {},
                iconTitle: Icon(
                  Iconsax.receipt,
                  size: 21,
                  color: TColors.primary,
                ),
                showBody: true,
              ),
              SizedBox(
                height: TSizes.spaceBtwItems,
              ),
            ],
          ),
        ),
        bottomNavigationBar: ButtonCheckout(
          textButton: 'Place Order',
          onTap: () => Get.to(() => SuccessScreen(
              image: TImages.successfulPaymentIcon,
              title: 'Payment Success',
              subTitle: 'Your Order will be shipped soon!',
              onPressed: () {
                Get.offAll(() => const NavigationMenu());
              })),
        ));
  }
}
