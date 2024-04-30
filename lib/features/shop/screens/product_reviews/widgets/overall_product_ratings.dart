import 'package:bliguh/features/shop/screens/product_reviews/widgets/rating_progress_indicator.dart';
import 'package:flutter/material.dart';

class OverallProductRating extends StatelessWidget {
  const OverallProductRating({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 3,
          child: Text(
            '4.8',
            style: Theme.of(context).textTheme.displayLarge,
          ),
        ),
        Expanded(
          flex: 7,
          child: Column(
            children: [
              RatingsProgressIndicator(
                text: '5',
                value: 1.0,
              ),
              RatingsProgressIndicator(
                text: '4',
                value: 0.8,
              ),
              RatingsProgressIndicator(
                text: '3',
                value: 0.6,
              ),
              RatingsProgressIndicator(
                text: '2',
                value: 0.4,
              ),
              RatingsProgressIndicator(
                text: '1',
                value: 0.2,
              ),
            ],
          ),
        )
      ],
    );
  }
}
