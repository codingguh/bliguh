import 'package:bliguh/common/widgets/appbar/appbar.dart';
import 'package:bliguh/common/widgets/appbar/tabbar.dart';
import 'package:bliguh/common/widgets/custom_shapes/containers/search_container.dart';
import 'package:bliguh/common/widgets/layouts/grid_layout.dart';
import 'package:bliguh/common/widgets/products/cart/cart_menu_icon.dart';
import 'package:bliguh/common/widgets/texts/section_heading.dart';
import 'package:bliguh/data/dummy_data.dart';
import 'package:bliguh/features/shop/controllers/category_controller.dart';
import 'package:bliguh/features/shop/screens/brand/all_brands.dart';
import 'package:bliguh/features/shop/screens/store/widgets/category_tab.dart';
import 'package:bliguh/features/shop/screens/store/widgets/featured_brands.dart';
import 'package:bliguh/utils/constants/colors.dart';
import 'package:bliguh/utils/constants/sizes.dart';
import 'package:bliguh/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final bool dark = THelperFunctions.isDarkMode(context);
    final categories = CategoryController.instance.featuredCategories;
    return DefaultTabController(
        length: categories.length,
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
                      bottom: TTabBar(
                          tabs: categories
                              .map((cat) => Tab(child: Text(cat.name)))
                              .toList()))
                ];
              },
              body: TabBarView(
                  children: categories
                      .map((category) => CategoryTab(category: category))
                      .toList()),
            )));
  }
}
