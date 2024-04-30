import 'package:bliguh/common/widgets/badge/badge.dart';
import 'package:bliguh/common/widgets/images/ciruclar_image.dart';
import 'package:bliguh/common/widgets/texts/brand_icon_verify.dart';
import 'package:bliguh/common/widgets/texts/price_text.dart';
import 'package:bliguh/common/widgets/texts/price_text_discount.dart';
import 'package:bliguh/common/widgets/texts/product_title_text.dart';
import 'package:bliguh/utils/constants/colors.dart';
import 'package:bliguh/utils/constants/enums.dart';
import 'package:bliguh/utils/constants/image_strings.dart';
import 'package:bliguh/utils/constants/sizes.dart';
import 'package:bliguh/utils/formatters/idr_formatter.dart';
import 'package:bliguh/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class ProductMetaData extends StatelessWidget {
  const ProductMetaData({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    final price = formatPriceIDR(200000);
    final discountPrice = formatPriceIDR(120000);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// Price & Sale Price
        Row(
          children: [
            /// Sale Tag
            TBadge(label: 25),
            const SizedBox(
              width: TSizes.spaceBtwItems,
            ),
            PriceTextDiscount(formattedPrice: price),
            const SizedBox(
              width: TSizes.spaceBtwItems,
            ),
            PriceText(formattedPrice: discountPrice),
          ],
        ),
        const SizedBox(
          height: TSizes.spaceBtwItems / 1.5,
        ),
        //Title
        ProductTitleText(
            title: 'Green Nike Sports Shirt', brandTextSizes: TextSizes.large),
        const SizedBox(
          height: 2,
        ),

        ///Stock Status
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              'Status:',
              style: Theme.of(context)
                  .textTheme
                  .titleSmall!
                  .copyWith(fontSize: 13),
            ),
            const SizedBox(
              width: 3,
            ),
            Text(
              ' In Stock',
              style: Theme.of(context)
                  .textTheme
                  .titleSmall!
                  .copyWith(fontWeight: FontWeight.bold, fontSize: 13),
            ),
          ],
        ),
        const SizedBox(
          height: TSizes.spaceBtwItems / 1.5,
        ),

        /// Brand
        Row(
          children: [
            CircularImage(
              width: 32,
              height: 32,
              image: TImages.shoeIcon,
              isNetworkImage: false,
              overlayColor: dark ? TColors.white : TColors.black,
            ),
            BrandIconWithVerifyIcon(
              brand: 'Nike',
              brandTextSize: TextSizes.small,
            ),
          ],
        )
      ],
    );
  }
}
