import 'package:ecommerce_firebase_getx/common/widgets/brands/brand_showcase.dart';
import 'package:ecommerce_firebase_getx/common/widgets/layouts/grid_layout.dart';
import 'package:ecommerce_firebase_getx/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:ecommerce_firebase_getx/common/widgets/texts/section_heading.dart';
import 'package:ecommerce_firebase_getx/features/shop/screens/favourite/controllers/favourite_controller.dart';
import 'package:ecommerce_firebase_getx/utils/constants/image_strings.dart';
import 'package:ecommerce_firebase_getx/utils/constants/sizes.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class CategoryTab extends StatelessWidget {
  const CategoryTab({super.key});

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
