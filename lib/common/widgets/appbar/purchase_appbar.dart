import 'package:ecommerce_firebase_getx/common/widgets/custom_shapes/containers/circular_container.dart';
import 'package:ecommerce_firebase_getx/utils/constants/colors.dart';
import 'package:ecommerce_firebase_getx/utils/device/device_utility.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class PurchaseAppBar extends StatelessWidget implements PreferredSizeWidget {
  const PurchaseAppBar(
      {Key? key,
      this.title,
      this.showBackArrow = false,
      this.showBackground = false,
      this.leadingIcon,
      this.actions,
      this.isCenter = false,
      this.leadingOnPressed,
      this.bgColor = TColors.primary,
      this.onTap,
      required this.bottom})
      : super(key: key);

  final Widget? title;
  final bool showBackArrow, showBackground, isCenter;
  final Color bgColor;
  final IconData? leadingIcon;
  final List<Widget>? actions;
  final VoidCallback? leadingOnPressed, onTap;
  final PreferredSize bottom;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: showBackground ? bgColor : Colors.transparent,
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
          AppBar(
            titleSpacing: isCenter ? 0 : 10,
            automaticallyImplyLeading: false,
            centerTitle: isCenter ? true : false,
            leading: showBackArrow
                ? IconButton(
                    onPressed: onTap,
                    icon: Icon(
                      Iconsax.arrow_left,
                      color: const Color.fromARGB(255, 38, 69, 225),
                    ),
                  )
                : leadingIcon != null
                    ? IconButton(
                        onPressed: leadingOnPressed,
                        icon: Icon(leadingIcon),
                      )
                    : null,
            title:
                title, // Jika isCenter bernilai false, title akan ditampilkan sesuai posisi awalnya
            actions: actions,
            bottom: bottom,
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(TDeviceUtils.getAppBarHeight());
}
