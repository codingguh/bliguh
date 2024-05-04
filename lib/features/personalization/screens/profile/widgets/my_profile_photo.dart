import 'package:bliguh/common/widgets/icons/circular_icon.dart';
import 'package:bliguh/common/widgets/images/ciruclar_image.dart';
import 'package:bliguh/features/personalization/controllers/user_controller.dart';
import 'package:bliguh/features/personalization/screens/profile/profile.dart';
import 'package:bliguh/utils/constants/colors.dart';
import 'package:bliguh/utils/constants/image_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyProfilePhoto extends StatelessWidget {
  const MyProfilePhoto({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UserController());
    final networkImage = controller.user.value.profilePicture;
    final image = networkImage.isNotEmpty ? networkImage : TImages.teguh;
    // print(
    //     'profile pic ${networkImage} -- ${GetStorage().read('user')['ProfilePicture']}');
    return Stack(
      children: [
        InkWell(
          onTap: () {
            Get.to(() => const ProfileScreen());
          },
          child: Container(
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
                      image: image,
                      isNetworkImage: networkImage.isNotEmpty,
                      width: 66,
                      height: 66,
                      padding: 0,
                    ),
                  ],
                ),
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
