import 'package:bliguh/common/widgets/texts/product_title_text.dart';
import 'package:bliguh/utils/constants/colors.dart';
import 'package:bliguh/utils/constants/enums.dart';
import 'package:bliguh/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class BrandIconWithVerifyIcon extends StatelessWidget {
  const BrandIconWithVerifyIcon({
    super.key,
    required this.brand,
    this.maxLines = 1,
    this.textColor,
    this.iconColor = TColors.primary,
    this.textAlign = TextAlign.center,
    this.brandTextSize = TextSizes.small,
  });

  final String brand;
  final int maxLines;
  final Color? textColor, iconColor;
  final TextAlign? textAlign;
  final TextSizes brandTextSize;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Flexible(
          child: ProductTitleText(
            title: brand,
            color: textColor,
            maxLines: maxLines,
            textAlign: textAlign,
            brandTextSizes: brandTextSize,
          ),
        ),
        const SizedBox(
          height: TSizes.xs,
        ),
        const Icon(
          Iconsax.verify5,
          color: TColors.primary,
          size: TSizes.iconXs,
        )
      ],
    );
  }
}
