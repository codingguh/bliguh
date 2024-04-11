import 'package:ecommerce_firebase_getx/common/widgets/products/ratings/rating_indicator.dart';
import 'package:ecommerce_firebase_getx/features/shop/screens/product_reviews/widgets/read_more.dart';
import 'package:ecommerce_firebase_getx/features/shop/screens/product_reviews/widgets/reply_review.dart';
import 'package:ecommerce_firebase_getx/utils/constants/sizes.dart';
import 'package:ecommerce_firebase_getx/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class UserReviewCard extends StatelessWidget {
  const UserReviewCard({
    super.key,
    required this.nameReviewer,
    required this.imageReviewer,
    required this.dateReviewer,
    this.isReplyStore = false,
  });

  final String nameReviewer, imageReviewer, dateReviewer;
  final bool isReplyStore;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage(imageReviewer),
                ),
                const SizedBox(
                  width: TSizes.spaceBtwItems,
                ),
                Text(
                  nameReviewer,
                  style: Theme.of(context).textTheme.titleLarge,
                )
              ],
            ),
            IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert))
          ],
        ),

        const SizedBox(
          width: TSizes.spaceBtwItems,
        ),

        ///Review
        Row(
          children: [
            TRatingBarIndicator(rating: 4),
            const SizedBox(
              width: TSizes.spaceBtwItems,
            ),
            Text(
              dateReviewer,
              style: Theme.of(context).textTheme.bodyMedium,
            )
          ],
        ),
        const SizedBox(
          height: TSizes.spaceBtwItems,
        ),
        TReadMoreText(
          text:
              'The user interfaces of the app is quite intuitive, I was able to navigate and make purchases seamlessly. Great Job!',
        ),
        const SizedBox(
          height: TSizes.spaceBtwItems,
        ),

        /// Company Review
        isReplyStore ? ReplyReviewStore() : SizedBox(),
        const SizedBox(
          height: TSizes.spaceBtwItems,
        ),
      ],
    );
  }
}
