import 'package:ecommerce_firebase_getx/common/widgets/appbar/appbar.dart';
import 'package:ecommerce_firebase_getx/common/widgets/buttons/button_bottom_navigationbar.dart';
import 'package:ecommerce_firebase_getx/features/personalization/controllers/googlemap_controller.dart';
import 'package:ecommerce_firebase_getx/features/personalization/screens/addresses/add_new_address.dart';
import 'package:ecommerce_firebase_getx/features/personalization/screens/addresses/widgets/molecules/box_street_address.dart';
import 'package:ecommerce_firebase_getx/features/personalization/screens/addresses/widgets/molecules/google_map_address.dart';
import 'package:ecommerce_firebase_getx/features/personalization/screens/addresses/widgets/molecules/street_name_detail_screen.dart';
import 'package:ecommerce_firebase_getx/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class GoogleMapAddress extends StatelessWidget {
  const GoogleMapAddress({super.key, required this.address});

  final String address;

  @override
  @override
  Widget build(BuildContext context) {
    final CustomMapController controller = Get.put(CustomMapController());
    // Call refreshMap when the screen is first opened
    WidgetsBinding.instance.addPostFrameCallback((_) {
      controller.refreshMap();
    });

    return Scaffold(
      appBar: TAppBar(
        title: Text('Edit Location'),
        isCenter: true,
        showBackArrow: true,
        onTap: () {
          Get.off(() => StreetNameDetailScreen(),
              transition: Transition.upToDown,
              duration: Duration(microseconds: 250));
        },
      ),
      body: Stack(
        children: [
          Container(
            height: 735,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Obx(
                  () => Container(
                    height: 735,
                    child: controller.isLoading.value
                        ? Center(
                            child: LoadingAnimationWidget.prograssiveDots(
                                color: TColors.primary, size: 90),
                          )
                        : GoogleMapAddressWidget(controller: controller),
                  ),
                ),
              ],
            ),
          ),
          BoxStreetAddress(
            address: address,
          ),
          Positioned(
              bottom: 30,
              child: ButtonBottomNavigationbar(
                containerHeight: 70,
                buttonHeight: 50,
                text: 'Confirm',
                color: Colors.transparent,
                onTap: () {
                  Get.to(() => AddNewAddresses());
                },
              ))
        ],
      ),
    );
  }
}
