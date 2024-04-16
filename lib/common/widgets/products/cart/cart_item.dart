import 'package:ecommerce_firebase_getx/common/widgets/images/rounded_image.dart';
import 'package:ecommerce_firebase_getx/common/widgets/texts/brand_icon_verify.dart';
import 'package:ecommerce_firebase_getx/common/widgets/texts/product_title_text.dart';
import 'package:ecommerce_firebase_getx/utils/constants/colors.dart';
import 'package:ecommerce_firebase_getx/utils/constants/sizes.dart';
import 'package:ecommerce_firebase_getx/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class CartItem extends StatelessWidget {
  const CartItem(
      {super.key,
      required this.width,
      required this.height,
      this.showBrand = true,
      required this.title,
      required this.image,
      required this.isBold});

  final double width, height;
  final bool showBrand, isBold;
  final String title, image;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ///Image
        RoundedImage(
          imageUrl: image,
          width: 40,
          height: 40,
          fit: BoxFit.fitWidth,
          padding: EdgeInsets.all(TSizes.md),
          backgroundColor: THelperFunctions.isDarkMode(context)
              ? TColors.darkGrey
              : TColors.light,
        ),
        const SizedBox(
          width: TSizes.spaceBtwItems,
        ),

        /// Tittle, Price & Size
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (showBrand) BrandIconWithVerifyIcon(brand: 'Nike'),
              Flexible(
                child: ProductTitleText(
                  title: title,
                  maxLines: 1,
                  isBold: isBold,
                ),
              ),

              /// Attributes
              Text.rich(TextSpan(children: [
                TextSpan(
                    text: 'Color ',
                    style: Theme.of(context).textTheme.bodySmall),
                TextSpan(
                    text: 'Green ',
                    style: Theme.of(context).textTheme.bodySmall),
                TextSpan(
                    text: 'Size ',
                    style: Theme.of(context).textTheme.bodySmall),
                TextSpan(
                    text: 'UK 08 ',
                    style: Theme.of(context).textTheme.bodySmall)
              ]))
            ],
          ),
        )
      ],
    );
  }
}
