import 'package:bliguh/common/widgets/containers/RoundedContainer.dart';
import 'package:bliguh/utils/constants/colors.dart';
import 'package:bliguh/utils/constants/sizes.dart';
import 'package:bliguh/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

Widget brandTopProductImageWidget(String image, context) {
  final bool dark = THelperFunctions.isDarkMode(context);
  return Expanded(
    child: RoundedContainer(
      height: 100,
      padding: const EdgeInsets.all(TSizes.sm),
      backgroundColor: dark ? TColors.darkGrey : TColors.light,
      margin: const EdgeInsets.only(right: TSizes.sm),
      child: Image(
        fit: BoxFit.contain,
        image: AssetImage(image),
      ),
    ),
  );
}
