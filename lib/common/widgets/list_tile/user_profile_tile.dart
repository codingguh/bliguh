import 'package:bliguh/common/widgets/images/ciruclar_image.dart';
import 'package:bliguh/utils/constants/colors.dart';
import 'package:bliguh/utils/constants/image_strings.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class UserProfileTile extends StatelessWidget {
  const UserProfileTile({
    super.key,
    required this.onPressed,
  });

  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircularImage(
        image: TImages.user,
        isNetworkImage: false,
        width: 50,
        height: 50,
        padding: 0,
      ),
      title: Text(
        'Teguh Muhammad Harits',
        style: Theme.of(context).textTheme.headlineSmall!.apply(
              color: TColors.white,
            ),
      ),
      trailing: IconButton(
        onPressed: onPressed,
        icon: const Icon(
          Iconsax.edit,
          color: TColors.white,
        ),
      ),
    );
  }
}
