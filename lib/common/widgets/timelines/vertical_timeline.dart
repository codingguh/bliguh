import 'package:ecommerce_firebase_getx/common/widgets/containers/RoundedContainer.dart';
import 'package:ecommerce_firebase_getx/features/personalization/controllers/region_select_controller.dart';
import 'package:ecommerce_firebase_getx/features/personalization/screens/addresses/widgets/selected_timeline.dart';
import 'package:ecommerce_firebase_getx/utils/constants/colors.dart';
import 'package:ecommerce_firebase_getx/utils/constants/image_strings.dart';
import 'package:ecommerce_firebase_getx/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:timeline_tile/timeline_tile.dart';

class VerticalTimeline extends StatelessWidget {
  final bool isFirst, isLast, isPass, isSelected;
  final String text;
  final int index;
  final Function()? onTap;

  const VerticalTimeline(
      {super.key,
      this.isFirst = false,
      this.isLast = false,
      this.isPass = false,
      this.isSelected = false,
      this.onTap,
      required this.index,
      required this.text});

  @override
  Widget build(BuildContext context) {
    final SelectionController selectionController = Get.find();

    return isSelected
        ? SelectedTimeline(
            text: text,
          )
        : GestureDetector(
            onTap: onTap,
            child: Padding(
                padding: EdgeInsets.symmetric(horizontal: TSizes.sm),
                child: SizedBox(
                    height: 45,
                    child: TimelineTile(
                      isFirst: isFirst,
                      isLast: isLast,
                      beforeLineStyle: LineStyle(
                          color: isPass ? TColors.grey : TColors.primary,
                          thickness: 2.25),
                      indicatorStyle: IndicatorStyle(
                          width: 15,
                          height: 15,
                          color: const Color.fromARGB(255, 216, 216, 216),
                          iconStyle: IconStyle(
                            iconData: Icons.done,
                            color: TColors.white,
                          )),
                      endChild: Container(
                        margin: EdgeInsets.only(left: TSizes.md),
                        child: Text(
                          text,
                          style: TextStyle(
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ))));
  }
}
