import 'package:bliguh/common/widgets/icons/circular_icon.dart';
import 'package:bliguh/utils/constants/colors.dart';
import 'package:bliguh/utils/constants/sizes.dart';
import 'package:bliguh/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class BottomAddToCard extends StatelessWidget {
  const BottomAddToCard({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Container(
      padding: const EdgeInsets.symmetric(
          horizontal: TSizes.defaultSpace, vertical: TSizes.defaultSpace / 2),
      decoration: BoxDecoration(
        color: dark ? TColors.darkerGrey : TColors.light,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(TSizes.cardRadiusLg),
            topRight: Radius.circular(TSizes.cardRadiusLg)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              CircularIcon(
                icon: Iconsax.minus,
                backgroundColor: TColors.darkGrey,
                size: 20,
                width: 35,
                height: 35,
                overlayColor: TColors.white,
              ),
              const SizedBox(
                width: TSizes.spaceBtwItems,
              ),
              Text(
                '2',
                style: Theme.of(context).textTheme.titleSmall,
              ),
              const SizedBox(
                width: TSizes.spaceBtwItems,
              ),
              const CircularIcon(
                icon: Iconsax.add,
                backgroundColor: TColors.black,
                width: 35,
                height: 35,
                size: 20,
                overlayColor: TColors.white,
              )
            ],
          ),
          ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(
                      vertical: TSizes.sm, horizontal: TSizes.md),
                  backgroundColor: TColors.primary,
                  side: const BorderSide(color: TColors.primary)),
              child: const Text(
                'Add to Cart',
                style: TextStyle(fontSize: 13),
              ))
        ],
      ),
    );
  }
}
