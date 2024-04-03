import 'package:ecommerce_firebase_getx/common/styles/shadows.dart';
import 'package:ecommerce_firebase_getx/common/widgets/containers/RoundedContainer.dart';
import 'package:ecommerce_firebase_getx/common/widgets/icons/circular_icon.dart';
import 'package:ecommerce_firebase_getx/common/widgets/images/rounded_image.dart';
import 'package:ecommerce_firebase_getx/common/widgets/texts/brand_icon_verify.dart';
import 'package:ecommerce_firebase_getx/common/widgets/texts/product_title_text.dart';
import 'package:ecommerce_firebase_getx/utils/constants/colors.dart';
import 'package:ecommerce_firebase_getx/utils/constants/sizes.dart';
import 'package:ecommerce_firebase_getx/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:intl/intl.dart';

class ProductCardVertical extends StatelessWidget {
  const ProductCardVertical(
      {super.key,
      required this.title,
      required this.imageUrl,
      required this.price,
      required this.brand,
      this.isDiscount = false,
      this.isFavourite = false,
      required this.discount});

  final String title, imageUrl, brand;
  final bool isDiscount, isFavourite;
  // final double price;
  final int discount, price;

  @override
  Widget build(BuildContext context) {
    double discountPrice = price - (price * discount / 100);

    String formattedDiscountPrice =
        NumberFormat.currency(locale: 'id_ID', symbol: 'Rp.', decimalDigits: 0)
            .format(discountPrice);
    String formattedPrice =
        NumberFormat.currency(locale: 'id_ID', symbol: 'Rp.', decimalDigits: 0)
            .format(price);

    final dark = THelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: () {},
      child: Container(
        width: 180,
        padding: const EdgeInsets.all(1),
        decoration: BoxDecoration(
            boxShadow: [ShadowStyle.verticalProductShadow],
            borderRadius: BorderRadius.circular(TSizes.productImageRadius),
            color: dark ? TColors.darkGrey : TColors.white),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            RoundedContainer(
              height: 188,
              padding: EdgeInsets.all(TSizes.sm),
              backgroundColor: dark ? TColors.dark : TColors.light,
              child: Stack(
                alignment: Alignment.bottomLeft,
                children: [
                  ///Thumbnail Image
                  RoundedImage(
                    imageUrl: imageUrl,
                    backgroundColor: dark ? TColors.dark : TColors.light,
                    applyImageRadius: false,
                    fit: BoxFit.fitHeight,
                  ),

                  ///Sale Tag
                  Positioned(
                    top: 12,
                    child: isDiscount
                        ? RoundedContainer(
                            radius: TSizes.sm,
                            padding: const EdgeInsets.symmetric(
                                vertical: TSizes.xs, horizontal: TSizes.xs),
                            backgroundColor: TColors.secondary.withOpacity(0.8),
                            child: SizedBox(
                              width: 30,
                              child: Center(
                                child: Text(
                                  '$discount%',
                                  style: Theme.of(context)
                                      .textTheme
                                      .labelMedium!
                                      .apply(
                                        color: TColors.black,
                                      ),
                                ),
                              ),
                            ))
                        : SizedBox(),
                  ),

                  ///Favorite card widget
                  Positioned(
                    top: 0,
                    right: 0,
                    child: isFavourite
                        ? CircularIcon(
                            icon: Iconsax.heart5,
                            color: Colors.red,
                          )
                        : CircularIcon(
                            icon: Iconsax.heart,
                          ),
                  )
                ],
              ),
            ),
            // const SizedBox(
            //   height: TSizes.spaceBtwItems / 2,
            // ),

            ///Details
            Container(
              padding: EdgeInsets.only(left: TSizes.sm),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,

                // mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  ProductTitleText(
                    title: title,
                    smallSize: true,
                  ),
                  BrandIconWithVerifyIcon(brand: brand),
                  const SizedBox(
                    height: TSizes.spaceBtwItems / 2,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      isDiscount
                          ? Column(
                              children: [
                                Text(
                                  '$formattedPrice',
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                  style: Theme.of(context)
                                      .textTheme
                                      .labelSmall!
                                      .copyWith(
                                          fontWeight: FontWeight.bold,
                                          decoration:
                                              TextDecoration.lineThrough,
                                          color: Colors.grey),
                                ),
                                Text(
                                  '$formattedDiscountPrice',
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                  style: Theme.of(context)
                                      .textTheme
                                      .labelLarge!
                                      .copyWith(fontWeight: FontWeight.bold),
                                )
                              ],
                            )
                          : Text(
                              '$formattedPrice',
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              style: Theme.of(context)
                                  .textTheme
                                  .labelLarge!
                                  .copyWith(fontWeight: FontWeight.bold),
                            ),
                      Container(
                        decoration: BoxDecoration(
                            color: TColors.dark,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(TSizes.cardRadiusMd),
                              bottomRight: Radius.circular(TSizes.cardRadiusMd),
                            )),
                        child: SizedBox(
                          width: TSizes.iconLg * 1.2,
                          height: TSizes.iconLg * 1.2,
                          child: Center(
                            child: Icon(
                              Iconsax.add,
                              color: TColors.white,
                            ),
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
