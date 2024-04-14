import 'package:ecommerce_firebase_getx/features/personalization/controllers/region_select_controller.dart';
import 'package:ecommerce_firebase_getx/utils/constants/colors.dart';
import 'package:ecommerce_firebase_getx/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:iconsax/iconsax.dart';

class AddressSelectProvince extends StatelessWidget {
  const AddressSelectProvince({super.key, required this.title, this.onTap});
  final String title;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    final SelectionController regionController = Get.put(SelectionController());
    return GestureDetector(
      onTap: onTap,
      child: Container(
        // padding: EdgeInsets.all(TSizes.xs),
        // margin: EdgeInsets.symmetric(vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    title,
                    // softWrap: true,
                    style: TextStyle(
                        color: regionController.listRegion.isEmpty
                            ? TColors.darkGrey
                            : TColors.black,
                        fontSize: TSizes.fontSizeMd,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                IconButton(
                    onPressed: onTap,
                    icon: Icon(
                      Iconsax.arrow_right,
                      color: TColors.darkGrey,
                    ))
              ],
            ),
            Divider()
          ],
        ),
      ),
    );
  }
}
