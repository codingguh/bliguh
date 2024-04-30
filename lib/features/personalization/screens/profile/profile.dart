import 'package:bliguh/common/widgets/appbar/appbar.dart';
import 'package:bliguh/common/widgets/images/ciruclar_image.dart';
import 'package:bliguh/common/widgets/texts/section_heading.dart';
import 'package:bliguh/features/personalization/controllers/user_controller.dart';
import 'package:bliguh/features/personalization/screens/profile/change_name.dart';
import 'package:bliguh/features/personalization/screens/profile/widgets/profile_menu.dart';
import 'package:bliguh/navigation_menu.dart';
import 'package:bliguh/utils/constants/image_strings.dart';
import 'package:bliguh/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    return Scaffold(
      appBar: TAppBar(
        showBackArrow: true,
        isCenter: true,
        onTap: () {
          Get.to(() => const NavigationMenu(),
              transition: Transition.leftToRight);
        },
        title: Text('Profile'),
      ),

      ///-- Body
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              SizedBox(
                width: double.infinity,
                child: Column(
                  children: [
                    CircularImage(
                      image: TImages.user,
                      isNetworkImage: false,
                      width: 97,
                      height: 97,
                    ),
                    TextButton(
                        onPressed: () {},
                        child: const Text('Change Profile Screen'))
                  ],
                ),
              ),
              const SizedBox(
                height: TSizes.spaceBtwItems / 2,
              ),
              const Divider(),
              const SizedBox(
                height: TSizes.spaceBtwItems,
              ),

              /// Heading Profile info
              SectionHeading(
                title: 'Profile Information',
                showActionButton: false,
              ),
              const SizedBox(
                height: TSizes.spaceBtwItems,
              ),
              ProfileMenu(
                onPressed: () => Get.to(() => ChangeName()),
                title: 'Fullname',
                value: controller.user.value.fullName,
              ),
              ProfileMenu(
                onPressed: () {},
                title: 'Username',
                value: '@teguhcodedev3',
              ),

              const SizedBox(
                height: TSizes.spaceBtwItems / 2,
              ),
              const Divider(),
              const SizedBox(
                height: TSizes.spaceBtwItems,
              ),

              ///Heading personal info
              SectionHeading(
                title: 'Profile Information',
                showActionButton: false,
              ),
              const SizedBox(
                height: TSizes.spaceBtwItems,
              ),
              ProfileMenu(
                onPressed: () {},
                title: 'User ID',
                value: '423114',
                icon: Iconsax.copy,
              ),
              ProfileMenu(
                onPressed: () {},
                title: 'Email',
                value: 'Teguhcodedev3@gmail.com',
              ),
              ProfileMenu(
                onPressed: () {},
                title: 'Gender',
                value: 'Male',
              ),
              ProfileMenu(
                onPressed: () {},
                title: 'Date of Birth',
                value: '21 Maret 1997',
              ),
              const Divider(),
              const SizedBox(
                height: TSizes.spaceBtwItems,
              ),
              SizedBox(
                width: double.infinity,
                child: TextButton(
                    onPressed: () => controller.deleteAccountWarningPopup(),
                    child: const Text(
                      'Close Account',
                      style: TextStyle(
                          color: Colors.red,
                          fontSize: 15,
                          fontWeight: FontWeight.w800),
                    )),
              ),
              SizedBox(
                height: TSizes.spaceBtwSections * 2.5,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
