import 'package:bliguh/common/widgets/appbar/appbar.dart';
import 'package:bliguh/features/openstreetmap/controllers/openmap_controller.dart';
import 'package:bliguh/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:get/get.dart';
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
            ),
            children: [
              TileLayer(
                urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
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
                    onDragUpdate: (details, latLng) => print(latLng),
                    builder: (_, __, ___) => const Icon(
                      Icons.location_on,
                      size: 50,
                      color: TColors.primary,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ])));
  }
}
