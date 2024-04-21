import 'package:ecommerce_firebase_getx/features/personalization/controllers/googlemap_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GoogleMapAddressWidget extends StatelessWidget {
  const GoogleMapAddressWidget({
    super.key,
    required this.controller,
  });

  final CustomMapController controller;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => controller.addressText.value != ''
          ? GoogleMap(
              padding: EdgeInsets.only(bottom: 110),
              myLocationEnabled: true,
              myLocationButtonEnabled: true,
              initialCameraPosition: CameraPosition(
                target: controller.markerPosition.value,
                zoom: 17.45,
              ),
              zoomControlsEnabled: true,
              onCameraMove: (position) {
                controller.onMarkerDragEnd(position.target);
              },
              markers: {
                Marker(
                  markerId: MarkerId('marker'),
                  position: controller.markerPosition.value,
                  draggable: true,
                  onDragEnd: controller.onMarkerDragEnd,
                ),
              },
            )
          : Text('No address provided'),
    );
  }
}
