import 'package:bliguh/common/widgets/appbar/appbar.dart';
import 'package:bliguh/common/widgets/buttons/button_bottom_navigationbar.dart';
import 'package:bliguh/common/widgets/loaders/loaders.dart';
import 'package:bliguh/features/openstreetmap/controllers/openmap_controller.dart';
import 'package:bliguh/features/personalization/screens/addresses/add_new_address.dart';
import 'package:bliguh/features/personalization/screens/addresses/widgets/molecules/box_street_address.dart';
import 'package:bliguh/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';
import 'package:flutter_map_dragmarker/flutter_map_dragmarker.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class OpenStreetMapAddress extends StatelessWidget {
  const OpenStreetMapAddress({
    super.key,
    required this.address,
  });

  final String address;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OpenMapController());

    WidgetsBinding.instance.addPostFrameCallback((_) {
      controller.refreshMap();
    });
    print('sasfafas ${address} - ${controller.markerPosition.value}');
    return Scaffold(
        appBar: TAppBar(
          showBackArrow: true,
          title: Text('Pin Point Address'),
          bgColor: Colors.transparent,
          showBackground: false,
          isCenter: true,
          onTap: () {
            Get.back();
          },
        ),
        body: Scaffold(
            body: Stack(children: [
          Container(
            height: 735,
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  height: 700,
                  child: Obx(
                    () => address != ''
                        ? controller.isLoading.value
                            ? Center(
                                child: LoadingAnimationWidget.prograssiveDots(
                                    color: TColors.primary, size: 60),
                              )
                            : FlutterMap(
                                // mapController: controller.mapController,
                                options: MapOptions(
                                    initialZoom: 18,
                                    initialCenter:
                                        controller.markerPosition.value,
                                    onPositionChanged: (position, hasGesture) {
                                      print('position ${position.center}');
                                      controller
                                          .onMarkerDragEnd(position.center!);
                                    }),
                                children: [
                                  TileLayer(
                                    urlTemplate:
                                        'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                                    userAgentPackageName: 'com.example.app',
                                  ),
                                  DragMarkers(
                                    markers: [
                                      DragMarker(
                                        key: controller.marker,
                                        size: const Size.square(50),
                                        onDragStart: (details, point) =>
                                            debugPrint("Start point $point"),
                                        onDragEnd: (details, point) =>
                                            debugPrint("End point $point"),
                                        point: controller.markerPosition.value,
                                        offset: const Offset(0.0, -8.0),
                                        onDragUpdate: (details, latLng) =>
                                            print(latLng),
                                        builder: (_, __, ___) => const Icon(
                                          Icons.location_on,
                                          size: 50,
                                          color: TColors.primary,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              )
                        : Text('kosong $address'),
                  ),
                ),
              ],
            ),
          ),
          BoxStreetAddress(
            address: address,
          ),
          Positioned(
              bottom: 10,
              child: ButtonBottomNavigationbar(
                containerHeight: 100,
                buttonHeight: 50,
                text: 'Confirm',
                color: Colors.transparent,
                onTap: () {
                  Get.to(() => AddNewAddresses());
                },
              ))
        ])));
  }
}
