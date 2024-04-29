import 'package:ecommerce_firebase_getx/features/personalization/controllers/user_controller.dart';
import 'package:ecommerce_firebase_getx/utils/constants/colors.dart';
import 'package:flutter/material.dart';

class MyProfileName extends StatelessWidget {
  const MyProfileName({super.key, required this.username});

  final String username;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 24, left: 11),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            username,
            style: Theme.of(context).textTheme.headlineSmall!.apply(
                  color: TColors.white,
                ),
          ),
          SizedBox(
            height: 3,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                'Customer',
                style: Theme.of(context).textTheme.titleSmall!.apply(
                      color: TColors.white,
                    ),
              ),
              SizedBox(
                width: 7,
              ),
              // Text(
              //   '52 Following',
              //   style: Theme.of(context).textTheme.titleSmall!.apply(
              //         color: TColors.white,
              //       ),
              // ),
            ],
          ),
        ],
      ),
    );
  }
}
