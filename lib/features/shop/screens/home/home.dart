import 'package:ecommerce_firebase_getx/common/widgets/custom_shapes/containers/search_container.dart';
import 'package:ecommerce_firebase_getx/common/widgets/images_text_widget/custom_image_text.dart';
import 'package:ecommerce_firebase_getx/common/widgets/texts/section_heading.dart';
import 'package:ecommerce_firebase_getx/features/shop/screens/home/widgets/home_categories.dart';
import 'package:ecommerce_firebase_getx/utils/constants/colors.dart';
import 'package:ecommerce_firebase_getx/utils/constants/image_strings.dart';
import 'package:ecommerce_firebase_getx/utils/constants/sizes.dart';
import 'package:ecommerce_firebase_getx/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_firebase_getx/features/shop/screens/home/widgets/home_appbar.dart';
import 'package:ecommerce_firebase_getx/common/widgets/custom_shapes/containers/primary_header_container.dart';

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
                    height: TSizes.spaceBtwSections,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: TSizes.defaultSpace),
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
                        HomeCategories()
                      ],
                    ),
                  ),

                  ///Categories -- Tutorial [Section#3 Video #2]
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
