import 'package:bliguh/common/widgets/appbar/appbar.dart';
import 'package:bliguh/common/widgets/images/rounded_image.dart';
import 'package:bliguh/common/widgets/products/product_cards/product_card_horizontal.dart';
import 'package:bliguh/common/widgets/texts/section_heading.dart';
import 'package:bliguh/utils/constants/image_strings.dart';
import 'package:bliguh/utils/constants/sizes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SubCategories extends StatelessWidget {
  const SubCategories({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(
        title: Text('Sports Shirts'),
        showBackArrow: true,
        onTap: () {
          Get.back();
        },
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              RoundedImage(
                width: double.infinity,
                height: 140,
                imageUrl: TImages.promoBanner1,
                applyImageRadius: true,
              ),
              const SizedBox(
                height: TSizes.spaceBtwSections,
              ),

              /// Sub Categoies
              Column(
                children: [
                  SectionHeading(
                    title: 'Sports shirts',
                    onPressed: () {},
                  ),
                  const SizedBox(
                    height: TSizes.spaceBtwSections / 2,
                  ),
                  SizedBox(
                    height: 120,
                    child: ListView.separated(
                        itemCount: 4,
                        separatorBuilder: (context, index) => const SizedBox(
                              width: TSizes.spaceBtwItems,
                            ),
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) =>
                            const ProductCardHorizontal()),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
