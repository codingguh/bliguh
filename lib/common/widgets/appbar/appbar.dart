import 'package:ecommerce_firebase_getx/common/widgets/custom_shapes/containers/circular_container.dart';
import 'package:ecommerce_firebase_getx/utils/constants/colors.dart';
import 'package:ecommerce_firebase_getx/utils/constants/sizes.dart';
import 'package:ecommerce_firebase_getx/utils/device/device_utility.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class TAppBar extends StatelessWidget implements PreferredSizeWidget {
  const TAppBar(
      {super.key,
      this.title,
      this.showBackArrow = false,
      this.showBackground = false,
      this.leadingIcon,
      this.actions,
      this.leadingOnPressed});

  final Widget? title;
  final bool showBackArrow, showBackground;
  final IconData? leadingIcon;
  final List<Widget>? actions;
  final VoidCallback? leadingOnPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: showBackground ? TColors.primary : Colors.transparent,
      child: Stack(
        children: [
          showBackground
              ? Positioned(
                  top: -20,
                  right: -150,
                  child: CircularContainer(
                    backgroundColor: TColors.textWhite.withOpacity(0.1),
                  ),
                )
              : SizedBox(),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: TSizes.md,
            ),
            child: AppBar(
              automaticallyImplyLeading: false,
              leading: showBackArrow
                  ? IconButton(
                      onPressed: () => Get.back(),
                      icon: Icon(Iconsax.arrow_left))
                  : leadingIcon != null
                      ? IconButton(
                          onPressed: leadingOnPressed, icon: Icon(leadingIcon))
                      : null,
              title: title,
              actions: actions,
            ),
          ),
        ],
      ),
    );
  }

  @override
  //TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(TDeviceUtils.getAppBarHeight());
}
