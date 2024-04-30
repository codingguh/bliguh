import 'package:bliguh/utils/constants/image_strings.dart';
import 'package:get/get.dart';

class FavouriteController extends GetxController {
  RxList<Map<String, dynamic>> favoriteProducts = <Map<String, dynamic>>[
    {
      'id': 1,
      'image': TImages.productImage1,
      'price': 2000000,
      'title': 'Nike Zoom Air Green',
      'brand': 'Nike',
      'isDiscount': true,
      'isFavourite': true,
      'discount': 25
    },
  ].obs;

  bool isFavorite(Map<String, dynamic> product) {
    return favoriteProducts.any((p) => p['id'] == product['id']);
  }

  final RxList<Map<String, dynamic>> products = [
    {
      'id': 1,
      'image': TImages.productImage1,
      'price': 2000000,
      'title': 'Nike Zoom Air Green',
      'brand': 'Nike',
      'isDiscount': true,
      'isFavourite': true,
      'discount': 25
    },
    {
      'id': 2,
      'image': TImages.productImage2,
      'price': 5700000,
      'title': 'Adidas Forerunner',
      'brand': 'Adidas',
      'isDiscount': true,
      'isFavourite': false,
      'discount': 10
    },
    {
      'id': 3,
      'image': TImages.productImage3,
      'price': 2000000,
      'title': 'Jewelry',
      'brand': 'Nike',
      'isDiscount': false,
      'isFavourite': false,
      'discount': 0
    },
    {
      'id': 4,
      'image': TImages.productImage4,
      'price': 7200000,
      'title': 'Puma Shoes R2212',
      'brand': 'Puma',
      'isDiscount': false,
      'isFavourite': true,
      'discount': 0
    },
    {
      'id': 5,
      'image': TImages.productImage5,
      'price': 2000000,
      'title': 'Jewelry',
      'brand': 'Nike',
      'isDiscount': false,
      'isFavourite': false,
      'discount': 0
    },
    {
      'id': 6,
      'image': TImages.productImage6,
      'price': 2000000,
      'title': 'Jewelry',
      'brand': 'Nike',
      'isDiscount': false,
      'isFavourite': false,
      'discount': 0
    },
    {
      'image': TImages.productImage1,
      'price': 3000000,
      'title': 'Jewelry',
      'brand': 'Nike',
      'isDiscount': false,
      'isFavourite': false,
      'discount': 0
    },

    // Add more categories as needed
  ].obs;

  void toggleFavorite(Map<String, dynamic> product) {
    // Find index of the product in favoriteProducts

    int index = favoriteProducts.indexWhere((p) => p['id'] == product['id']);

    if (index != -1) {
      // If product is already in favoriteProducts, remove it
      favoriteProducts.removeWhere((p) => p['id'] == product['id']);
    } else {
      // If product is not in favoriteProducts, add it
      favoriteProducts.add(product);
    }
  }
}
