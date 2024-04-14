import 'package:ecommerce_firebase_getx/utils/constants/colors.dart';
import 'package:ecommerce_firebase_getx/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class CurrentLocationAddresses extends StatelessWidget {
  const CurrentLocationAddresses({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: TColors.lightGray,
      padding: EdgeInsets.all(TSizes.md),
      height: 120,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: 50,
            width: double.infinity,
            color: Colors.white,
            child: Center(child: Text('Use My Current Location')),
          ),
          Text(
            'Province',
            style: Theme.of(context).textTheme.bodySmall,
          )
        ],
      ),
    );
  }
}
