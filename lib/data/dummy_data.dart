import 'package:ecommerce_firebase_getx/utils/constants/colors.dart';
import 'package:ecommerce_firebase_getx/utils/constants/image_strings.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

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
final List<Map<String, dynamic>> whishlists = [
  {
    'image': TImages.productImage1,
    'price': 2000000,
    'title': 'Nike Zoom Air Green',
    'brand': 'Nike',
    'isDiscount': true,
    'isFavourite': true,
    'discount': 25
  },
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
    'isFavourite': true,
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

List<Map<String, dynamic>> settingsList = [
  {
    'id': 1,
    'icon': Iconsax.safe_home,
    'title': 'My Account',
    'subTitle': 'Set shopping delivery address',
    'onPressed': () {
      // Add your logic for My Account onPressed
    },
  },
  {
    'id': 2,
    'icon': Iconsax.shopping_cart,
    'title': 'My Cart',
    'subTitle': 'Add remove product and move to checkout',
    'onPressed': () {
      // Add your logic for Notifications onPressed
    },
  },
  {
    'id': 3,
    'icon': Iconsax.bag_tick,
    'title': 'My Orders',
    'subTitle': 'In-progress and completed orders',
    'onPressed': () {
      // Add your logic for Privacy onPressed
    },
  },
  {
    'id': 4,
    'icon': Iconsax.bank,
    'title': 'Bank Account',
    'subTitle': 'Withdraw balance to registered bank account',
    'onPressed': () {
      // Add your logic for Privacy onPressed
    },
  },
  {
    'id': 4,
    'icon': Iconsax.discount_shape,
    'title': 'My Coupons',
    'subTitle': 'List of all the coupon discount',
    'onPressed': () {
      // Add your logic for Privacy onPressed
    },
  },
  {
    'id': 3,
    'icon': Iconsax.bag_tick,
    'title': 'My Orders',
    'subTitle': 'In-progress and completed orders',
    'onPressed': () {
      // Add your logic for Privacy onPressed
    },
  },
  {
    'id': 5,
    'icon': Iconsax.notification,
    'title': 'Notification',
    'subTitle': 'Get any kind of notification message',
    'onPressed': () {
      // Add your logic for Privacy onPressed
    },
  },
  {
    'id': 6,
    'icon': Iconsax.security_card,
    'title': 'Account Privacey',
    'subTitle': 'Manage data usage and connects',
    'onPressed': () {
      // Add your logic for Privacy onPressed
    },
  },
  // Add more items as needed
];

List<Map<String, dynamic>> settingsAppMenu = [
  {
    'id': 1,
    'icon': Iconsax.document_upload,
    'title': 'Load Data',
    'subTitle': 'Upload your document',
    'onPressed': () {
      // Add your logic for My Account onPressed
    },
  },
  {
    'id': 2,
    'icon': Iconsax.location,
    'title': 'Geolocation',
    'subTitle': 'Set recommendation based on location',
    'onPressed': () {
      // Add your logic for Notifications onPressed
    },
    'trailing': Switch(
      value: true,
      onChanged: (value) {},
      activeColor: TColors.primary,
    )
  },
  {
    'id': 3,
    'icon': Iconsax.security_user,
    'title': 'Safe Mode',
    'subTitle': 'Set result is safe for all ages',
    'onPressed': () {
      // Add your logic for Notifications onPressed
    },
    'trailing': Switch(
      value: false,
      onChanged: (value) {},
      activeColor: TColors.primary,
    )
  },
  {
    'id': 4,
    'icon': Iconsax.image,
    'title': 'HD Image Quality',
    'subTitle': 'Set image quality to be seen',
    'onPressed': () {
      // Add your logic for Notifications onPressed
    },
    'trailing': Switch(
      value: false,
      onChanged: (value) {},
      activeColor: TColors.primary,
    )
  },
  // Add more items as needed
];
