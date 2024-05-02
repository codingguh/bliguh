import 'package:bliguh/common/widgets/appbar/appbar.dart';
import 'package:bliguh/features/openstreetmap/controllers/openmap_controller.dart';
import 'package:bliguh/utils/constants/colors.dart';
import 'package:bliguh/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';
import 'package:flutter_map_dragmarker/flutter_map_dragmarker.dart';

class OpenStreetMapAddress extends StatelessWidget {
  const OpenStreetMapAddress({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OpenMapController());
    return Scaffold(
        appBar: TAppBar(
          showBackArrow: true,
          title: Text('Pin Point Address'),
          bgColor: Colors.transparent,
          isCenter: true,
          onTap: () {
            Get.back();
          },
        ),
        body: Scaffold(
            body: Stack(children: [
          FlutterMap(
            options: MapOptions(
              initialZoom: 18,
              initialCenter: controller.markerPosition.value,
              maxZoom: 18.2,
              minZoom: 17.7,
              onPointerUp: ((position, hasGesture) {
                controller.showTooltip.value = true;
                controller.sizeMarker.value = 66;
              }),
              onPointerDown: (event, position) {
                controller.showTooltip.value = false;
                controller.sizeMarker.value = 45;
              },
              interactionOptions: InteractionOptions(),
            ),
            children: [
              TileLayer(
                urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                userAgentPackageName: 'com.example.app',
              ),
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Obx(
                      () => controller.showTooltip.value
                          ? Container(
                              width: MediaQuery.of(context).size.width * 0.6,
                              height: 45,
                              margin: EdgeInsets.only(bottom: 24),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(12)),
                              child: Center(
                                  child: Text('Your address is here',
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleMedium!
                                          .copyWith(
                                              color: TColors.primary,
                                              fontWeight: FontWeight.w700,
                                              fontSize: 13))),
                            )
                          : SizedBox(),
                    ),
                    Obx(
                      () => Container(
                        width: controller.sizeMarker.value,
                        height: controller.sizeMarker.value,
                        child: Icon(
                          Icons.location_on,
                          color: TColors.primary,
                          size: controller.sizeMarker.value,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.width * 0.33,
                    ),
                    Container(
                      width: double.infinity,
                      height: MediaQuery.of(context).size.width * 0.45,
                      color: Colors.white,
                    )
                  ],
                ),
              ),
            ],
          ),
        ])));
  }
}
