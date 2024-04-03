import 'package:ecommerce_firebase_getx/common/widgets/containers/RoundedContainer.dart';
import 'package:ecommerce_firebase_getx/common/widgets/images/ciruclar_image.dart';
import 'package:ecommerce_firebase_getx/common/widgets/texts/brand_icon_verify.dart';
import 'package:ecommerce_firebase_getx/utils/constants/colors.dart';
import 'package:ecommerce_firebase_getx/utils/constants/enums.dart';
import 'package:ecommerce_firebase_getx/utils/constants/sizes.dart';
import 'package:ecommerce_firebase_getx/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class BrandCards extends StatelessWidget {
  const BrandCards(
      {super.key,
      required this.image,
      required this.brand,
      required this.total,
      this.showBorder = true});

  final String image, brand;
  final int total;
  final bool showBorder;

  @override
  Widget build(BuildContext context) {
    final bool dark = THelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: () {},
      child: RoundedContainer(
        padding: const EdgeInsets.all(TSizes.sm),
        showBorder: showBorder,
        backgroundColor: Colors.transparent,
        borderColor: TColors.grey,
        child: Row(
          children: [
            ///--ICON
            Flexible(
              child: CircularImage(
                image: image,
                isNetworkImage: false,
                backgroundColor: Colors.transparent,
                overlayColor: dark ? TColors.white : TColors.black,
              ),
            ),
            SizedBox(
              width: TSizes.spaceBtwItems / 2,
            ),

            ///--TEXT
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  BrandIconWithVerifyIcon(
                    brand: brand,
                    brandTextSize: TextSizes.large,
                  ),
                  Text(
                    '$total products',
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.labelMedium,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
