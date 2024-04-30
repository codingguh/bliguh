import 'package:bliguh/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:bliguh/common/widgets/appbar/appbar.dart';
import 'package:bliguh/common/widgets/custom_shapes/curved_edges/curved_edges_widget.dart';
import 'package:bliguh/common/widgets/icons/circular_icon.dart';
import 'package:bliguh/common/widgets/images/rounded_image.dart';
import 'package:bliguh/utils/constants/colors.dart';
import 'package:bliguh/utils/constants/image_strings.dart';
import 'package:bliguh/utils/constants/sizes.dart';

class ProductImageSlider extends StatelessWidget {
  const ProductImageSlider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return CurveEdgeWidget(
      child: Container(
        color: dark ? TColors.darkGrey : TColors.light,
        child: Stack(
          children: [
            ///Main Large Image
            SizedBox(
                height: 400,
                child: Padding(
                  padding: EdgeInsets.all(TSizes.productImageRadius * 2.5),
                  child: Center(
                      child: Image(
                          fit: BoxFit.fitHeight,
                          image: AssetImage(TImages.productImage5))),
                )),

            /// Image Slider
            Positioned(
              right: 0,
              bottom: 30,
              left: TSizes.defaultSpace,
              child: SizedBox(
                height: 60,
                child: ListView.separated(
                  itemCount: 4,
                  shrinkWrap: true,
                  physics: const AlwaysScrollableScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  separatorBuilder: (_, __) => const SizedBox(
                    width: TSizes.spaceBtwItems,
                  ),
                  itemBuilder: (_, index) => RoundedImage(
                    width: 80,
                    backgroundColor: dark ? TColors.dark : TColors.white,
                    border: Border.all(color: TColors.primary),
                    imageUrl: TImages.productImage3,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),

            TAppBar(
              showBackArrow: true,
              onTap: () {
                Get.back();
              },
              actions: [
                CircularIcon(
                  icon: Iconsax.heart3,
                  overlayColor: Colors.red,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
