import 'package:ecommerce_firebase_getx/common/widgets/appbar/appbar.dart';
import 'package:ecommerce_firebase_getx/common/widgets/layouts/grid_layout.dart';
import 'package:ecommerce_firebase_getx/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:ecommerce_firebase_getx/features/shop/screens/search_products/widgets/box_filters.dart';
import 'package:ecommerce_firebase_getx/features/shop/screens/search_products/widgets/drawer_widget.dart';
import 'package:ecommerce_firebase_getx/features/shop/screens/search_products/widgets/filter_by_rating.dart';
import 'package:ecommerce_firebase_getx/utils/constants/colors.dart';
import 'package:ecommerce_firebase_getx/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class SearchProductScreen extends StatelessWidget {
  const SearchProductScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
    return Scaffold(
      key: _scaffoldKey,
      appBar: TAppBar(
        title: Text('Search Product'),
        showBackArrow: true,
        onTap: () {
          Get.back();
        },
        isCenter: true,
        actions: [
          GestureDetector(
            onTap: () {
              _scaffoldKey.currentState?.openEndDrawer();
            },
            child: Icon(Iconsax.filter),
          ),
          SizedBox(
            width: 12,
          )
        ],
      ),
      endDrawer: DrawerWidget(),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              GridLayout(
                  itemCount: 5,
                  itemBuilder: (_, index) => ProductCardVertical(
                        brand: 'Adidas',
                      ))
            ],
          ),
        ),
      ),
    );
  }
}
