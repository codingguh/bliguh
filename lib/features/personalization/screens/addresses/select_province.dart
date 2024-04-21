import 'package:ecommerce_firebase_getx/common/widgets/appbar/appbar.dart';
import 'package:ecommerce_firebase_getx/common/widgets/custom_shapes/containers/search_container.dart';
import 'package:ecommerce_firebase_getx/features/personalization/controllers/province_controller.dart';
import 'package:ecommerce_firebase_getx/features/personalization/controllers/region_select_controller.dart';
import 'package:ecommerce_firebase_getx/features/personalization/screens/addresses/widgets/current_location.dart';
import 'package:ecommerce_firebase_getx/features/personalization/screens/addresses/widgets/province_list.dart';
import 'package:ecommerce_firebase_getx/features/personalization/screens/addresses/widgets/regions_widget.dart';
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
          Obx(
            () {
              print("List yang render ${provinceController.renderList.value}");
              if (provinceController.provinces.isEmpty) {
                return Center(child: CircularProgressIndicator());
              } else {
                if (provinceController.renderList.value == 'provinces') {
                  return renderProvinceList(
                      provinceController, regionController);
                } else if (provinceController.renderList.value == 'regencies') {
                  return renderRegencyList(
                      provinceController, regionController);
                } else if (provinceController.renderList.value == 'districts') {
                  return renderDistrictList(
                      provinceController, regionController);
                } else if (provinceController.renderList.value ==
                    'subdistricts') {
                  return renderSubDistrictList(
                      provinceController, regionController);
                } else {
                  return SizedBox(
                    child: Text(provinceController.renderList.value),
                  );
                }
              }
            },
          ),
          // RenderProvinces(),
        ],
      ),
    );
  }
}
