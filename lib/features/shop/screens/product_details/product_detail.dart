import 'package:ecommerce_firebase_getx/features/shop/screens/product_details/widgets/product_attributes.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_firebase_getx/features/shop/screens/product_details/widgets/product_detail_images_slider.dart';
import 'package:ecommerce_firebase_getx/features/shop/screens/product_details/widgets/product_meta_data.dart';
import 'package:ecommerce_firebase_getx/features/shop/screens/product_details/widgets/rating_share_widget.dart';
import 'package:ecommerce_firebase_getx/utils/constants/sizes.dart';
import 'package:ecommerce_firebase_getx/utils/helpers/helper_functions.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            /// 1 - Product Image Slider
            ProductImageSlider(),

            /// 2 -Product Details
            Padding(
              padding: EdgeInsets.only(
                right: TSizes.defaultSpace,
                left: TSizes.defaultSpace,
                bottom: TSizes.defaultSpace,
              ),
              child: Column(
                children: [
                  /// - Rating & Share
                  RatingAndShare(),

                  /// - Price, Title,Stack, & brand
                  ProductMetaData(),

                  /// - Attributes
                  ProductAttributes()

                  /// - Checkout Button
                  /// - Description
                  /// - Reviews
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
