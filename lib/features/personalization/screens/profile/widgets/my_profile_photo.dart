import 'package:ecommerce_firebase_getx/common/widgets/icons/circular_icon.dart';
import 'package:ecommerce_firebase_getx/common/widgets/images/ciruclar_image.dart';
import 'package:ecommerce_firebase_getx/features/personalization/screens/profile/profile.dart';
import 'package:ecommerce_firebase_getx/utils/constants/colors.dart';
import 'package:ecommerce_firebase_getx/utils/constants/image_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyProfilePhoto extends StatelessWidget {
  const MyProfilePhoto({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: EdgeInsets.only(top: 15, left: 7),
          width: 73,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(66)),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(66),
            child: SizedBox(
              height: 66,
              width: 66,
              child: Stack(
                children: [
                  CircularImage(
                    image: TImages.user,
                    isNetworkImage: false,
                    width: 66,
                    height: 66,
                    padding: 0,
                  ),
                ],
              ),
            ),
          ),
        ),
        Positioned(
            // right: -20,
            bottom: 5,
            right: 3,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(42),
              child: Container(
                padding: EdgeInsets.all(6),
                width: 25,
                height: 25,
                decoration: BoxDecoration(
                  color: TColors.black.withOpacity(0.55),
                ),
                child: InkWell(
                  onTap: () {
                    Get.to(() => const ProfileScreen());
                  },
                  child: Center(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(18),
                      child: CircularIcon(
                        overlayColor: Colors.white,
                        // color: Colors.white,
                        icon: Icons.edit,
                        size: 13,
                      ),
                    ),
                  ),
                ),
              ),
            ))
      ],
    );
  }
}
