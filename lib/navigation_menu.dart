import 'package:ecommerce_firebase_getx/features/personalization/screens/settings/settings.dart';
import 'package:ecommerce_firebase_getx/features/shop/screens/favourite/favourite.dart';
import 'package:ecommerce_firebase_getx/features/shop/screens/home/home.dart';
import 'package:ecommerce_firebase_getx/features/shop/screens/store/store.dart';
import 'package:ecommerce_firebase_getx/features/shop/screens/voucher/voucher_screen.dart';
import 'package:ecommerce_firebase_getx/utils/constants/colors.dart';
import 'package:ecommerce_firebase_getx/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class NavigationMenu extends StatelessWidget {
  const NavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationController());
    final dark = THelperFunctions.isDarkMode(context);
    return Scaffold(
      bottomNavigationBar: Obx(
        () => NavigationBar(
          height: 80,
          elevation: 0,
          labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
          selectedIndex: controller.selectedIndex.value,
          onDestinationSelected: (index) =>
              controller.selectedIndex.value = index,
          backgroundColor: dark ? TColors.black : TColors.white,
          indicatorColor: dark
              ? TColors.white.withOpacity(0.1)
              : TColors.primary.withOpacity(0.175),
          destinations: controller.destinations.map((destination) {
            return NavigationDestination(
                icon: destination.icon, label: destination.label);
          }).toList(),
        ),
      ),
      body: Obx(() => controller.screens[controller.selectedIndex.value]),
    );
  }
}

class NavigationController extends GetxController {
  final Rx<int> selectedIndex = 0.obs;

  // Define your NavigationDestination class
  final destinations = [
    const NavigationDestination(icon: Icon(Iconsax.home), label: 'Home'),
    const NavigationDestination(icon: Icon(Iconsax.shop), label: 'Store'),
    const NavigationDestination(icon: Icon(Iconsax.ticket), label: 'Whishlist'),
    const NavigationDestination(
        icon: Icon(Iconsax.heart), label: 'Notification'),
    const NavigationDestination(icon: Icon(Iconsax.user), label: 'Profile'),
  ];

  final screens = [
    HomeScreen(),
    StoreScreen(),
    VoucherScreen(),
    FavouriteScreen(),
    SettingsScreen()
  ];
}
