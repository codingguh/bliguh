import 'package:ecommerce_firebase_getx/utils/constants/api_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart' as latlng;
import 'package:mapbox_gl/mapbox_gl.dart';

class DragMarkerController extends GetxController {
  final Rx<latlng.LatLng> markerPosition = latlng.LatLng(0, 0).obs;

  void updateMarkerPosition(latlng.LatLng newPosition) {
    markerPosition.value = newPosition;
  }
}

class DragMarkerScreen extends StatelessWidget {
  final DragMarkerController controller = Get.put(DragMarkerController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Drag Marker Screen'),
        ),
        body: Container(
          height: 300,
          child: MapboxMap(
            accessToken: MAPBOX_ACCESS_TOKEN,
            initialCameraPosition:
                CameraPosition(target: LatLng(0, 0), zoom: 5.0),
            onMapCreated: (MapboxMapController controller) {},
          ),
        ));
  }
}
