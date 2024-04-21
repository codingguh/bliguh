import 'package:ecommerce_firebase_getx/common/widgets/text_form_fields/text_field_address.dart';
import 'package:ecommerce_firebase_getx/features/personalization/controllers/address_controller.dart';
import 'package:ecommerce_firebase_getx/features/personalization/controllers/region_select_controller.dart';
import 'package:ecommerce_firebase_getx/features/personalization/controllers/streename_controller.dart';
import 'package:ecommerce_firebase_getx/features/personalization/screens/addresses/select_province.dart';
import 'package:ecommerce_firebase_getx/features/personalization/screens/addresses/widgets/address_province_widgets.dart';
import 'package:ecommerce_firebase_getx/features/personalization/screens/addresses/widgets/molecules/autocomplete_streename.dart';
import 'package:ecommerce_firebase_getx/utils/constants/colors.dart';
import 'package:ecommerce_firebase_getx/utils/constants/sizes.dart';
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
  final StreetNoController streetNoController;
  final PhoneNoController phoneNoController;
  final SelectionController regionController;
  final StreetNameController streetNameController;
  final OtherDetailController otherDetailController;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: TColors.grey,
      child: Padding(
        padding: EdgeInsets.only(bottom: TSizes.md),
        child: Form(
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
                            streetNoController: streetNoController,
                            otherDetailController: otherDetailController,
                          ));
                    },
                    child: Text('Street Name , Building , House No.')),
                // TextFieldAddress(
                //     textController: streetNameController.controller,
                //     showClearIcon: streetNameController.isFocused,
                //     hintText: 'Street Name, Buildingm House No.',
                //     isFocused: streetNameController.isFocused,
                //     focuesNode: streetNameController.addressFocusNode),
              ],
            ),
          ),
        )),
      ),
    );
  }
}
