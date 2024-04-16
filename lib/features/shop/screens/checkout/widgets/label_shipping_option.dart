import 'package:ecommerce_firebase_getx/utils/constants/colors.dart';
import 'package:ecommerce_firebase_getx/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class LabelShippigOption extends StatelessWidget {
  const LabelShippigOption({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          top: BorderSide(color: TColors.third),
          bottom: BorderSide(color: TColors.third),
        ),
      ),
      child: Container(
        color: TColors.third.withOpacity(0.125),
        padding: EdgeInsets.symmetric(horizontal: TSizes.md, vertical: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Shipping Option'),
            SizedBox(
              height: TSizes.spaceBtwItems / 2,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Reguler',
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 15),
                ),
                Row(
                  children: [
                    Icon(
                      Iconsax.ticket,
                      size: 19,
                      color: TColors.thirdDark,
                      weight: 2,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      'Rp.13.000 ',
                      style: TextStyle(
                          decoration: TextDecoration.lineThrough,
                          color: Colors.grey),
                    ),
                    Text('Rp.0'),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: TSizes.spaceBtwItems / 3,
            ),
            Row(
              children: [
                Icon(
                  Iconsax.star5,
                  color: TColors.third,
                  size: 19,
                ),
                Text(
                  ' Guaranteed to get by 17 - 19 Apr',
                  style: TextStyle(
                      color: TColors.thirdDark, fontWeight: FontWeight.w500),
                ),
              ],
            ),
            SizedBox(
              height: 2,
            ),
            Text(
              "Get a Rp.10.00 voucher if your order does'nt arrive by 19 Apr 2019",
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.w200),
            )
          ],
        ),
      ),
    );
  }
}
