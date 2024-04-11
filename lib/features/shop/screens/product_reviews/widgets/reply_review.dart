import 'package:ecommerce_firebase_getx/common/widgets/containers/RoundedContainer.dart';
import 'package:ecommerce_firebase_getx/features/shop/screens/product_reviews/widgets/read_more.dart';
import 'package:ecommerce_firebase_getx/utils/constants/colors.dart';
import 'package:ecommerce_firebase_getx/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class ReplyReviewStore extends StatelessWidget {
  const ReplyReviewStore({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return RoundedContainer(
      backgroundColor: TColors.primary.withOpacity(0.25),
      margin: EdgeInsets.only(left: TSizes.sm),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(TSizes.md),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Store",
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    Text(
                      "03 Nov 2023",
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
              ],
            ),
          ),
        ],
      ),
    );
  }
}
