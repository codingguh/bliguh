import 'package:bliguh/common/widgets/appbar/appbar.dart';
import 'package:bliguh/common/widgets/icons/circular_icon.dart';
import 'package:bliguh/common/widgets/layouts/grid_layout.dart';
import 'package:bliguh/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:bliguh/features/shop/screens/favourite/controllers/favourite_controller.dart';
import 'package:bliguh/navigation_menu.dart';
import 'package:bliguh/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // final List<Map<String, dynamic>> favoriteProducts =
    //     products.where((product) => product['isFavourite'] == true).toList();
    // print(favoriteProducts);
    final FavouriteController controller =
        Get.put<FavouriteController>(FavouriteController());
    return Scaffold(
      appBar: TAppBar(
        title: Text(
          'Whishlist',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        actions: [
          CircularIcon(
            icon: Iconsax.add,
            onPressed: () {
              Get.find<NavigationController>().selectedIndex.value =
                  0; // Navigate to HomeScreen
            },
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(TSizes.defaultSpace - 12),
          child: Column(
            children: [
              Obx(
                () => GridLayout(
                    itemCount: controller.favoriteProducts.length,
                    itemBuilder: (_, index) {
                      final whishlist = controller.favoriteProducts[index];
                      return ProductCardVertical(
                        imageUrl: whishlist['image'],
                        title: whishlist['title'],
                        price: whishlist['price'],
                        brand: whishlist['brand'],
                        isDiscount: whishlist['isDiscount'],
                        isFavourite: controller.isFavorite(whishlist),
                        discount: whishlist['discount'],
                        onPressed: () {
                          controller.toggleFavorite(whishlist);
                        },
                      );
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
