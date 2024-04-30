import 'dart:convert';

import 'package:bliguh/features/personalization/controllers/address_controller.dart';
import 'package:bliguh/utils/constants/api_constants.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;

class CustomMapController extends GetxController {
  late GoogleMapController mapController;
  Rx<LatLng> markerPosition = LatLng(-6.1944491, 106.8229198).obs;
  Rx<bool> isLoading = false.obs;
  Rx<String> addressText = ''.obs;
  LatLng initialCameraPosition = LatLng(-6.1944491, 106.8229198);
  final StreetNoController streetNoController = Get.put(StreetNoController());

  @override
  void onInit() {
    super.onInit();
    refreshMap();
    refresh();
  }

  void refreshMap() async {
    try {
      isLoading.value = true;
      addressText.update;
      final location = await getLocationFromAddress(addressText.value);
      final latitude = location['latitude'];

      final longitude = location['longitude'];

      initialCameraPosition = LatLng(latitude!, longitude!);
      markerPosition.value = LatLng(latitude, longitude);
      markerPosition.update;
      isLoading.value = false;
    } catch (e) {
      print('Error initializing marker position: $e');
    }
  }

  String changeText(String text) {
    addressText.value = text;
    // final modifiedText = text.replaceAll(' ', '%20');
    addressText.update;
    // update();
    return addressText.value;
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
        final location = results[0]['geometry']['location'];
        final double? latitude = location['lat'];
        final double? longitude = location['lng'];

        return {'latitude': latitude, 'longitude': longitude};
      }
    }

    throw Exception('Failed to get location from address');
  }

  void onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  void onMarkerDragEnd(LatLng newPosition) {
    markerPosition.value = newPosition;
  }
}
