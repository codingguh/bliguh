import 'package:ecommerce_firebase_getx/common/widgets/appbar/appbar.dart';
import 'package:ecommerce_firebase_getx/common/widgets/buttons/button_bottom_navigationbar.dart';
import 'package:ecommerce_firebase_getx/features/personalization/controllers/address_controller.dart';
import 'package:ecommerce_firebase_getx/features/personalization/controllers/region_select_controller.dart';
import 'package:ecommerce_firebase_getx/features/personalization/controllers/streename_controller.dart';
import 'package:ecommerce_firebase_getx/features/personalization/screens/addresses/addresses.dart';
import 'package:ecommerce_firebase_getx/features/personalization/screens/addresses/widgets/address_input_card.dart';
import 'package:ecommerce_firebase_getx/features/personalization/screens/addresses/widgets/checkbox_address.dart';
import 'package:ecommerce_firebase_getx/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
    final StreetNoController streetNoController = Get.put(StreetNoController());
    final OtherDetailController otherDetailController =
        Get.put(OtherDetailController());
    final SelectionController regionController = Get.put(SelectionController());
    final StreetNameController streetNameController =
        Get.put(StreetNameController());

    return Scaffold(
      appBar: TAppBar(
        showBackArrow: true,
        onTap: () {
          Get.to(
            () => UserAddressScreen(),
            transition: Transition.leftToRight,
          );
        },
        isCenter: true,
        title: Text(
          'New Addresss',
        ),
      ),
      bottomNavigationBar: ButtonBottomNavigationbar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            AddressInputCard(
              addressController: addressController,
              phoneNoController: phoneNoController,
              regionController: regionController,
              streetNameController: streetNameController,
              streetNoController: streetNoController,
              otherDetailController: otherDetailController,
            ),
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
