import 'package:bliguh/common/styles/shadows.dart';
import 'package:bliguh/common/widgets/containers/RoundedContainer.dart';
import 'package:bliguh/common/widgets/icons/circular_icon.dart';
import 'package:bliguh/common/widgets/images/rounded_image.dart';
import 'package:bliguh/common/widgets/texts/brand_icon_verify.dart';
import 'package:bliguh/common/widgets/texts/product_title_text.dart';
import 'package:bliguh/utils/constants/colors.dart';
import 'package:bliguh/utils/constants/image_strings.dart';
import 'package:bliguh/utils/constants/sizes.dart';
import 'package:bliguh/utils/helpers/helper_functions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:iconsax/iconsax.dart';

class ProductCardHorizontal extends StatelessWidget {
  const ProductCardHorizontal({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Container(
      width: 320,
      padding: const EdgeInsets.all(1),
      decoration: BoxDecoration(
          boxShadow: [ShadowStyle.verticalProductShadow],
          borderRadius: BorderRadius.circular(TSizes.productImageRadius),
          color: dark ? TColors.darkGrey : TColors.white),
      child: Row(
        children: [
          RoundedContainer(
            height: 120,
            padding: EdgeInsets.all(TSizes.sm),
            backgroundColor: dark ? TColors.dark : TColors.light,
            child: Stack(
              children: [
                SizedBox(
                  width: 110,
                  height: 120,
                  child: RoundedImage(
                    imageUrl: TImages.productImage1,
                    applyImageRadius: true,
                  ),
                ),

                ///sale tag
                Positioned(
                    top: 12,
                    child: RoundedContainer(
                        radius: TSizes.sm,
                        padding: EdgeInsets.symmetric(
                            horizontal: TSizes.sm, vertical: TSizes.xs),
                        child: Text(
                          '35%',
                          style: Theme.of(context).textTheme.labelLarge!.apply(
                                color: TColors.black,
                              ),
                        ))),
                Positioned(
                    child: CircularIcon(
                  icon: Iconsax.heart5,
                  color: Colors.red,
                ))
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: TSizes.sm, left: TSizes.sm),
            child: Column(
              children: [
                const Column(
                  children: [
                    ProductTitleText(
                      title: 'Green Nike Half sleeve shirts',
                      smallSize: true,
                    ),
                    SizedBox(height: TSizes.spaceBtwItems / 2),
                    BrandIconWithVerifyIcon(brand: 'Nike')
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
