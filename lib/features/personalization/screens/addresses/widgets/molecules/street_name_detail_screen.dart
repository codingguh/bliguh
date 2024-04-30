import 'package:bliguh/common/widgets/appbar/appbar.dart';
import 'package:bliguh/common/widgets/buttons/button_bottom_navigationbar.dart';
import 'package:bliguh/common/widgets/text_form_fields/text_field_address.dart';
import 'package:bliguh/features/personalization/controllers/address_controller.dart';
import 'package:bliguh/features/personalization/controllers/googlemap_controller.dart';
import 'package:bliguh/features/personalization/controllers/region_select_controller.dart';
import 'package:bliguh/features/personalization/screens/addresses/add_new_address.dart';
import 'package:bliguh/features/personalization/screens/addresses/widgets/molecules/googlemaps_address.dart';
import 'package:bliguh/utils/constants/image_strings.dart';
import 'package:bliguh/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:lottie/lottie.dart';
import 'package:get/get.dart';
import 'dart:convert';

class StreetNameDetailScreen extends StatelessWidget {
  const StreetNameDetailScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final StreetNoController streetNoController = Get.put(StreetNoController());
    final OtherDetailController otherDetailController =
        Get.put(OtherDetailController());
    final SelectionController regionController = Get.put(SelectionController());
    CustomMapController addressMap = Get.put(CustomMapController());
    return Scaffold(
      appBar: TAppBar(
        isCenter: true,
        title: Text('Street Name&Other Detail'),
        showBackArrow: true,
        onTap: () {
          Get.to(() => AddNewAddresses(),
              transition: Transition.leftToRight,
              duration: Duration(microseconds: 150));
        },
      ),
      bottomNavigationBar: ButtonBottomNavigationbar(
        buttonHeight: 50,
        text: 'Next',
        onTap: () {
          addressMap.addressText.value =
              streetNoController.streetNoController.text;
          Get.to(
              () => GoogleMapAddress(
                    address: streetNoController.streetNoController.text,
                  ),
              transition: Transition.downToUp);
        },
      ),
      body: Obx(
        () => Padding(
          padding: EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextFieldAddress(
                      textController: streetNoController.streetNoController,
                      showClearIcon: streetNoController.isFocused,
                      hintText: 'Street name, building house no.',
                      maxLength: 25,
                      isFocused: streetNoController.isFocused,
                      focuesNode: streetNoController.streetNoFocusNode,
                      onTap: () {
                        streetNoController.setFocus(true);
                        otherDetailController.setFocus(false);
                      },
                      onChanged: (String text) {
                        onChangeFetch(text);
                      }),
                  TextFieldAddress(
                      showDivider: false,
                      textController:
                          otherDetailController.otherDetailController,
                      showClearIcon: otherDetailController.isFocused,
                      hintText: 'Other Details',
                      isFocused: otherDetailController.isFocused,
                      focuesNode: otherDetailController.otherDetailFocusNode,
                      onTap: () {
                        otherDetailController.setFocus(true);
                        streetNoController.setFocus(false);
                      },
                      onChanged: (String text) {})
                ],
              ),
              if (streetNoController.isFocused.value)
                Obx(
                  () => regionController.isLoading.value
                      ? Lottie.asset(TImages.loadingAnimation,
                          repeat: true,
                          animate: true,
                          alignment: Alignment.center)
                      : Expanded(
                          child: FutureBuilder<List<String>>(
                            future: fetchPlaceName(
                                regionController, streetNoController),
                            builder: (context, snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return Center(
                                  child: Lottie.asset(TImages.loadingAnimation,
                                      width: 120,
                                      height: 120,
                                      repeat: true,
                                      animate: true,
                                      alignment: Alignment.center),
                                );
                              } else if (snapshot.hasError) {
                                return Text('Error: ${snapshot.error}');
                              } else if (snapshot.hasData) {
                                final placeNames = snapshot.data!;
                                return ListView.builder(
                                  itemCount: placeNames.length,
                                  itemBuilder: (context, index) {
                                    return InkWell(
                                      onTap: () {
                                        streetNoController.streetNoController
                                            .text = placeNames[index];
                                        addressMap
                                            .changeText(placeNames[index]);
                                        otherDetailController.setFocus(true);
                                        streetNoController.setFocus(false);
                                        print(
                                            "Mity ${streetNoController.streetNoController.text}");
                                        print("Mity ${addressMap.addressText}");
                                      },
                                      child: ListTile(
                                        title: Text(placeNames[index]),
                                      ),
                                    );
                                  },
                                );
                              } else {
                                return Text('No place names available');
                              }
                            },
                          ),
                        ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  Future<List<String>> onChangeFetch(String text) async {
    final modifiedText = text.replaceAll(' ', '%20');
    final SelectionController regionController = Get.put(SelectionController());
    regionController.isLoading.value = true;

    List<String> placeNames = [''];
    try {
      final String place = modifiedText;
      final String ACCESS_TOKEN =
          'pk.eyJ1IjoidGVndWhhcml0cyIsImEiOiJjbHV2cDNwNGswNDZkMmlsM2dkbjYxemJxIn0.WC7d8ULnuefDTmpF0Gc13A';
      final String url =
          'https://api.mapbox.com/geocoding/v5/mapbox.places/$place.json?access_token=${ACCESS_TOKEN}';
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final jsonBody = jsonDecode(response.body);
        final features = jsonBody['features'] as List<dynamic>;
        placeNames = features.map((feature) {
          return feature['place_name'] as String;
        }).toList();
        // streetNoController.streetNoController.text = placeNames.first;
        regionController.isLoading.value = false;
        // print("loading ${regionController.isLoading.value.toString()}");
        return placeNames;
      }
      regionController.isLoading.value = false;
    } catch (e) {
      print('Error fetching place names: $e');
      regionController.isLoading.value = false;
      throw Exception('Failed to fetch place name $e');
    }

    return placeNames;
  }
}

Future<List<String>> fetchPlaceName(SelectionController regionController,
    StreetNoController streetNoController) async {
  final CustomMapController customMapController =
      Get.put(CustomMapController());
  customMapController.isLoading.value = true;
  final text = streetNoController.streetNoController.text;
  customMapController.changeText(text);

  final modifiedText = text.replaceAll(' ', '%20');
  final String place = regionController.listRegion.length > 1
      ? regionController.listRegion
          .take(regionController.listRegion.length - 1)
          .join(', ')
      : modifiedText;
  final String ACCESS_TOKEN =
      'pk.eyJ1IjoidGVndWhhcml0cyIsImEiOiJjbHV2cDNwNGswNDZkMmlsM2dkbjYxemJxIn0.WC7d8ULnuefDTmpF0Gc13A';
  final String url =
      'https://api.mapbox.com/geocoding/v5/mapbox.places/$place.json?access_token=${ACCESS_TOKEN}';
  final response = await http.get(Uri.parse(url));

  if (response.statusCode == 200) {
    final jsonBody = jsonDecode(response.body);
    final features = jsonBody['features'] as List<dynamic>;
    final List<String> placeNames = features.map((feature) {
      return feature['place_name'] as String;
    }).toList();
    customMapController.isLoading.value = false;
    return placeNames;
  }
  customMapController.isLoading.value = false;
  throw Exception('Failed to fetch place name');
}
