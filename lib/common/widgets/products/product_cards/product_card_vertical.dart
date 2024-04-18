import 'package:ecommerce_firebase_getx/common/styles/shadows.dart';
import 'package:ecommerce_firebase_getx/common/widgets/badge/badge.dart';
import 'package:ecommerce_firebase_getx/common/widgets/buttons/button_add_to_cart.dart';
import 'package:ecommerce_firebase_getx/common/widgets/containers/RoundedContainer.dart';
import 'package:ecommerce_firebase_getx/common/widgets/icons/circular_icon.dart';
import 'package:ecommerce_firebase_getx/common/widgets/images/rounded_image.dart';
import 'package:ecommerce_firebase_getx/common/widgets/texts/brand_icon_verify.dart';
import 'package:ecommerce_firebase_getx/common/widgets/texts/price_text.dart';
import 'package:ecommerce_firebase_getx/common/widgets/texts/price_text_discount.dart';
import 'package:ecommerce_firebase_getx/common/widgets/texts/product_title_text.dart';
import 'package:ecommerce_firebase_getx/features/shop/screens/cart/cart.dart';
import 'package:ecommerce_firebase_getx/features/shop/screens/favourite/controllers/favourite_controller.dart';
import 'package:ecommerce_firebase_getx/features/shop/screens/product_details/product_detail.dart';
import 'package:ecommerce_firebase_getx/utils/constants/colors.dart';
import 'package:ecommerce_firebase_getx/utils/constants/image_strings.dart';
import 'package:ecommerce_firebase_getx/utils/constants/sizes.dart';
import 'package:ecommerce_firebase_getx/utils/formatters/idr_formatter.dart';
import 'package:ecommerce_firebase_getx/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class ProductCardVertical extends StatelessWidget {
  const ProductCardVertical(
      {super.key,
      this.title = 'Product 1',
      this.imageUrl = TImages.acerlogo,
      this.price = 2000,
      required this.brand,
      this.isDiscount = false,
      this.isFavourite = false,
      this.showButtonCart = true,
      this.discount = 0,
      this.onPressed});

  final String title, imageUrl, brand;
  final bool isDiscount, isFavourite, showButtonCart;
  // final double price;
  final int discount, price;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    double discountPrice = price - (price * discount / 100);
    final FavouriteController controller =
        Get.put<FavouriteController>(FavouriteController());

    String formattedDiscountPrice = formatPriceIDR(discountPrice);
    String formattedPrice = formatPriceIDR(price);

    final dark = THelperFunctions.isDarkMode(context);

    return Container(
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
          ///Thumbnail
          GestureDetector(
            onTap: () {
              Get.to(() => const ProductDetailScreen());
            },
            child: RoundedContainer(
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
                    child: isDiscount ? TBadge(label: discount) : SizedBox(),
                  ),

                  ///Favorite icon button
                  Positioned(
                    top: 0,
                    right: 0,
                    child: isFavourite
                        ? CircularIcon(
                            icon: Iconsax.heart5,
                            overlayColor: Colors.red,
                            backgroundColor: Colors.white,
                            onPressed: onPressed,
                            size: TSizes.lg,
                            padding: 6,
                          )
                        : CircularIcon(
                            icon: Iconsax.heart,
                            onPressed: onPressed,
                            padding: 6,
                            backgroundColor: Colors.white,
                          ),
                  )
                ],
              ),
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
                              PriceTextDiscount(formattedPrice: formattedPrice),
                              PriceText(formattedPrice: formattedDiscountPrice)
                            ],
                          )
                        : PriceText(formattedPrice: formattedPrice),
                    //Add to cart button
                    if (showButtonCart)
                      ButtonAddToCart(
                        onTap: () {
                          Get.to(() => const CartScreen());
                        },
                      )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
