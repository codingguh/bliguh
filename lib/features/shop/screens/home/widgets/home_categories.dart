import 'package:bliguh/common/widgets/images_text_widget/custom_image_text.dart';
import 'package:flutter/material.dart';

class HomeCategories extends StatelessWidget {
  const HomeCategories({
    super.key,
    required this.categories,
  });
  final List<Map<String, dynamic>> categories;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 93,
      child: ClipRect(
        clipBehavior: Clip.hardEdge, // Clip content that overflows
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: categories.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (_, index) {
            final category = categories[index];
            return VerticalImageText(
              image: category['image'] ?? '', // Access image from the map
              title: category['title'] ?? '', // Access title from the map
              onTap: () {
                // Handle onTap event
              },
            );
          },
        ),
      ),
    );
  }
}
