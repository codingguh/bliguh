import 'package:ecommerce_firebase_getx/common/widgets/appbar/appbar.dart';
import 'package:ecommerce_firebase_getx/common/widgets/appbar/tabbar.dart';
import 'package:ecommerce_firebase_getx/common/widgets/custom_shapes/containers/search_container.dart';
import 'package:ecommerce_firebase_getx/common/widgets/layouts/grid_layout.dart';
import 'package:ecommerce_firebase_getx/common/widgets/products/cart/cart_menu_icon.dart';
import 'package:ecommerce_firebase_getx/common/widgets/texts/section_heading.dart';
import 'package:ecommerce_firebase_getx/data/dummy_data.dart';
import 'package:ecommerce_firebase_getx/features/shop/screens/brand/all_brands.dart';
import 'package:ecommerce_firebase_getx/features/shop/screens/store/widgets/category_tab.dart';
import 'package:ecommerce_firebase_getx/features/shop/screens/store/widgets/featured_brands.dart';
import 'package:ecommerce_firebase_getx/utils/constants/colors.dart';
import 'package:ecommerce_firebase_getx/utils/constants/sizes.dart';
import 'package:ecommerce_firebase_getx/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final bool dark = THelperFunctions.isDarkMode(context);
    return DefaultTabController(
        length: 5,
        child: Scaffold(
            appBar: TAppBar(
              title: Text('Store'),
              actions: [
                CartCounterIcon(
                  onPressed: () {},
                  iconColor: Colors.black,
                )
              ],
            ),
            body: NestedScrollView(
              headerSliverBuilder: (_, innerBoxIsScrolled) {
                return [
                  SliverAppBar(
                    automaticallyImplyLeading: false,
                    pinned: true,
                    floating: true,
                    backgroundColor: dark ? TColors.black : TColors.white,
                    expandedHeight: 440,
                    flexibleSpace: Padding(
                      padding: EdgeInsets.all(TSizes.defaultSpace),
                      child: ListView(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        children: [
                          SizedBox(
                            height: TSizes.spaceBtwItems / 1.5,
                          ),
                          SearchContainer(
                            text: 'Search',
                            showBorder: true,
                            showBackground: false,
                            padding: EdgeInsets.zero,
                          ),
                          SizedBox(
                            height: TSizes.spaceBtwItems,
                          ),
                          SectionHeading(
                            title: 'Featured Brands',
                            showActionButton: true,
                            onPressed: () {
                              Get.to(AllBrandsScreen());
                            },
                          ),
                          SizedBox(
                            height: TSizes.spaceBtwItems / 1.5,
                          ),

                          ///Featured Brands
                          GridLayout(
                              padding: EdgeInsets.only(top: 20),
                              itemCount: featuredBrands.length,
                              mainAxisExtent: 80,
                              itemBuilder: (_, index) {
                                final featuredBrand = featuredBrands[index];
                                return BrandCards(
                                  image: featuredBrand['image'],
                                  brand: featuredBrand['brand'],
                                  total: featuredBrand['total'],
                                );
                              }),
                        ],
                      ),
                    ),
                    bottom: TTabBar(tabs: [
                      Tab(
                        child: Text('Sports'),
                      ),
                      Tab(
                        child: Text('Furniture'),
                      ),
                      Tab(
                        child: Text('Electronics'),
                      ),
                      Tab(
                        child: Text('Clothes'),
                      ),
                      Tab(
                        child: Text('Cosmetics'),
                      ),
                    ]),
                  )
                ];
              },
              body: TabBarView(children: [
                CategoryTab(),
                CategoryTab(),
                CategoryTab(),
                CategoryTab(),
                CategoryTab(),
              ]),
            )));
  }
}
