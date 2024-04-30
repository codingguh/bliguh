import 'package:bliguh/features/personalization/controllers/user_controller.dart';
import 'package:bliguh/features/personalization/screens/profile/widgets/my_profile_name.dart';
import 'package:bliguh/features/personalization/screens/profile/widgets/my_profile_photo.dart';
import 'package:bliguh/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class MyProfileAppBar extends StatelessWidget implements PreferredSizeWidget {
  // @override
  // Size get preferredSize => Size.fromHeight(kToolbarHeight);
  @override
  Size get preferredSize => Size.fromHeight(175);

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    return PreferredSize(
      preferredSize: preferredSize,
      child: Column(
        children: [
          Container(
            color: TColors.primary,
            height: 190,
            width: double.infinity,
            child: Container(
              width: MediaQuery.of(context).size.width * 0.6,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.35,
                    margin: EdgeInsets.only(top: 56),
                    height: 45,
                    padding: EdgeInsets.symmetric(horizontal: 2, vertical: 2),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(25),
                          bottomRight: Radius.circular(25)),
                      color: Colors.white,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Icon(
                          Iconsax.shop,
                          size: 21,
                        ),
                        Text(
                          'My Shop',
                          style: TextStyle(fontWeight: FontWeight.w500),
                        ),
                        Icon(
                          Icons.chevron_right,
                          size: 23,
                        ),
                      ],
                    ),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      MyProfilePhoto(),
                      MyProfileName(
                        username: controller.user.value.fullName,
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
