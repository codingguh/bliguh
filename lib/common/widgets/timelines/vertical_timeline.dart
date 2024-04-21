import 'package:ecommerce_firebase_getx/features/personalization/screens/addresses/widgets/selected_timeline.dart';
import 'package:ecommerce_firebase_getx/utils/constants/colors.dart';
import 'package:ecommerce_firebase_getx/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:timeline_tile/timeline_tile.dart';

class VerticalTimeline extends StatelessWidget {
  // RxBool isSelected = false.obs;
  final bool isFirst, isLast, isPass, isSelected;
  final String text;
  final int index;
  final Function()? onTap;

  VerticalTimeline(
      {super.key,
      this.isFirst = false,
      this.isLast = false,
      this.isPass = false,
      required this.isSelected,
      this.onTap,
      required this.index,
      required this.text});

  @override
  Widget build(BuildContext context) {
    return isSelected
        ? SelectedTimeline(
            text: text,
            onTap: onTap,
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
                          '$text',
                          style: TextStyle(
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ))));
  }
}
