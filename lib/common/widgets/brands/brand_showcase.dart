import 'package:ecommerce_firebase_getx/common/widgets/containers/RoundedContainer.dart';
import 'package:ecommerce_firebase_getx/features/shop/screens/store/widgets/featured_brands.dart';
import 'package:ecommerce_firebase_getx/features/shop/screens/store/widgets/top_products_images.dart';
import 'package:ecommerce_firebase_getx/utils/constants/colors.dart';
import 'package:ecommerce_firebase_getx/utils/constants/image_strings.dart';
import 'package:ecommerce_firebase_getx/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class BrandsShowCase extends StatelessWidget {
  const BrandsShowCase({
    super.key,
    required this.images,
  });

  final List<String> images;

  @override
  Widget build(BuildContext context) {
    return RoundedContainer(
      showBorder: true,
      borderColor: TColors.darkGrey,
      backgroundColor: Colors.transparent,
      margin: const EdgeInsets.only(bottom: TSizes.spaceBtwItems),
      padding: const EdgeInsets.all(TSizes.md),
      child: Column(
        children: [
          ///Brand with product count
          const BrandCards(
              showBorder: false,
              image: TImages.adidasLogo,
              brand: 'Adidas',
              total: 55),

          ///Brand Top 3 Product images
          Row(
            children: images
                .map((image) => brandTopProductImageWidget(image, context))
                .toList(),
          )
        ],
      ),
    );
  }
}
