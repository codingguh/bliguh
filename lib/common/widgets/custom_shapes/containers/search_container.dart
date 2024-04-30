import 'package:bliguh/utils/constants/colors.dart';
import 'package:bliguh/utils/constants/sizes.dart';
import 'package:bliguh/utils/device/device_utility.dart';
import 'package:bliguh/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class SearchContainer extends StatelessWidget {
  const SearchContainer(
      {super.key,
      required this.text,
      this.icon = Iconsax.search_normal,
      this.prefixIcon = Iconsax.camera,
      this.showBackground = true,
      this.showBorder = true,
      this.showPrefixIcon = false,
      this.onTap,
      this.height = 45,
      this.fullWidth = false,
      this.padding =
          const EdgeInsets.symmetric(horizontal: TSizes.defaultSpace)});

  final String text;
  final IconData? icon, prefixIcon;
  final bool showBackground, showBorder, showPrefixIcon, fullWidth;
  final VoidCallback? onTap;
  final double height;
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    final darkMode = THelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: padding,
        child: Container(
          width: fullWidth
              ? double.infinity
              : TDeviceUtils.getScreenWidth(context),
          height: height,
          padding: const EdgeInsets.all(TSizes.sm),
          decoration: BoxDecoration(
              color: showBackground
                  ? darkMode
                      ? TColors.dark
                      : TColors.light
                  : Colors.transparent,
              border: showBorder ? Border.all(color: TColors.grey) : null,
              borderRadius: BorderRadius.circular(TSizes.cardRadiusLg)),
          child: Row(
            children: [
              const SizedBox(
                width: 5,
              ),
              Icon(
                size: 16,
                icon,
                color: TColors.darkGrey,
              ),
              const SizedBox(
                width: TSizes.spaceBtwItems,
              ),
              Text(
                text,
                style: Theme.of(context)
                    .textTheme
                    .bodySmall!
                    .copyWith(fontSize: 16),
              ),
              Spacer(),
              InkWell(
                onTap: () {},
                child: Icon(
                  size: 19,
                  prefixIcon,
                  color: TColors.darkGrey,
                ),
              ),
              const SizedBox(
                width: 5,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
