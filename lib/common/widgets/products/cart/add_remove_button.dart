import 'package:bliguh/common/widgets/icons/circular_icon.dart';
import 'package:bliguh/utils/constants/colors.dart';
import 'package:bliguh/utils/constants/sizes.dart';
import 'package:bliguh/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class AddRemoveQuantityButton extends StatelessWidget {
  const AddRemoveQuantityButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        CircularIcon(
          icon: Iconsax.minus,
          width: 25,
          height: 25,
          size: TSizes.md,
          overlayColor: THelperFunctions.isDarkMode(context)
              ? TColors.white
              : TColors.black,
          backgroundColor: THelperFunctions.isDarkMode(context)
              ? TColors.darkerGrey
              : TColors.light,
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
        CircularIcon(
          icon: Iconsax.add,
          width: 23,
          height: 23,
          size: TSizes.md,
          overlayColor: TColors.white,
          backgroundColor: TColors.primary,
        ),
      ],
    );
  }
}
