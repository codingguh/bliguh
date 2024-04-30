import 'package:bliguh/common/widgets/shimmer/shimmer_effect.dart';
import 'package:bliguh/features/personalization/controllers/user_controller.dart';
import 'package:bliguh/features/shop/screens/cart/cart.dart';
import 'package:flutter/material.dart';
import 'package:bliguh/common/widgets/appbar/appbar.dart';
import 'package:bliguh/common/widgets/products/cart/cart_menu_icon.dart';
import 'package:bliguh/utils/constants/colors.dart';
import 'package:bliguh/utils/constants/text_strings.dart';
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
