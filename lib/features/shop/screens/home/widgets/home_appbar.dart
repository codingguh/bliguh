import 'package:ecommerce_firebase_getx/common/widgets/shimmer/shimmer_effect.dart';
import 'package:ecommerce_firebase_getx/features/personalization/controllers/user_controller.dart';
import 'package:ecommerce_firebase_getx/features/shop/screens/cart/cart.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_firebase_getx/common/widgets/appbar/appbar.dart';
import 'package:ecommerce_firebase_getx/common/widgets/products/cart/cart_menu_icon.dart';
import 'package:ecommerce_firebase_getx/utils/constants/colors.dart';
import 'package:ecommerce_firebase_getx/utils/constants/text_strings.dart';
import 'package:get/get.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  const HomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UserController()); // Retrieve existing instance
    return Container(
      child: TAppBar(
        showBackground: true,
        title: Container(
          child: RefreshIndicator(
            onRefresh: () async {
              print('sdadsadaadasdad');
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  TTexts.homeAppbarTitle,
                  style: Theme.of(context)
                      .textTheme
                      .labelMedium!
                      .apply(color: TColors.grey),
                ),
                Obx(() {
                  if (controller.profileLoading.value) {
                    return const ShimmerEffect(width: 80, height: 15);
                  } else {
                    return Text(
                      controller.user.value.fullName,
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall!
                          .apply(color: TColors.white),
                    );
                  }
                }),
              ],
            ),
          ),
        ),
        actions: [
          CartCounterIcon(
            onPressed: () {
              Get.to(() => CartScreen());
            },
            iconColor: TColors.white,
          )
        ],
      ),
    );
  }
}
