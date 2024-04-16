import 'package:ecommerce_firebase_getx/common/widgets/appbar/appbar.dart';
import 'package:ecommerce_firebase_getx/common/widgets/appbar/tabbar.dart';
import 'package:ecommerce_firebase_getx/common/widgets/custom_shapes/containers/search_container.dart';
import 'package:ecommerce_firebase_getx/common/widgets/layouts/grid_layout.dart';
import 'package:ecommerce_firebase_getx/common/widgets/texts/section_heading.dart';
import 'package:ecommerce_firebase_getx/data/dummy_data.dart';
import 'package:ecommerce_firebase_getx/features/shop/screens/purchases/widgets/orders_tab.dart';
import 'package:ecommerce_firebase_getx/features/shop/screens/store/widgets/featured_brands.dart';
import 'package:ecommerce_firebase_getx/utils/constants/colors.dart';
import 'package:ecommerce_firebase_getx/utils/constants/sizes.dart';
import 'package:ecommerce_firebase_getx/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({super.key});

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  @override
  Widget build(BuildContext context) {
    final bool dark = THelperFunctions.isDarkMode(context);
    return DefaultTabController(
        length: 6,
        child: Scaffold(
            appBar: TAppBar(
              title: Text('My Orders'),
              showBackArrow: true,
              isCenter: true,
              showBackground: true,
              bgColor: Colors.white,
            ),
            body: NestedScrollView(
              headerSliverBuilder: (_, innerBoxIsScrolled) {
                return [
                  SliverAppBar(
                    automaticallyImplyLeading: false,
                    pinned: true,
                    floating: true,
                    backgroundColor: dark ? TColors.black : TColors.white,
                    expandedHeight: 10,
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
                            onPressed: () {},
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
                        child: Text('To Pay'),
                      ),
                      Tab(
                        child: Text('To Ship'),
                      ),
                      Tab(
                        child: Text('To Received'),
                      ),
                      Tab(
                        child: Text('Completed'),
                      ),
                      Tab(
                        child: Text('Cancelled'),
                      ),
                      Tab(
                        child: Text('Cosmetics'),
                      ),
                    ]),
                  )
                ];
              },
              body: TabBarView(children: [
                OrderTab(
                  child: Text('Screen 1'),
                ),
                OrderTab(
                  child: Text('Screen 2'),
                ),
                OrderTab(
                  child: Text('Screen 3'),
                ),
                OrderTab(
                  child: Text('Screen 4'),
                ),
                OrderTab(
                  child: Text('Screen 5'),
                ),
                OrderTab(
                  child: Text('Screen 6'),
                ),

                // CategoryTab(),
                // CategoryTab(),
                // CategoryTab(),
                // CategoryTab(),
              ]),
            )));
  }
}
