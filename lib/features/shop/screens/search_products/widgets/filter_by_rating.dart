import 'package:bliguh/common/widgets/layouts/grid_layout.dart';
import 'package:bliguh/features/shop/screens/search_products/widgets/box_filters.dart';
import 'package:bliguh/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class FilterByRating extends StatelessWidget {
  const FilterByRating({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: TSizes.spaceBtwItems,
        ),
        Text('Rating'),
        SizedBox(
          height: 6,
        ),
        GridLayout(
            itemCount: 5,
            mainAxisExtent: 40,
            itemBuilder: (_, index) {
              final stars = 5 - index;
              return BoxFilter(
                text: '$stars Stars & Up',
              );
            }),
        SizedBox(
          height: TSizes.spaceBtwItems,
        ),
      ],
    );
  }
}
