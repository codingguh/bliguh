import 'package:ecommerce_firebase_getx/common/widgets/layouts/grid_layout.dart';
import 'package:ecommerce_firebase_getx/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:ecommerce_firebase_getx/data/dummy_data.dart';
import 'package:ecommerce_firebase_getx/features/shop/screens/favourite/controllers/favourite_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ProdukRekomendasi extends StatelessWidget {
  const ProdukRekomendasi({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final FavouriteController controller =
        Get.put<FavouriteController>(FavouriteController());
    return GridLayout(
      itemCount: products.length,
      itemBuilder: (_, index) {
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
              // var data = controller.favoriteProducts;

              print(controller.favoriteProducts);
              controller.toggleFavorite(product);
              print(controller.favoriteProducts.length);
            },
          ),
        );
      },
    );
  }
}
