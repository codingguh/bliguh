import 'package:bliguh/common/widgets/chips/choice_chip.dart';
import 'package:bliguh/common/widgets/containers/RoundedContainer.dart';
import 'package:bliguh/common/widgets/texts/price_text.dart';
import 'package:bliguh/common/widgets/texts/price_text_discount.dart';
import 'package:bliguh/common/widgets/texts/product_title_text.dart';
import 'package:bliguh/common/widgets/texts/section_heading.dart';
import 'package:bliguh/utils/constants/colors.dart';
import 'package:bliguh/utils/constants/sizes.dart';
import 'package:bliguh/utils/helpers/helper_functions.dart';
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
        ),
        SizedBox(
          height: TSizes.spaceBtwItems,
        ),

        /// -- Attributes
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SectionHeading(
              title: 'Colors',
              showActionButton: false,
            ),
            SizedBox(
              height: TSizes.spaceBtwItems / 2,
            ),
            Wrap(
              spacing: 8,
              children: [
                TChoiceChip(
                  text: 'Green',
                  selected: false,
                  onSelected: (value) {
                    print(value);
                  },
                ),
                TChoiceChip(
                  text: 'Blue',
                  selected: true,
                  onSelected: (value) {},
                ),
                TChoiceChip(
                  text: 'Yellow',
                  selected: false,
                  onSelected: (value) {},
                ),
              ],
            )
          ],
        ),

        /// -- Attributes
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SectionHeading(
              title: 'Size',
              showActionButton: false,
            ),
            SizedBox(
              height: TSizes.spaceBtwItems / 2,
            ),
            Wrap(
              spacing: 8,
              children: [
                TChoiceChip(
                  text: 'EU 34',
                  selected: true,
                  onSelected: (value) {},
                ),
                TChoiceChip(
                  text: 'EU 36',
                  selected: false,
                  onSelected: (value) {},
                ),
                TChoiceChip(
                  text: 'EU 38',
                  selected: false,
                  onSelected: (value) {},
                ),
              ],
            ),
          ],
        )
      ],
    );
  }
}
