import 'package:ecommerce_firebase_getx/features/shop/screens/checkout/checkout_screen.dart';
import 'package:ecommerce_firebase_getx/utils/constants/colors.dart';
import 'package:ecommerce_firebase_getx/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ButtonCheckout extends StatelessWidget {
  const ButtonCheckout(
      {super.key,
      this.showcheckAll = false,
      this.textButton = 'Checkout',
      this.description = 'Total',
      this.totalPrice = 'Rp.930.000',
      this.totalItems = '5',
      this.showTotalItems = false,
      this.onTap,
      this.onCheckedAll});

  final bool showcheckAll, showTotalItems;
  final String textButton, description, totalPrice, totalItems;
  final Function()? onTap;
  final Function(bool?)? onCheckedAll;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.only(
          left: TSizes.defaultSpace, bottom: TSizes.defaultSpace * 1.5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          if (showcheckAll)
            Expanded(
              child: Row(
                children: [
                  SizedBox(
                      width: 20,
                      height: 20,
                      child: Checkbox(value: false, onChanged: onCheckedAll)),
                  Text(' All'),
                ],
              ),
            ),
          if (!showcheckAll)
            Expanded(
              child: SizedBox(
                width: 20,
                height: 20,
              ),
            ),
          SizedBox(
            height: 50,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '$description ',
                  style: TextStyle(fontSize: 12),
                ),
                SizedBox(
                  height: 3,
                ),
                Text(
                  '$totalPrice',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: TColors.primary),
                ),
              ],
            ),
          ),
          SizedBox(
            width: 12,
          ),
          InkWell(
            onTap: onTap,
            child: Container(
              width: 138,
              height: 60,
              color: TColors.primary,
              padding: EdgeInsets.symmetric(horizontal: TSizes.md),
              child: Center(
                  child: Text(
                showTotalItems ? "$textButton ($totalItems)" : "$textButton",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 15,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              )),
            ),
          ),
        ],
      ),
    );
  }
}
