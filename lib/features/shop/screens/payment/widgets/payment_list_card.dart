import 'package:ecommerce_firebase_getx/common/widgets/containers/RoundedContainer.dart';
import 'package:ecommerce_firebase_getx/common/widgets/icons/circular_icon.dart';
import 'package:ecommerce_firebase_getx/utils/constants/colors.dart';
import 'package:ecommerce_firebase_getx/utils/constants/sizes.dart';
import 'package:ecommerce_firebase_getx/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class PaymentListCard extends StatelessWidget {
  const PaymentListCard({
    super.key,
    required this.isIcon,
    required this.icon,
    required this.image,
    required this.title,
    this.isChecked = false,
    required this.showMore,
    this.isChild = false,
  });

  final bool isIcon;
  final IconData icon;
  final String image;
  final String title;
  final bool isChecked, isChild;
  final bool showMore;

  @override
  Widget build(BuildContext context) {
    final bool dark = THelperFunctions.isDarkMode(context);
    return ListTile(
      leading: RoundedContainer(
        width: 45,
        height: 35,
        backgroundColor: dark ? TColors.light : TColors.white,
        padding:
            EdgeInsets.only(top: TSizes.xs, bottom: TSizes.xs, left: TSizes.xs),
        child: isIcon
            ? CircularIcon(
                icon: icon,
                size: 30,
              )
            : Container(
                child: Image(
                image: AssetImage(image),
              )),
      ),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.bodyLarge!,
          ),
          Text(
            'Cash on delivery',
            style: TextStyle(fontSize: 12, fontWeight: FontWeight.w300),
          )
        ],
      ),
      trailing: isChecked && showMore
          ? Container(
              width: 120,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  CircularIcon(
                    icon: Icons.check_sharp,
                    width: 21,
                    height: 21,
                    size: 16,
                    padding: 0,
                    overlayColor: TColors.white,
                    backgroundColor: TColors.primary,
                  ),
                  SizedBox(
                    width: 3,
                  ),
                  CircularIcon(
                    icon: Iconsax.arrow_circle_down,
                    width: 25,
                    height: 25,
                    size: 21,
                    padding: 0,
                    overlayColor: TColors.black,
                    // backgroundColor: TColors.grey,
                  ),
                ],
              ),
            )
          : isChecked
              ? isChild
                  ? CircularIcon(
                      icon: Icons.check,
                      size: 21,
                      padding: 0,
                      overlayColor: TColors.primary,
                    )
                  : CircularIcon(
                      icon: Icons.check_sharp,
                      width: 21,
                      height: 21,
                      size: 16,
                      padding: 0,
                      overlayColor: TColors.white,
                      backgroundColor: TColors.primary,
                    )
              : SizedBox(),
    );
  }
}
