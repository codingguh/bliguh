import 'package:ecommerce_firebase_getx/common/widgets/appbar/appbar.dart';
import 'package:ecommerce_firebase_getx/common/widgets/custom_shapes/containers/circular_container.dart';
import 'package:ecommerce_firebase_getx/common/widgets/custom_shapes/containers/search_container.dart';
import 'package:ecommerce_firebase_getx/common/widgets/images/rounded_image.dart';
import 'package:ecommerce_firebase_getx/common/widgets/layouts/grid_layout.dart';
import 'package:ecommerce_firebase_getx/common/widgets/products/cart/cart_menu_icon.dart';
import 'package:ecommerce_firebase_getx/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:ecommerce_firebase_getx/common/widgets/texts/section_heading.dart';
import 'package:ecommerce_firebase_getx/data/dummy_data.dart';
import 'package:ecommerce_firebase_getx/features/shop/screens/home/widgets/frame_slider.dart';
import 'package:ecommerce_firebase_getx/features/shop/screens/home/widgets/home_categories.dart';
import 'package:ecommerce_firebase_getx/utils/constants/colors.dart';
import 'package:ecommerce_firebase_getx/utils/constants/image_strings.dart';
import 'package:ecommerce_firebase_getx/utils/constants/sizes.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce_firebase_getx/utils/constants/text_strings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_firebase_getx/features/shop/screens/home/widgets/home_appbar.dart';
import 'package:ecommerce_firebase_getx/common/widgets/custom_shapes/containers/primary_header_container.dart';
import 'package:flutter/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HomeAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            PrimaryHeaderContainer(
              child: Column(
                children: [
                  ///Header -- Tutorial [Section#3 Video #2]
                  const SizedBox(
                    height: TSizes.spaceBtwItems,
                  ),

                  ///Searchbar -- Tutorial [Section#3 Video #2]
                  SearchContainer(
                    text: 'Search in Store ',
                    height: 41,
                  ),
                  const SizedBox(
                    height: TSizes.spaceBtwItems + 5,
                  ),

                  ///Banner
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: TSizes.defaultSpace),
                    child: FrameSlider(
                      banners: banners,
                    ),
                  ),

                  const SizedBox(
                    height: TSizes.spaceBtwSections - 13,
                  ),

                  ///Categories -- Tutorial [Section#3 Video #2]
                  Padding(
                    padding: EdgeInsets.only(
                        left: TSizes.defaultSpace, right: TSizes.defaultSpace),
                    child: Column(
                      children: [
                        SectionHeading(
                          title: 'Popular Categories',
                          showActionButton: false,
                          textColor: Colors.white,
                        ),
                        const SizedBox(
                          height: TSizes.spaceBtwItems - 5,
                        ),
                        HomeCategories(
                          categories: categories,
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            // Text('dfsdfdsfsdf'),

            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 10,
              ),
              child: Column(
                children: [
                  GridLayout(
                    itemCount: products.length,
                    itemBuilder: (_, index) {
                      final product = products[index];
                      return ProductCardVertical(
                        imageUrl: product['image'],
                        title: product['title'],
                        price: product['price'],
                        brand: product['brand'],
                        isDiscount: product['isDiscount'],
                        isFavourite: product['isFavourite'],
                        discount: product['discount'],
                      );
                    },
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
