import 'package:bliguh/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class SectionHeading extends StatelessWidget {
  const SectionHeading({
    super.key,
    this.textColor,
    this.showActionButton = true,
    required this.title,
    this.buttonTittle = 'View All',
    this.onPressed,
  });

  final Color? textColor;
  final showActionButton;
  final String title, buttonTittle;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: Theme.of(context)
              .textTheme
              .headlineSmall!
              .apply(color: textColor),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),

        if (showActionButton)
          Row(
            children: [
              InkWell(
                  onTap: onPressed,
                  child: Text(
                    buttonTittle,
                    style: Theme.of(context)
                        .textTheme
                        .labelMedium!
                        .copyWith(fontWeight: FontWeight.w600),
                  )),
              const SizedBox(
                width: 3,
              ),
              Icon(
                Iconsax.arrow_right_3,
                color: TColors.darkGrey,
                size: 12,
                weight: 2,
              )
            ],
          )
        // TextButton(onPressed: onPressed, child: Text(buttonTittle))
      ],
    );
  }
}
