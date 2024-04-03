import 'package:ecommerce_firebase_getx/common/widgets/layouts/grid_layout.dart';
import 'package:ecommerce_firebase_getx/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:ecommerce_firebase_getx/data/dummy_data.dart';
import 'package:flutter/cupertino.dart';

class ProdukRekomendasi extends StatelessWidget {
  const ProdukRekomendasi({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GridLayout(
      itemCount: products.length,
      itemBuilder: (_, index) {
        final product = products[index];
        return ProductCardVertical(
          imageUrl: product['image'],
          title: product['title'],
          price: product['price'],
          brand: product['brand'],
          isDiscount: product['isDiscount'],
          isFavourite: product['isFavourite'],
          discount: product['discount'],
        );
      },
    );
  }
}
