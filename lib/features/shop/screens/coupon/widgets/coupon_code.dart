import 'package:ecommerce_firebase_getx/common/widgets/buttons/custom_button.dart';
import 'package:ecommerce_firebase_getx/common/widgets/containers/RoundedContainer.dart';
import 'package:ecommerce_firebase_getx/utils/constants/colors.dart';
import 'package:ecommerce_firebase_getx/utils/constants/sizes.dart';
import 'package:ecommerce_firebase_getx/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class CouponCode extends StatelessWidget {
  const CouponCode({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return RoundedContainer(
      height: 50,
      radius: 9,
      showBorder: true,
      backgroundColor: dark ? TColors.dark : TColors.white,
      padding: EdgeInsets.only(
          top: TSizes.xs, bottom: TSizes.xs, right: TSizes.xs, left: TSizes.sm),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Flexible(
            child: Container(
              // color: Colors.red,
              // margin: EdgeInsets.only(top: 20),
              child: TextFormField(
                // cursorHeight: 30,
                textAlignVertical:
                    TextAlignVertical.center, // Center text vertically
                decoration: InputDecoration(
                  hintText: 'Have Promo coe? Enter here',
                  border: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                ),
              ),
            ),
          ),
          CustomButton(
            fontWeight: FontWeight.w500,
            text: 'Apply',
            height: 40,
            onTap: () {
              print('apply');
            },
          ),
        ],
      ),
    );
  }
}
