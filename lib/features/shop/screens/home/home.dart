import 'package:ecommerce_firebase_getx/common/widgets/custom_shapes/containers/circular_container.dart';
import 'package:ecommerce_firebase_getx/common/widgets/custom_shapes/containers/search_container.dart';
import 'package:ecommerce_firebase_getx/common/widgets/images/rounded_image.dart';
import 'package:ecommerce_firebase_getx/common/widgets/texts/section_heading.dart';
import 'package:ecommerce_firebase_getx/features/shop/screens/home/widgets/frame_slider.dart';
import 'package:ecommerce_firebase_getx/features/shop/screens/home/widgets/home_categories.dart';
import 'package:ecommerce_firebase_getx/utils/constants/image_strings.dart';
import 'package:ecommerce_firebase_getx/utils/constants/sizes.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_firebase_getx/features/shop/screens/home/widgets/home_appbar.dart';
import 'package:ecommerce_firebase_getx/common/widgets/custom_shapes/containers/primary_header_container.dart';
import 'package:flutter/widgets.dart';

final List<Map<String, dynamic>> categories = [
  {'image': TImages.jeweleryIcon, 'title': 'Jewelry'},
  {'image': TImages.sportIcon, 'title': 'Sports'},
  {'image': TImages.electronicsIcon, 'title': 'Electronics'},
  {'image': TImages.furnitureIcon, 'title': 'Furniture'},
  {'image': TImages.shoeIcon, 'title': 'Shoes'},
  {'image': TImages.clothIcon, 'title': 'Clothes'},
  {'image': TImages.cosmeticsIcon, 'title': 'Cosmetics'},
  {'image': TImages.toyIcon, 'title': 'Toys'},
  {'image': TImages.animalIcon, 'title': 'Animals'},
  // Add more categories as needed
];

final List<String> banners = [
  TImages.banner1,
  TImages.banner3,
  TImages.banner4,
  TImages.banner2,
];

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            PrimaryHeaderContainer(
              child: Column(
                children: [
                  ///Header -- Tutorial [Section#3 Video #2]
                  const HomeAppBar(),
                  const SizedBox(
                    height: TSizes.spaceBtwSections,
                  ),

                  ///Searchbar -- Tutorial [Section#3 Video #2]
                  SearchContainer(
                    text: 'Search in Store ',
                  ),
                  const SizedBox(
                    height: TSizes.spaceBtwSections - 9,
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
                    height: TSizes.spaceBtwSections,
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
                          height: TSizes.spaceBtwItems,
                        ),
                        HomeCategories(
                          categories: categories,
                        )
                      ],
                    ),
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
