import 'package:ecommerce_firebase_getx/common/widgets/images_text_widget/custom_image_text.dart';
import 'package:ecommerce_firebase_getx/utils/constants/image_strings.dart';
import 'package:flutter/material.dart';

class HomeCategories extends StatelessWidget {
  const HomeCategories({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 75,
      child: ClipRect(
        clipBehavior: Clip.hardEdge, // Clip content that overflows
        child: ListView.builder(
            shrinkWrap: true,
            itemCount: 6,
            scrollDirection: Axis.horizontal,
            itemBuilder: (_, index) {
              return VerticalImageText(
                image: TImages.shoeIcon,
                title: 'Shows',
                onTap: () {},
              );
            }),
      ),
    );
  }
}
