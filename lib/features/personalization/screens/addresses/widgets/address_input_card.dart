import 'package:bliguh/common/widgets/text_form_fields/text_field_address.dart';
import 'package:bliguh/features/personalization/controllers/address_controller.dart';
import 'package:bliguh/features/personalization/controllers/googlemap_controller.dart';
import 'package:bliguh/features/personalization/controllers/region_select_controller.dart';
import 'package:bliguh/features/personalization/controllers/streename_controller.dart';
import 'package:bliguh/features/personalization/screens/addresses/select_province.dart';
import 'package:bliguh/features/personalization/screens/addresses/widgets/address_province_widgets.dart';
import 'package:bliguh/features/personalization/screens/addresses/widgets/molecules/street_name_detail_screen.dart';
import 'package:bliguh/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddressInputCard extends StatelessWidget {
  const AddressInputCard({
    super.key,
    required this.addressController,
    required this.phoneNoController,
    required this.regionController,
    required this.streetNameController,
    required this.streetNoController,
    required this.otherDetailController,
  });

  final AddressController addressController;
  final PhoneNoController phoneNoController;
  final StreetNoController streetNoController;
  final OtherDetailController otherDetailController;
  final SelectionController regionController;
  final StreetNameController streetNameController;

  @override
  Widget build(BuildContext context) {
    final CustomMapController mapController = Get.put(CustomMapController());
    return Form(
        child: Container(
      color: Colors.white,
      child: Padding(
        padding: EdgeInsets.all(TSizes.defaultSpace / 1.2),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Address',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            TextFieldAddress(
                textController: addressController.addressController,
                showClearIcon: addressController.isFocused,
                hintText: 'Fullname',
                isFocused: addressController.isFocused,
                focuesNode: addressController.addressFocusNode),
            TextFieldAddress(
              textController: phoneNoController.phoneNoController,
              showClearIcon: phoneNoController.isFocused,
              hintText: 'Phone Number',
              isFocused: phoneNoController.isFocused,
              focuesNode: phoneNoController.phoneNoFocusNode,
            ),
            AddressSelectProvince(
              showBold: regionController.listRegion.length > 1 ? true : false,
              onTap: () {
                Get.offAll(() => SelectProvinceScreen(),
                    transition: Transition.downToUp,
                    duration: Duration(milliseconds: 400),
                    curve: Curves.ease
                    // curve: Curves.easeInOut
                    );
              },
              title: regionController.listRegion.isEmpty
                  ? 'Province, District, City, Postal Code'
                  : regionController.listRegion.length > 1
                      ? regionController.listRegion
                          .take(regionController.listRegion.length - 1)
                          .join(', ')
                      : regionController.listRegion
                          .take(regionController.listRegion.length)
                          .join(', '),
            ),
            InkWell(
                onTap: () {
                  Get.to(() => StreetNameDetailScreen(
                        address: streetNoController.streetNoController.text,
                      ));
                },
                child: mapController.addressText != ''
                    ? AddressSelectProvince(
                        showBold: true,
                        title: streetNoController.streetNoController.text)
                    : AddressSelectProvince(
                        showBold: false,
                        title: 'Street Name , Building , House No.')),
          ],
        ),
      ),
    ));
  }
}
