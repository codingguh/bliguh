import 'package:ecommerce_firebase_getx/common/widgets/containers/RoundedContainer.dart';
import 'package:ecommerce_firebase_getx/common/widgets/texts/price_text.dart';
import 'package:ecommerce_firebase_getx/common/widgets/texts/price_text_discount.dart';
import 'package:ecommerce_firebase_getx/common/widgets/texts/product_title_text.dart';
import 'package:ecommerce_firebase_getx/common/widgets/texts/section_heading.dart';
import 'package:ecommerce_firebase_getx/utils/constants/colors.dart';
import 'package:ecommerce_firebase_getx/utils/constants/sizes.dart';
import 'package:ecommerce_firebase_getx/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class ProductAttributes extends StatelessWidget {
  const ProductAttributes({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Column(
      children: [
        /// -- Selected Attribute Pricing & Description
        RoundedContainer(
          padding: const EdgeInsets.all(TSizes.md),
          backgroundColor: dark ? TColors.darkerGrey : TColors.grey,
          child: Column(
            children: [
              /// Title,Price and Stock status
              Row(
                children: [
                  SectionHeading(
                    title: 'Variation',
                    showActionButton: false,
                  ),
                  SizedBox(
                    width: TSizes.spaceBtwItems,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          //Sale Price
                          PriceTextDiscount(formattedPrice: 'Rp200.000'),
                          SizedBox(
                            width: 3,
                          ),
                          PriceText(formattedPrice: 'Rp200.000'),
                        ],
                      ),
                      Row(
                        children: [
                          ProductTitleText(
                            title: 'Stock ',
                            smallSize: true,
                          ),
                          PriceText(formattedPrice: '10.000'),
                        ],
                      ),
                    ],
                  ),

                  /// Stock
                ],
              ),

              ///Variation Description
              ProductTitleText(
                title:
                    'This is the Description of the Product and it can go upto max a lines',
                smallSize: true,
                maxLines: 4,
              )

              ///Stock
            ],
          ),
        )
      ],
    );
  }
}
