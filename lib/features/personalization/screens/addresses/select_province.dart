import 'package:ecommerce_firebase_getx/common/widgets/appbar/appbar.dart';
import 'package:ecommerce_firebase_getx/common/widgets/containers/RoundedContainer.dart';
import 'package:ecommerce_firebase_getx/common/widgets/custom_shapes/containers/search_container.dart';
import 'package:ecommerce_firebase_getx/common/widgets/timelines/vertical_timeline.dart';
import 'package:ecommerce_firebase_getx/features/personalization/controllers/province_controller.dart';
import 'package:ecommerce_firebase_getx/features/personalization/controllers/region_select_controller.dart';
import 'package:ecommerce_firebase_getx/features/personalization/screens/addresses/add_new_address.dart';
import 'package:ecommerce_firebase_getx/features/personalization/screens/addresses/widgets/current_location.dart';
import 'package:ecommerce_firebase_getx/features/personalization/screens/addresses/widgets/listtile_render_regions.dart';
import 'package:ecommerce_firebase_getx/features/personalization/screens/addresses/widgets/region_timeline_select.dart';
import 'package:ecommerce_firebase_getx/features/personalization/screens/addresses/widgets/regions_widget.dart';
import 'package:ecommerce_firebase_getx/utils/constants/colors.dart';
import 'package:ecommerce_firebase_getx/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SelectProvinceScreen extends StatelessWidget {
  const SelectProvinceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ProvinceController provinceController = Get.put(ProvinceController());
    final SelectionController regionController = Get.put(SelectionController());

    return Scaffold(
      appBar: TAppBar(
        showBackArrow: true,
        onTap: () {
          Get.offAll(() => AddNewAddresses(),
              transition: Transition.upToDown,
              duration: Duration(milliseconds: 400),
              curve: Curves.ease
              // curve: Curves.easeInOut
              );
        },
        title: SearchContainer(
          text: 'Search City ',
          fullWidth: true,
        ),
      ),
      body: Column(
        children: [
          Obx(() {
            if (regionController.listRegion.isEmpty) {
              return CurrentLocationAddresses();
            } else {
              return RegionWidgets();
            }
          }),
          SizedBox(
            height: TSizes.spaceBtwItems,
          ),
          ListRenderRegions(
              provinceController: provinceController,
              regionController: regionController),
          // RenderProvinces(),
        ],
      ),
    );
  }
}
