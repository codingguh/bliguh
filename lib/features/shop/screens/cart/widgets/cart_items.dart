import 'package:bliguh/common/widgets/products/cart/cart_item.dart';
import 'package:bliguh/utils/constants/image_strings.dart';
import 'package:bliguh/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

import '../../../../../common/widgets/products/cart/add_remove_button.dart';
import '../../../../../common/widgets/texts/product_title_text.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/enums.dart';

class CartItems extends StatelessWidget {
  const CartItems(
      {super.key,
      this.showAddRemoveButtons = true,
      this.showGap = false,
      this.showBrand = true,
      required this.total,
      this.width = 40,
      this.isBold = false,
      this.title = 'Black Sports Shoes',
      this.image = TImages.productImage1,
      this.height = 40});

  final bool showAddRemoveButtons, showGap, showBrand, isBold;
  final int total;
  final double width, height;
  final String title, image;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      separatorBuilder: (_, __) => const SizedBox(
          // height: TSizes.spaceBtwSections,
          ),
      itemCount: total,
      itemBuilder: (_, index) => Column(
        children: [
          Column(
            children: [
              Container(
                color: Colors.white,
                padding: EdgeInsets.symmetric(
                    horizontal: TSizes.defaultSpace, vertical: TSizes.md),
                child: Column(
                  children: [
                    CartItem(
                      width: width,
                      height: height,
                      showBrand: showBrand,
                      title: title,
                      image: image,
                      isBold: isBold,
                    ),
                    if (showAddRemoveButtons)
                      SizedBox(
                        height: TSizes.spaceBtwItems,
                      ),
                    if (showAddRemoveButtons)
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          /// Add Remove Buttons
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: 20,
                                height: 20,
                                child: Checkbox(
                                    value: false, onChanged: (bool) {}),
                              ),
                              SizedBox(
                                width: 30,
                              ),
                              AddRemoveQuantityButton(),
                            ],
                          ),
                          ProductTitleText(
                            title: 'Rp.25.000',
                            // smallSize: false,
                            brandTextSizes: TextSizes.large,
                            isBold: true,
                            color: TColors.primary,
                          ),
                        ],
                      ),
                  ],
                ),
              ),
              if (showGap)
                SizedBox(
                  height: 6,
                )
            ],
          ),
        ],
      ),
    );
  }
}
