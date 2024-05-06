import 'package:bliguh/common/widgets/images_text_widget/custom_image_text.dart';
import 'package:bliguh/common/widgets/shimmer/category_shimmer.dart';
import 'package:bliguh/features/shop/controllers/category_controller.dart';
import 'package:bliguh/features/shop/screens/sub_category/sub_categories.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeCategories extends StatelessWidget {
  const HomeCategories({
    super.key,
    required this.categories,
  });
  final List<Map<String, dynamic>> categories;

  @override
  Widget build(BuildContext context) {
    final CategoryController categoryController = Get.put(CategoryController());
    return Obx(() {
      if (categoryController.isLoading.value)
        return const CategoryShimmer(itemCount: 8);
      if (categoryController.featuredCategories.isEmpty)
        return Center(
            child: SizedBox(
          height: 90,
          child: Text(
            'no category found',
            style: Theme.of(context)
                .textTheme
                .bodyMedium!
                .apply(color: Colors.white),
          ),
        ));

      return SizedBox(
        height: 93,
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: categoryController.featuredCategories.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (_, index) {
            final category = categories[index];
            return VerticalImageText(
              isNetworkImage: true,
              image: categoryController
                  .featuredCategories[index].image, // Access image from the map
              title: categoryController
                  .featuredCategories[index].name, // Access title from the map
              onTap: () => Get.to(() => const SubCategories()),
            );
          },
        ),
      );
    });
  }
}
