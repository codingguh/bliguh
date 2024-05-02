import 'package:bliguh/common/widgets/appbar/appbar.dart';
import 'package:bliguh/common/widgets/custom_shapes/containers/search_container.dart';
import 'package:bliguh/features/personalization/controllers/province_controller.dart';
import 'package:bliguh/features/personalization/controllers/region_select_controller.dart';
import 'package:bliguh/features/personalization/screens/addresses/add_new_address.dart';
import 'package:bliguh/features/personalization/screens/addresses/widgets/current_location.dart';
import 'package:bliguh/features/personalization/screens/addresses/widgets/province_list.dart';
import 'package:bliguh/features/personalization/screens/addresses/widgets/regions_widget.dart';
import 'package:bliguh/utils/constants/colors.dart';
import 'package:bliguh/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class SelectProvinceScreen extends StatefulWidget {
  const SelectProvinceScreen({super.key});

  @override
  State<SelectProvinceScreen> createState() => _SelectProvinceScreenState();
}

class _SelectProvinceScreenState extends State<SelectProvinceScreen>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    final ProvinceController provinceController = Get.put(ProvinceController());
    final SelectionController regionController = Get.put(SelectionController());
    late AnimationController _animationController;

    @override
    void initState() {
      super.initState();
      _animationController = AnimationController(
        vsync: this, // Pass the TickerProvider here
        duration: Duration(milliseconds: 500),
      );
    }

    @override
    void dispose() {
      _animationController.dispose();
      super.dispose();
    }

    return Scaffold(
      appBar: TAppBar(
        showBackArrow: true,
        onTap: () {
          Get.to(() => AddNewAddresses());
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
              return Column(
                children: [
                  CurrentLocationAddresses(),
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.only(
                        left: TSizes.md, bottom: TSizes.md, top: TSizes.md),
                    color: TColors.primary.withOpacity(0.6),
                    child: Obx(
                      () => Text(
                        provinceController.renderList.value,
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              );
            } else {
              return Column(
                children: [
                  RegionWidgets(),
                  Container(
                    width: double.infinity,
                    margin: EdgeInsets.only(top: 10),
                    padding: EdgeInsets.only(
                        left: TSizes.md, bottom: TSizes.md, top: TSizes.md),
                    color: TColors.primary.withOpacity(0.6),
                    child: Obx(
                      () => Text(
                        provinceController.renderList.value,
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              );
            }
          }),
          SizedBox(
            height: TSizes.spaceBtwItems,
          ),
          Obx(
            () {
              if (provinceController.provinces.isEmpty ||
                  provinceController.isLoading.value) {
                return Center(
                  child: LoadingAnimationWidget.prograssiveDots(
                      color: TColors.primary, size: 60),
                );
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
