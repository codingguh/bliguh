import 'package:flutter/material.dart';

import '../../../utils/constants/sizes.dart';

class GridLayout extends StatelessWidget {
  const GridLayout(
      {super.key,
      required this.itemCount,
      this.mainAxisExtent = 280,
      this.mainAxisSpacing = 16,
      required this.itemBuilder,
      this.padding = EdgeInsets.zero});

  final int itemCount;
  final double mainAxisExtent, mainAxisSpacing;
  final Widget? Function(BuildContext, int) itemBuilder;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        padding: padding,
        itemCount: itemCount,
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: TSizes.md,
            crossAxisSpacing: 12,
            mainAxisExtent: mainAxisExtent),
        itemBuilder: (context, index) {
          return itemBuilder(context, index);
        });
  }
}
