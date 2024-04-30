import 'package:bliguh/common/widgets/layouts/grid_layout.dart';
import 'package:bliguh/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:bliguh/data/dummy_data.dart';
import 'package:bliguh/features/shop/screens/favourite/controllers/favourite_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

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
              controller.toggleFavorite(product);
            },
          ),
        );
      },
    );
  }
}
