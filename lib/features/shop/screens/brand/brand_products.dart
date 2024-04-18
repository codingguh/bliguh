import 'package:ecommerce_firebase_getx/common/widgets/appbar/appbar.dart';
import 'package:ecommerce_firebase_getx/common/widgets/layouts/grid_layout.dart';
import 'package:ecommerce_firebase_getx/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:ecommerce_firebase_getx/features/shop/screens/store/widgets/featured_brands.dart';
import 'package:ecommerce_firebase_getx/utils/constants/image_strings.dart';
import 'package:ecommerce_firebase_getx/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class BrandProducts extends StatelessWidget {
  const BrandProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(
        title: Padding(
          padding: EdgeInsets.only(left: TSizes.defaultSpace),
          child: Text('Nike'),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: TSizes.md),
            child: GestureDetector(
              child: Icon(Iconsax.close_circle),
              onTap: () {
                Get.back();
              },
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              BrandCards(
                showBorder: true,
              ),
              SizedBox(
                height: TSizes.spaceBtwItems,
              ),
              GridLayout(
                  itemCount: 10,
                  itemBuilder: (context, index) => ProductCardVertical(
                        brand: 'Adidas',
                        imageUrl: TImages.productImage1,
                      ))
            ],
          ),
        ),
      ),
    );
  }
}
