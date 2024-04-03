import 'package:ecommerce_firebase_getx/utils/constants/image_strings.dart';

final List<String> banners = [
  TImages.banner1,
  TImages.banner3,
  TImages.banner4,
  TImages.banner2,
];

final List<Map<String, dynamic>> categories = [
  {'image': TImages.jeweleryIcon, 'title': 'Jewelry'},
  {'image': TImages.sportIcon, 'title': 'Sports'},
  {'image': TImages.electronicsIcon, 'title': 'Electronics'},
  {'image': TImages.furnitureIcon, 'title': 'Furniture'},
  {'image': TImages.shoeIcon, 'title': 'Shoes'},
  {'image': TImages.clothIcon, 'title': 'Clothes'},
  {'image': TImages.cosmeticsIcon, 'title': 'Cosmetics'},
  {'image': TImages.toyIcon, 'title': 'Toys'},
  {'image': TImages.animalIcon, 'title': 'Animals'},
  // Add more categories as needed
];

final List<Map<String, dynamic>> products = [
  {
    'image': TImages.productImage1,
    'price': 2000000,
    'title': 'Nike Zoom Air Green',
    'brand': 'Nike',
    'isDiscount': true,
    'isFavourite': true,
    'discount': 25
  },
  {
    'image': TImages.productImage2,
    'price': 5700000,
    'title': 'Adidas Forerunner',
    'brand': 'Adidas',
    'isDiscount': true,
    'isFavourite': false,
    'discount': 10
  },
  {
    'image': TImages.productImage3,
    'price': 2000000,
    'title': 'Jewelry',
    'brand': 'Nike',
    'isDiscount': false,
    'isFavourite': false,
    'discount': 0
  },
  {
    'image': TImages.productImage4,
    'price': 7200000,
    'title': 'Puma Shoes R2212',
    'brand': 'Puma',
    'isDiscount': false,
    'isFavourite': false,
    'discount': 0
  },
  {
    'image': TImages.productImage5,
    'price': 2000000,
    'title': 'Jewelry',
    'brand': 'Nike',
    'isDiscount': false,
    'isFavourite': false,
    'discount': 0
  },
  {
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
];

final List<Map<String, dynamic>> featuredBrands = [
  {
    'image': TImages.adidasLogo,
    'brand': 'Adidas',
    'total': 256,
  },
  {
    'image': TImages.nikeLogo,
    'brand': 'Nike',
    'total': 121,
  },
  {
    'image': TImages.pumaLogo,
    'brand': 'Puma',
    'total': 34,
  },
  {
    'image': TImages.appleLogo,
    'brand': 'Apple',
    'total': 89,
  }
];
