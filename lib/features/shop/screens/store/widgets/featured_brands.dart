import 'package:bliguh/common/widgets/containers/RoundedContainer.dart';
import 'package:bliguh/common/widgets/images/ciruclar_image.dart';
import 'package:bliguh/common/widgets/texts/brand_icon_verify.dart';
import 'package:bliguh/utils/constants/colors.dart';
import 'package:bliguh/utils/constants/enums.dart';
import 'package:bliguh/utils/constants/image_strings.dart';
import 'package:bliguh/utils/constants/sizes.dart';
import 'package:bliguh/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class BrandCards extends StatelessWidget {
  const BrandCards(
      {super.key,
      this.image = TImages.acerlogo,
      this.brand = 'Accer',
      this.total = 0,
      this.showBorder = true,
      this.onTap});

  final String image, brand;
  final int total;
  final bool showBorder;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    final bool dark = THelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: onTap,
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
