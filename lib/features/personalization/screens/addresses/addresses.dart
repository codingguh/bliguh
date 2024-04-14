import 'package:ecommerce_firebase_getx/common/widgets/appbar/appbar.dart';
import 'package:ecommerce_firebase_getx/common/widgets/containers/RoundedContainer.dart';
import 'package:ecommerce_firebase_getx/features/personalization/screens/addresses/add_new_address.dart';
import 'package:ecommerce_firebase_getx/features/personalization/screens/addresses/widgets/address_card.dart';
import 'package:ecommerce_firebase_getx/utils/constants/colors.dart';
import 'package:ecommerce_firebase_getx/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class UserAddressScreen extends StatelessWidget {
  const UserAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: TColors.primary,
        onPressed: () => Get.to(() => AddNewAddresses()),
        child: Icon(
          Iconsax.add,
          color: TColors.white,
        ),
      ),
      appBar: TAppBar(
        showBackArrow: true,
        isCenter: true,
        title: Text(
          'Addresses',
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(TSizes.defaultSpace - 10),
          child: Column(
            children: [
              AddressCard(
                selectedAddress: true,
                text: 'Rumah Teh Ipok',
                phoneNo: '(+62)827381281',
              ),
              AddressCard(
                selectedAddress: false,
                text: 'Teguh Muhammad Harits',
                phoneNo: '(+62)85156852190',
                address:
                    'Perumahan Gardenia Residencem Jalan Bojong Baru,Bojong Gede block G7',
                subAddress: 'BOJONG GEDE, KAB.BOGOR, JAWABARAT, ID 16920',
              ),
              AddressCard(
                selectedAddress: true,
                text: 'Rumah Teh Ipok',
                phoneNo: '(+62)827381281',
              ),
              AddressCard(
                selectedAddress: false,
                text: 'Teguh Muhammad Harits',
                phoneNo: '(+62)85156852190',
                address:
                    'Perumahan Gardenia Residencem Jalan Bojong Baru,Bojong Gede block G7',
                subAddress: 'BOJONG GEDE, KAB.BOGOR, JAWABARAT, ID 16920',
              ),
              AddressCard(
                selectedAddress: true,
                text: 'Rumah Teh Ipok',
                phoneNo: '(+62)827381281',
              ),
              AddressCard(
                selectedAddress: false,
                text: 'Teguh Muhammad Harits',
                phoneNo: '(+62)85156852190',
                address:
                    'Perumahan Gardenia Residencem Jalan Bojong Baru,Bojong Gede block G7',
                subAddress: 'BOJONG GEDE, KAB.BOGOR, JAWABARAT, ID 16920',
              ),
              AddressCard(
                selectedAddress: true,
                text: 'Rumah Teh Ipok',
                phoneNo: '(+62)827381281',
              ),
              AddressCard(
                selectedAddress: false,
                text: 'Teguh Muhammad Harits',
                phoneNo: '(+62)85156852190',
                address:
                    'Perumahan Gardenia Residencem Jalan Bojong Baru,Bojong Gede block G7',
                subAddress: 'BOJONG GEDE, KAB.BOGOR, JAWABARAT, ID 16920',
              ),
              AddressCard(
                selectedAddress: true,
                text: 'Rumah Teh Ipok',
                phoneNo: '(+62)827381281',
              ),
              AddressCard(
                selectedAddress: false,
                text: 'Teguh Muhammad Harits',
                phoneNo: '(+62)85156852190',
                address:
                    'Perumahan Gardenia Residencem Jalan Bojong Baru,Bojong Gede block G7',
                subAddress: 'BOJONG GEDE, KAB.BOGOR, JAWABARAT, ID 16920',
              ),
              AddressCard(
                selectedAddress: true,
                text: 'Rumah Teh Ipok',
                phoneNo: '(+62)827381281',
              ),
              AddressCard(
                selectedAddress: false,
                text: 'Teguh Muhammad Harits',
                phoneNo: '(+62)85156852190',
                address:
                    'Perumahan Gardenia Residencem Jalan Bojong Baru,Bojong Gede block G7',
                subAddress: 'BOJONG GEDE, KAB.BOGOR, JAWABARAT, ID 16920',
              ),
              AddressCard(
                selectedAddress: true,
                text: 'Rumah Teh Ipok',
                phoneNo: '(+62)827381281',
              ),
              AddressCard(
                selectedAddress: false,
                text: 'Teguh Muhammad Harits',
                phoneNo: '(+62)85156852190',
                address:
                    'Perumahan Gardenia Residencem Jalan Bojong Baru,Bojong Gede block G7',
                subAddress: 'BOJONG GEDE, KAB.BOGOR, JAWABARAT, ID 16920',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
