import 'package:ecommerce_firebase_getx/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class BoxStreetAddress extends StatelessWidget {
  const BoxStreetAddress({super.key, required this.address});

  final String address;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 2,
      left: 0,
      right: 0,
      child: Padding(
        padding: EdgeInsets.all(TSizes.defaultSpace),
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(9)),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'Your address input',
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall!
                      .copyWith(fontSize: 11),
                ),
                Text(
                  address,
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(fontSize: 13),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
