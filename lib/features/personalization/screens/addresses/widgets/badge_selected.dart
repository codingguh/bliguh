import 'package:ecommerce_firebase_getx/common/widgets/containers/RoundedContainer.dart';
import 'package:ecommerce_firebase_getx/utils/constants/colors.dart';
import 'package:flutter/cupertino.dart';

class BadgeSelected extends StatelessWidget {
  const BadgeSelected({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
        right: 1,
        top: 0,
        child: RoundedContainer(
            showBorder: true,
            radius: 0,
            padding: EdgeInsets.symmetric(vertical: 2.5, horizontal: 5),
            borderColor: TColors.primary,
            child: Text(
              'Default',
              style: TextStyle(
                  fontSize: 11,
                  color: TColors.primary,
                  fontWeight: FontWeight.bold),
            )));
  }
}
