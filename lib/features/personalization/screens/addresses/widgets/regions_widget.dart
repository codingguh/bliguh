import 'package:bliguh/features/personalization/controllers/province_controller.dart';
import 'package:bliguh/features/personalization/controllers/region_select_controller.dart';
import 'package:bliguh/features/personalization/screens/addresses/widgets/region_timeline_select.dart';
import 'package:bliguh/utils/constants/colors.dart';
import 'package:bliguh/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegionWidgets extends StatelessWidget {
  const RegionWidgets({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final SelectionController regionController = Get.put(SelectionController());
    final ProvinceController controller = Get.put(ProvinceController());
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(top: TSizes.sm),
          padding: EdgeInsets.symmetric(horizontal: TSizes.defaultSpace),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Region Selected',
                style: TextStyle(fontSize: 11.25, color: Colors.grey),
              ),
              InkWell(
                onTap: () {
                  regionController.clearListRegion();
                  controller.updateRenderList('provinces');
                },
                child: Text(
                  'Reset',
                  style: TextStyle(
                      fontSize: 11.25,
                      color: TColors.primary,
                      fontWeight: FontWeight.bold),
                ),
              )
            ],
          ),
        ),
        SizedBox(
          height: TSizes.spaceBtwItems / 2,
        ),
        RegionTimelineSelect(),
      ],
    );
  }
}
