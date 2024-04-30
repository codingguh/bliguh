import 'package:bliguh/common/widgets/appbar/appbar.dart';
import 'package:bliguh/common/widgets/layouts/grid_layout.dart';
import 'package:bliguh/common/widgets/texts/section_heading.dart';
import 'package:bliguh/features/shop/screens/brand/brand_products.dart';
import 'package:bliguh/features/shop/screens/store/widgets/featured_brands.dart';
import 'package:bliguh/utils/constants/image_strings.dart';
import 'package:bliguh/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AllBrandsScreen extends StatelessWidget {
  const AllBrandsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(
        showBackArrow: true,
        title: Text('All Brands'),
        isCenter: true,
        onTap: () {
          Get.back();
        },
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              SectionHeading(
                title: 'Brands',
                showActionButton: false,
              ),
              SizedBox(
                height: TSizes.spaceBtwItems,
              ),
              GridLayout(
                  itemCount: 10,
                  mainAxisExtent: 60,
                  itemBuilder: (context, index) => BrandCards(
                      showBorder: true,
                      image: TImages.adidasLogo,
                      brand: 'Adidas',
                      onTap: () {
                        Get.to(() => BrandProducts());
                      },
                      total: 10))
            ],
          ),
        ),
      ),
    );
  }
}
