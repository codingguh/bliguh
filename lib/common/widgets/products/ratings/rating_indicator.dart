import 'package:ecommerce_firebase_getx/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class TRatingBarIndicator extends StatelessWidget {
  const TRatingBarIndicator({
    super.key,
    required this.rating,
  });

  final double rating;

  @override
  Widget build(BuildContext context) {
    return RatingBarIndicator(
      rating: rating,
      itemSize: 20,
      unratedColor: TColors.grey,
      itemBuilder: (_, __) => Icon(
        Icons.star_rounded,
        color: TColors.primary,
      ),
    );
  }
}
