import 'package:ecommerce_firebase_getx/common/widgets/buttons/custom_button.dart';
import 'package:ecommerce_firebase_getx/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class ButtonBottomNavigationbar extends StatelessWidget {
  const ButtonBottomNavigationbar(
      {super.key,
      this.showDescription = false,
      this.containerHeight = 125,
      this.description = const Text('description')});

  final bool showDescription;
  final double containerHeight;
  final Widget description;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width,
        height: containerHeight,
        color: Colors.white,
        child: Padding(
          padding: EdgeInsets.only(
            bottom: TSizes.sm,
            left: TSizes.md,
            top: TSizes.sm,
            right: TSizes.md,
          ),
          child: CustomButton(
            fontSize: 18,
            fontWeight: FontWeight.w500,
            showDescription: showDescription,
            description: description,
            onTap: () {
              print('hello');
            },
          ),
        ));
  }
}
