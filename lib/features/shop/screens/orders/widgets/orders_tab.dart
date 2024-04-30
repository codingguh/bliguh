import 'package:bliguh/common/widgets/layouts/grid_layout.dart';
import 'package:bliguh/common/widgets/login_signup/form_divider.dart';
import 'package:bliguh/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:bliguh/utils/constants/colors.dart';
import 'package:bliguh/utils/constants/image_strings.dart';
import 'package:bliguh/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class OrderTab extends StatelessWidget {
  const OrderTab({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Padding(
        // color: Colors.white,
        padding: const EdgeInsets.only(top: 10),
        child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 6),
            color: TColors.secondGrey,
            child: ListView(
              children: [
                child,
                SizedBox(
                  height: TSizes.spaceBtwItems,
                ),
                FormDivider(
                  textDivider: 'You May Also like',
                  firstIndent: 20,
                  firstEndIndent: 20,
                  secondIndent: 20,
                  secondEndIndent: 20,
                  customTextStyle: true,
                  textStyle: TextStyle(color: Colors.black),
                  colorDivider: Colors.black,
                ),
                SizedBox(
                  height: TSizes.spaceBtwItems,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: TSizes.sm),
                  child: GridLayout(
                      itemCount: 5,
                      itemBuilder: (_, index) => ProductCardVertical(
                            brand: 'Adidas',
                            showButtonCart: false,
                            imageUrl: TImages.productImage1,
                          )),
                )
              ],
            )));
  }
}
