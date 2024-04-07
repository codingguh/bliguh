import 'package:ecommerce_firebase_getx/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class RatingAndShare extends StatelessWidget {
  const RatingAndShare({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          /// - Rating
          children: [
            Icon(
              Iconsax.star5,
              color: Colors.amber,
              size: 34,
            ),
            SizedBox(
              width: TSizes.spaceBtwItems / 2,
            ),
            Text.rich(TextSpan(
              children: [
                TextSpan(
                    text: '5.0/', style: Theme.of(context).textTheme.bodyLarge),
                const TextSpan(text: '(199)')
              ],
            ))
          ],
        ),

        /// Share Button
        IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.share,
              size: TSizes.iconMd,
            )),
      ],
    );
  }
}
