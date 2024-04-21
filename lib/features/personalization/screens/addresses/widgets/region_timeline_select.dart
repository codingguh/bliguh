import 'dart:math';

import 'package:ecommerce_firebase_getx/common/widgets/timelines/vertical_timeline.dart';
import 'package:ecommerce_firebase_getx/features/personalization/controllers/province_controller.dart';
import 'package:ecommerce_firebase_getx/features/personalization/controllers/region_select_controller.dart';
import 'package:ecommerce_firebase_getx/features/personalization/screens/addresses/add_new_address.dart';
import 'package:ecommerce_firebase_getx/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegionTimelineSelect extends StatefulWidget {
  @override
  State<RegionTimelineSelect> createState() => _RegionTimelineSelectState();
}

class _RegionTimelineSelectState extends State<RegionTimelineSelect> {
  @override
  Widget build(BuildContext context) {
    final SelectionController selectionController =
        Get.put(SelectionController());
    final ProvinceController regionController = Get.put(ProvinceController());

    final listRegion = selectionController.listRegion;
    selectionController.initSelectionList(listRegion.length);
    double _width = double.infinity;
    double _height = 50;

    return Obx(
      () => Padding(
          padding: EdgeInsets.symmetric(
              horizontal: TSizes.defaultSpace, vertical: 0),
          child: Column(
              children: List.generate(listRegion.length, (index) {
            final isActive = selectionController.activeIndex.value == index;

            return AnimatedContainer(
              width: _width,
              height: _height,
              duration:
                  Duration(microseconds: 300), // Adjust duration as needed
              curve: Curves.easeInOut, // Adjust curve as needed
              child: VerticalTimeline(
                index: index,

                isFirst: index == 0,
                isLast: index == listRegion.length - 1,
                isPass: true, // You can set this based on your logic
                text: listRegion[index],
                isSelected: isActive,
                onTap: () {
                  setState(() {
                    _width = _width == double.infinity ? 200 : double.infinity;
                    _height = _height == 100 ? 200 : 100;
                  });
                  selectionController.setActiveIndex(index);
                  if (selectionController.activeIndex == 0) {
                    regionController.updateRenderList('provinces');
                  } else if (selectionController.activeIndex == 1) {
                    regionController.updateRenderList('regencies');
                  } else if (index == 2) {
                    regionController.updateRenderList('districts');
                  } else {
                    print(
                        "coba ${selectionController.activeIndex} ${regionController.renderList}");
                  }
                },
              ),
            );
          }))),
    );
  }
}
