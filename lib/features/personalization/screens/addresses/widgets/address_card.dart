import 'package:bliguh/common/widgets/containers/RoundedContainer.dart';
import 'package:bliguh/features/personalization/screens/addresses/widgets/badge_selected.dart';
import 'package:bliguh/features/personalization/screens/addresses/widgets/title_card_address.dart';
import 'package:bliguh/utils/constants/colors.dart';
import 'package:bliguh/utils/constants/sizes.dart';
import 'package:bliguh/utils/helpers/helper_functions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddressCard extends StatelessWidget {
  const AddressCard({
    super.key,
    required this.selectedAddress,
    required this.text,
    required this.phoneNo,
    this.address = 'Ciekek Karaton No.35, RT.1/RW.8, Pandegelang, Pandegelang',
    this.subAddress = 'PANDEGELANG,KAB PANDEGELANG, BANTEN ID 42211',
  });

  final bool selectedAddress;
  final String text, phoneNo, address, subAddress;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);

    return RoundedContainer(
      width: double.infinity,
      radius: TSizes.cardRadiusSm / 2,
      showBorder: true,
      borderColor: TColors.grey,
      margin: const EdgeInsets.only(bottom: TSizes.spaceBtwItems),
      child: Stack(
        children: [
          selectedAddress ? BadgeSelected() : SizedBox(),
          Container(
            margin: EdgeInsets.only(top: selectedAddress ? 12 : 0),
            padding: const EdgeInsets.symmetric(
                horizontal: TSizes.sm, vertical: TSizes.md),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TitleCardAddress(
                  addressName: text,
                  phoneNo: phoneNo,
                ),
                SizedBox(
                  height: TSizes.sm,
                ),
                Text(
                  address,
                  style: TextStyle(fontSize: 11),
                  // textAlign: TextAlign.justify,
                ),
                SizedBox(
                  height: TSizes.sm / 2,
                ),
                Text(
                  subAddress,
                  style: TextStyle(fontSize: 11),
                  // textAlign: TextAlign.justify,
                ),
                SizedBox(
                  height: TSizes.sm / 2,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
