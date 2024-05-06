import 'package:bliguh/common/widgets/brands/brand_showcase.dart';
import 'package:bliguh/common/widgets/layouts/grid_layout.dart';
import 'package:bliguh/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:bliguh/common/widgets/texts/section_heading.dart';
import 'package:bliguh/features/shop/models/category_model.dart';
import 'package:bliguh/features/shop/screens/favourite/controllers/favourite_controller.dart';
import 'package:bliguh/utils/constants/image_strings.dart';
import 'package:bliguh/utils/constants/sizes.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class CategoryTab extends StatelessWidget {
  const CategoryTab({super.key, required this.category});

  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    final FavouriteController controller =
        Get.put<FavouriteController>(FavouriteController());
    return ListView(
      physics: const NeverScrollableScrollPhysics(),
      children: [
        Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              ///---Brands
              BrandsShowCase(
                images: [
                  TImages.productImage1,
                  TImages.productImage2,
                  TImages.productImage3,
                ],
              ),

              ///---Products
              SectionHeading(
                title: 'You might also like',
                showActionButton: true,
                onPressed: () {},
              ),
              const SizedBox(
                height: TSizes.spaceBtwItems,
              ),
              GridLayout(
                itemCount: controller.products.length,
                itemBuilder: (_, index) {
                  // final product = products[index];
                  final product = controller.products[index];

                  return Obx(
                    () => ProductCardVertical(
                      imageUrl: product['image'],
                      title: product['title'],
                      price: product['price'],
                      brand: product['brand'],
                      isDiscount: product['isDiscount'],
                      isFavourite: controller.isFavorite(product),
                      discount: product['discount'],
                      onPressed: () {
                        controller.toggleFavorite(product);
                      },
                    ),
                  );
                },
              ),

              const SizedBox(
                height: TSizes.spaceBtwItems,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
