import 'package:bliguh/features/personalization/controllers/region_select_controller.dart';
import 'package:bliguh/utils/constants/colors.dart';
import 'package:bliguh/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddressSelectProvince extends StatelessWidget {
  const AddressSelectProvince(
      {super.key, required this.title, this.onTap, this.showBold = false});
  final String title;
  final bool showBold;
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
                        color: showBold ? TColors.black : TColors.darkGrey,
                        fontSize: TSizes.fontSizeMd,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                IconButton(
                    onPressed: onTap,
                    icon: Icon(
                      Icons.chevron_right_rounded,
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
