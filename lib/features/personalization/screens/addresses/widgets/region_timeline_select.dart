import 'package:bliguh/common/widgets/timelines/vertical_timeline.dart';
import 'package:bliguh/features/personalization/controllers/province_controller.dart';
import 'package:bliguh/features/personalization/controllers/region_select_controller.dart';
import 'package:bliguh/utils/constants/sizes.dart';
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

    return Obx(
      () => Padding(
          padding: EdgeInsets.symmetric(
              horizontal: TSizes.defaultSpace, vertical: 0),
          child: Column(
              children: List.generate(listRegion.length, (index) {
            final isActive = selectionController.activeIndex.value == index;

            return AnimatedContainer(
              duration: Duration(seconds: 1), // Adjust duration as needed
              curve: Curves.easeInOut, // Adjust curve as needed
              child: VerticalTimeline(
                index: index,
                isFirst: index == 0,
                isLast: index == listRegion.length - 1,
                isPass: true, // You can set this based on your logic
                text: listRegion[index],
                isSelected: isActive,
                onTap: () {
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
