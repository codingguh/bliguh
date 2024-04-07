import 'package:flutter/material.dart';
import 'package:ecommerce_firebase_getx/common/widgets/containers/RoundedContainer.dart';
import 'package:ecommerce_firebase_getx/utils/constants/colors.dart';
import 'package:ecommerce_firebase_getx/utils/constants/sizes.dart';

class TBadge extends StatelessWidget {
  const TBadge({
    super.key,
    required this.label,
  });

  final int label;

  @override
  Widget build(BuildContext context) {
    return RoundedContainer(
        radius: TSizes.sm,
        padding: const EdgeInsets.symmetric(
            vertical: TSizes.xs, horizontal: TSizes.xs),
        backgroundColor: TColors.secondary.withOpacity(0.8),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: TSizes.xs),
          child: SizedBox(
            // width: 30,
            child: Center(
              child: Text(
                '$label%',
                style: Theme.of(context).textTheme.labelMedium!.apply(
                      color: TColors.black,
                    ),
              ),
            ),
          ),
        ));
  }
}
