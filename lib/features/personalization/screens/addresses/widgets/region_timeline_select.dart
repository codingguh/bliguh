import 'package:ecommerce_firebase_getx/common/widgets/timelines/vertical_timeline.dart';
import 'package:ecommerce_firebase_getx/features/personalization/controllers/province_controller.dart';
import 'package:ecommerce_firebase_getx/features/personalization/controllers/region_select_controller.dart';
import 'package:ecommerce_firebase_getx/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegionTimelineSelect extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final SelectionController selectionController =
        Get.put(SelectionController());
    final ProvinceController regionController = Get.put(ProvinceController());

    final listRegion = selectionController.listRegion;
    selectionController.initSelectionList(listRegion.length);

    return Padding(
        padding:
            EdgeInsets.symmetric(horizontal: TSizes.defaultSpace, vertical: 0),
        child: Column(
            children: List.generate(listRegion.length, (index) {
          return Obx(() {
            final isActive =
                (selectionController.isLastIndexActiveInitially.value) ||
                    selectionController.activeIndex.value == index;

            return AnimatedContainer(
              duration: Duration(seconds: 1), // Adjust duration as needed
              curve: Curves.easeInOut, // Adjust curve as needed
              child: GestureDetector(
                onTap: () {
                  if (selectionController.activeIndex == 1) {
                    regionController.updateRenderList('provinces');
                    selectionController.setActiveIndex(index);
                  } else if (selectionController.activeIndex == 0) {
                    regionController.updateRenderList('cities');
                    selectionController.setActiveIndex(index);
                    // Get.back();
                    // print('sdssfsdffdsdf');
                  } else if (selectionController.activeIndex == 2) {
                    Get.back();
                  } else {
                    Get.back();
                    print('sdssfsdffdsdf');
                  }

                  selectionController.isLastIndexActiveInitially.value = false;
                },
                child: VerticalTimeline(
                  index: index,
                  isFirst: index == 0,
                  isLast: index == listRegion.length - 1,
                  isPass: true, // You can set this based on your logic
                  text: listRegion[index],
                  isSelected: isActive,
                ),
              ),
            );
          });
        })));
  }
}
