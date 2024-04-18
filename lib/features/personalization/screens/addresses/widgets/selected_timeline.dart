import 'package:ecommerce_firebase_getx/common/widgets/containers/RoundedContainer.dart';
import 'package:ecommerce_firebase_getx/utils/constants/colors.dart';
import 'package:ecommerce_firebase_getx/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class SelectedTimeline extends StatelessWidget {
  const SelectedTimeline({
    super.key,
    required this.text,
    this.onTap,
  });

  final String text;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: RoundedContainer(
        showBorder: true,
        padding:
            EdgeInsets.symmetric(vertical: TSizes.md, horizontal: TSizes.sm),
        radius: 8,
        borderColor: const Color.fromARGB(255, 212, 212, 212),
        width: double.infinity,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RoundedContainer(
              showBorder: true,
              width: 20,
              height: 20,
              padding: EdgeInsets.all(3),
              borderColor: TColors.primary,
              child: RoundedContainer(
                backgroundColor: TColors.primary,
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              text,
              style: TextStyle(
                  color: TColors.primary, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
