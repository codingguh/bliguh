import 'package:ecommerce_firebase_getx/common/widgets/appbar/appbar.dart';
import 'package:ecommerce_firebase_getx/common/widgets/buttons/button_bottom_navigationbar.dart';
import 'package:ecommerce_firebase_getx/common/widgets/text_form_fields/text_field_address.dart';
import 'package:ecommerce_firebase_getx/features/personalization/controllers/address_controller.dart';
import 'package:ecommerce_firebase_getx/features/personalization/controllers/region_select_controller.dart';
import 'package:ecommerce_firebase_getx/utils/constants/colors.dart';
import 'package:ecommerce_firebase_getx/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'dart:convert';

class StreetNameDetailScreen extends StatelessWidget {
  const StreetNameDetailScreen(
      {super.key,
      required this.streetNoController,
      required this.otherDetailController});
  final StreetNoController streetNoController;
  final OtherDetailController otherDetailController;

  @override
  Widget build(BuildContext context) {
    final SelectionController regionController = Get.put(SelectionController());
    return Scaffold(
      appBar: TAppBar(
        isCenter: true,
        title: Text('New Address'),
        showBackArrow: true,
        onTap: () {
          Get.back();
        },
      ),
      bottomNavigationBar: ButtonBottomNavigationbar(
        buttonHeight: 50,
        text: 'Next',
        onTap: () {
          // Get.to(() => DragMarkerScreen());
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
                  Text(streetNoController.isFocused.toString()),
                  Text(otherDetailController.isFocused.toString()),
                  TextFieldAddress(
                    textController: streetNoController.streetNoController,
                    showClearIcon: streetNoController.isFocused,
                    hintText: 'Street name, building house no.',
                    isFocused: streetNoController.isFocused,
                    focuesNode: streetNoController.streetNoFocusNode,
                    onTap: () {
                      streetNoController.setFocus(true);
                      otherDetailController.setFocus(false);
                    },
                  ),
                  TextFieldAddress(
                    showDivider: false,
                    textController: otherDetailController.otherDetailController,
                    showClearIcon: otherDetailController.isFocused,
                    hintText: 'Other Details',
                    isFocused: otherDetailController.isFocused,
                    focuesNode: otherDetailController.otherDetailFocusNode,
                    onTap: () {
                      otherDetailController.setFocus(true);
                      streetNoController.setFocus(false);
                    },
                  ),
                ],
              ),
              if (streetNoController.isFocused.value)
                Obx(
                  () => Expanded(
                    child: FutureBuilder<List<String>>(
                      future: fetchPlaceName(regionController),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return Center(
                            child: LoadingAnimationWidget.prograssiveDots(
                                color: TColors.primary, size: 90),
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
                                  streetNoController.streetNoController.text =
                                      placeNames[index];
                                  otherDetailController.setFocus(true);
                                  streetNoController.setFocus(false);
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

  Future<List<String>> fetchPlaceName(
      SelectionController regionController) async {
    final String place = regionController.listRegion.length > 1
        ? regionController.listRegion
            .take(regionController.listRegion.length - 1)
            .join(', ')
        : 'Jakarta';
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
      return placeNames;
    }
    throw Exception('Failed to fetch place name');
  }
}
