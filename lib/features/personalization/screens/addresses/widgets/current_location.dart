import 'package:bliguh/features/openstreetmap/controllers/current_location_controller.dart';
import 'package:bliguh/features/personalization/controllers/province_controller.dart';
import 'package:bliguh/features/personalization/controllers/region_select_controller.dart';
import 'package:bliguh/features/personalization/screens/addresses/widgets/regions_widget.dart';
import 'package:bliguh/utils/constants/colors.dart';
import 'package:bliguh/utils/constants/sizes.dart';
import 'package:bliguh/utils/helpers/loader/fullscreen_loader.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class CurrentLocationAddresses extends StatelessWidget {
  const CurrentLocationAddresses({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final CurrentLocationController controller =
        Get.put(CurrentLocationController());
    final ProvinceController provinceController = Get.put(ProvinceController());

    return Obx(
      () => provinceController.isLoading.value
          ? SizedBox()
          : Column(
              children: [
                Container(
                    color: TColors.primary.withOpacity(0.6),
                    padding: EdgeInsets.only(
                        top: TSizes.md, right: TSizes.md, left: TSizes.md),
                    // height: 120,
                    child: InkWell(
                      onTap: () async {
                        await controller.getCoordinates();

                        provinceController.isLoading.value = false;
                      },
                      child: Container(
                        height: 46,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(6)),
                        child: Center(
                            child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.location_on,
                              size: 25,
                              color: TColors.primary,
                            ),
                            SizedBox(
                              width: 6,
                            ),
                            const Text('Use My Current Location'),
                          ],
                        )),
                      ),
                    )),
              ],
            ),
    );
  }
}
