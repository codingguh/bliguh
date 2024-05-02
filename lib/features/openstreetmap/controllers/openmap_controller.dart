import 'dart:convert';
import 'package:bliguh/features/personalization/controllers/address_controller.dart';
import 'package:bliguh/features/personalization/controllers/region_select_controller.dart';
import 'package:bliguh/utils/constants/api_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_dragmarker/flutter_map_dragmarker.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';
import 'package:http/http.dart' as http;

class OpenMapController extends GetxController {
  final marker = GlobalKey<DragMarkerWidgetState>();
  Rx<double> sizeMarker = 66.0.obs;
  Rx<bool> showTooltip = true.obs;
  late MapController mapController;
  Rx<LatLng> markerPosition = LatLng(-6.1944491, 106.8229198).obs;
  final SelectionController regionController = Get.put(SelectionController());

  Rx<bool> isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();

    refreshMap();
    refresh();
  }

  Future<void> refreshMap() async {
    try {
      isLoading.value = true;

      final location =
          await getLocationFromAddress(regionController.listRegion[3]);
      final latitude = location['latitude'];

      final longitude = location['longitude'];

      print("aaagggfsfsdgdghtykyk1212121212fsdgsdgdglat $latitude $longitude");

      markerPosition.value = LatLng(latitude!, longitude!);
      markerPosition.update;
      isLoading.value = false;
    } catch (e) {
      isLoading.value = false;
      print('Error initializing marker position: $e');
    }
  }

  Future<Map<String, double?>> getLocationFromAddress(String address) async {
    final encodedAddress = Uri.encodeComponent(address);
    final apiUrl =
        'https://maps.googleapis.com/maps/api/geocode/json?address=$encodedAddress&key=$GOOGLE_MAP_APIKEY';

    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final results = data['results'] as List<dynamic>;

      if (results.isNotEmpty) {
        print('results ${results[0]['geometry']['location']}');
        final location = results[0]['geometry']['location'];
        final double? latitude = location['lat'];
        final double? longitude = location['lng'];
        print("'latitude': $latitude, 'longitude': $longitude");
        return {'latitude': latitude, 'longitude': longitude};
      }
    }

    throw Exception('Failed to get location from address');
  }

  void onMapCreated(MapController controller) {
    mapController = controller;
  }

  void onMarkerDragEnd(LatLng newPosition) {
    markerPosition.value = newPosition;
  }
}
