import 'package:ecommerce_firebase_getx/common/widgets/appbar/appbar.dart';
import 'package:ecommerce_firebase_getx/common/widgets/text_form_fields/text_field_address.dart';
import 'package:ecommerce_firebase_getx/features/personalization/controllers/address_controller.dart';
import 'package:ecommerce_firebase_getx/features/personalization/controllers/region_select_controller.dart';
import 'package:ecommerce_firebase_getx/features/personalization/controllers/streename_controller.dart';
import 'package:ecommerce_firebase_getx/features/personalization/screens/addresses/select_province.dart';
import 'package:ecommerce_firebase_getx/features/personalization/screens/addresses/widgets/address_province_widgets.dart';
import 'package:ecommerce_firebase_getx/utils/constants/colors.dart';
import 'package:ecommerce_firebase_getx/utils/constants/sizes.dart';
import 'package:ecommerce_firebase_getx/utils/theme/custom_themes/text_field_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:iconsax/iconsax.dart';

class AddNewAddresses extends StatelessWidget {
  final InputDecoration decoration2 = const InputDecoration(
      // Define decoration properties for the second decoration
      // For example, set border color and focused border color
      border: InputBorder.none,
      focusedBorder: InputBorder.none,
      enabledBorder: InputBorder.none);

  const AddNewAddresses({super.key});

  @override
  Widget build(BuildContext context) {
    final AddressController addressController = Get.put(AddressController());
    final PhoneNoController phoneNoController = Get.put(PhoneNoController());
    final SelectionController regionController = Get.put(SelectionController());
    final StreetNameController streetNameController =
        Get.put(StreetNameController());

    return Scaffold(
      appBar: TAppBar(
        showBackArrow: true,
        isCenter: true,
        title: Text(
          'New Address',
        ),
      ),
      bottomNavigationBar: Container(
          width: MediaQuery.of(context).size.width,
          height: 115,
          color: Colors.white,
          child: Padding(
            padding: EdgeInsets.only(
              bottom: TSizes.defaultSpace * 1.5,
              left: TSizes.lg * 1.25,
              top: TSizes.lg,
              right: TSizes.lg * 1.25,
            ),
            child: ElevatedButton(
              onPressed: () {},
              child: Text('Submit'),
            ),
          )),
      body: SingleChildScrollView(
        child: Column(
          children: [
            AddressInputCard(
                addressController: addressController,
                phoneNoController: phoneNoController,
                regionController: regionController,
                streetNameController: streetNameController),
            Form(
              child: Container(
                color: Colors.white,
                padding: EdgeInsets.all(TSizes.defaultSpace),
                child: Column(
                  children: [
                    CheckBoxAddress(
                      text: 'Set As Default Address',
                    ),
                    CheckBoxAddress(
                      text: 'Set As Pickup Address',
                    ),
                    CheckBoxAddress(
                      text: 'Set As Return Address',
                    ),
                    CheckBoxAddress(
                      text: 'Label As',
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class CheckBoxAddress extends StatelessWidget {
  const CheckBoxAddress({
    super.key,
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              text,
              style: TextStyle(
                  color: Color.fromARGB(255, 105, 105, 105),
                  fontSize: 15.5,
                  fontWeight: FontWeight.w400),
            ),
            Switch(
              value: false,
              onChanged: (value) {},
              activeColor: TColors.primary,
            )
          ],
        ),
        Divider(
          height: 0,
        )
      ],
    );
  }
}

class AddressInputCard extends StatelessWidget {
  const AddressInputCard({
    super.key,
    required this.addressController,
    required this.phoneNoController,
    required this.regionController,
    required this.streetNameController,
  });

  final AddressController addressController;
  final PhoneNoController phoneNoController;
  final SelectionController regionController;
  final StreetNameController streetNameController;

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
                Obx(
                  () => AddressSelectProvince(
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
                ),
                TextFieldAddress(
                    textController: streetNameController.controller,
                    showClearIcon: streetNameController.isFocused,
                    hintText: 'Street Name, Buildingm House No.',
                    isFocused: streetNameController.isFocused,
                    focuesNode: streetNameController.addressFocusNode),
                // TextFieldAddress(
                //     textController: streetNameController.controller,
                //     showClearIcon: streetNameController.isFocused,
                //     hintText: 'Other Details',
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
