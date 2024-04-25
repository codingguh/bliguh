import 'package:ecommerce_firebase_getx/common/widgets/custom_shapes/containers/search_container.dart';
import 'package:ecommerce_firebase_getx/common/widgets/texts/section_heading.dart';
import 'package:ecommerce_firebase_getx/data/dummy_data.dart';
import 'package:ecommerce_firebase_getx/features/shop/screens/home/widgets/frame_slider.dart';
import 'package:ecommerce_firebase_getx/features/shop/screens/home/widgets/home_categories.dart';
import 'package:ecommerce_firebase_getx/features/shop/screens/home/widgets/home_recommendation_products.dart';
import 'package:ecommerce_firebase_getx/features/shop/screens/home/widgets/home_recommendation_text.dart';
import 'package:ecommerce_firebase_getx/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_firebase_getx/features/shop/screens/home/widgets/home_appbar.dart';
import 'package:ecommerce_firebase_getx/common/widgets/custom_shapes/containers/primary_header_container.dart';

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
                    height: 40,
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
                        left: TSizes.defaultSpace,
                        right: TSizes.defaultSpace,
                        bottom: TSizes.sm),
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

            ///view all products
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 10,
              ),
              child: Column(
                children: [
                  Rekomendasi(),
                  const SizedBox(
                    height: TSizes.xs,
                  ),
                  ProdukRekomendasi(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
