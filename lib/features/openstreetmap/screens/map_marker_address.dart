
import 'package:bliguh/features/openstreetmap/screens/open_streetmap.dart';
import 'package:bliguh/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';

class MapMarkerAddress extends StatelessWidget {
  // static final _random = Random(42);
  static final _initialCenter = LatLng(-6.1944491, 106.8229198);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 321,
      child: Stack(
        children: [
          FlutterMap(
            // Add FlutterMap
            options: MapOptions(
              initialCenter: _initialCenter,
              initialZoom: 19,
              interactionOptions: InteractionOptions(
                  enableScrollWheel: false,
                  enableMultiFingerGestureRace: true,
                  flags: InteractiveFlag.none),
            ),
            children: [
              TileLayer(
                // Show a satellite map background
                urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
              ),
              MarkerLayer(markers: [
                Marker(
                    point: _initialCenter,
                    child: const Icon(
                      Icons.location_on,
                      size: 60,
                      color: TColors.primary,
                    )),
              ]), // Show the Markers
              Positioned(
                top: 12,
                left: 2,
                child: GestureDetector(
                  onTap: () {
                    Get.to(() => const OpenStreetMapAddress());
                    // Handle onTap event for the container
                  },
                  child: Container(
                    height: 350,
                    width: double.infinity,
                    child: Text(
                      'TeguhMaps',
                      style: TextStyle(
                          color: TColors.primary,
                          fontSize: 15,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
