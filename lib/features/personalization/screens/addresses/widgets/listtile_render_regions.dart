import 'package:ecommerce_firebase_getx/features/personalization/controllers/province_controller.dart';
import 'package:ecommerce_firebase_getx/features/personalization/controllers/region_select_controller.dart';
import 'package:ecommerce_firebase_getx/features/personalization/screens/addresses/add_new_address.dart';
import 'package:ecommerce_firebase_getx/features/personalization/screens/addresses/widgets/province_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/routes/default_transitions.dart';

class ListRenderRegions extends StatelessWidget {
  const ListRenderRegions({
    super.key,
    required this.provinceController,
    required this.regionController,
    // required this.renderList,
  });

  final ProvinceController provinceController;
  final SelectionController regionController;
  // final RxString renderList; // Change to RxString

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (provinceController.provinces.isEmpty) {
        return Center(child: CircularProgressIndicator());
      } else {
        if (provinceController.renderList.value == 'provinces') {
          return renderProvinceList(provinceController, regionController);
        } else if (provinceController.renderList.value == 'regencis') {
          return renderRegencyList(provinceController, regionController);
        } else {
          return SizedBox(
            child: InkWell(
                onTap: () {
                  Get.to(() => AddNewAddresses());
                },
                child: Text('Kecamatan')),
          );
        }
      }
    });
  }
}
