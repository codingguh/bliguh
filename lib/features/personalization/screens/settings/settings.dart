import 'package:ecommerce_firebase_getx/common/widgets/appbar/appbar.dart';
import 'package:ecommerce_firebase_getx/common/widgets/custom_shapes/containers/primary_header_container.dart';
import 'package:ecommerce_firebase_getx/common/widgets/list_tile/settings_menu_tile.dart';
import 'package:ecommerce_firebase_getx/common/widgets/list_tile/user_profile_tile.dart';
import 'package:ecommerce_firebase_getx/common/widgets/texts/section_heading.dart';
import 'package:ecommerce_firebase_getx/data/dummy_data.dart';
import 'package:ecommerce_firebase_getx/data/repositories/authentications/authentication_repository.dart';
import 'package:ecommerce_firebase_getx/features/authentication/screens/login/login.dart';
import 'package:ecommerce_firebase_getx/features/personalization/screens/profile/profile.dart';
import 'package:ecommerce_firebase_getx/utils/constants/colors.dart';
import 'package:ecommerce_firebase_getx/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

List<Widget> settingsTiles = [];

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            PrimaryHeaderContainer(
                child: Column(
              children: [
                TAppBar(
                    isCenter: true,
                    title: Text(
                      'My Account',
                      style: Theme.of(context).textTheme.headlineMedium!.apply(
                            color: TColors.white,
                          ),
                    )),
                const SizedBox(
                  height: TSizes.spaceBtwSections,
                ),

                ///User Profile card
                UserProfileTile(
                  onPressed: () {
                    Get.to(() => const ProfileScreen());
                  },
                ),
                const SizedBox(
                  height: TSizes.spaceBtwSections,
                ),
              ],
            )),

            ///--Body
            Padding(
              padding: const EdgeInsets.all(TSizes.defaultSpace - 12),
              child: Column(
                children: [
                  SectionHeading(
                    title: 'Account Settings',
                    showActionButton: false,
                  ),
                  const SizedBox(
                    height: TSizes.spaceBtwSections,
                  ),

                  for (int i = 0; i < settingsList.length; i++)
                    SettingsMenuTile(
                      icon: settingsList[i]['icon'],
                      title: settingsList[i]['title'],
                      subTitle: settingsList[i]['subTitle'],
                      onTap: settingsList[i]['onPressed'],
                    ),

                  ///--Appsettings
                  SizedBox(
                    height: TSizes.spaceBtwSections,
                  ),
                  SectionHeading(
                    title: 'App Settings',
                    showActionButton: false,
                  ),
                  SizedBox(
                    height: TSizes.spaceBtwItems,
                  ),
                  for (int i = 0; i < settingsAppMenu.length; i++)
                    SettingsMenuTile(
                      icon: settingsAppMenu[i]['icon'],
                      title: settingsAppMenu[i]['title'],
                      subTitle: settingsAppMenu[i]['subTitle'],
                      onTap: settingsAppMenu[i]['onPressed'],
                      trailing: settingsAppMenu[i]['trailing'],
                    ),
                  SizedBox(
                    height: TSizes.spaceBtwSections,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton(
                        onPressed: () async {
                          await AuhenticationRepository.instance.logout();
                        },
                        child: const Text('Logout')),
                  ),
                  SizedBox(
                    height: TSizes.spaceBtwSections * 2.5,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
