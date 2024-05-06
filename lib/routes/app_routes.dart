import 'package:bliguh/features/authentication/screens/onboarding/onboarding.dart';
import 'package:bliguh/features/authentication/screens/password/configuration/forget_password.dart';
import 'package:bliguh/features/authentication/screens/signup/signup.dart';
import 'package:bliguh/features/authentication/screens/signup/verify_email.dart';
import 'package:bliguh/features/personalization/screens/addresses/addresses.dart';
import 'package:bliguh/features/personalization/screens/profile/profile.dart';
import 'package:bliguh/features/personalization/screens/settings/settings.dart';
import 'package:bliguh/features/shop/screens/cart/cart.dart';
import 'package:bliguh/features/shop/screens/checkout/checkout_screen.dart';
import 'package:bliguh/features/shop/screens/favourite/controllers/favourite_controller.dart';
import 'package:bliguh/features/shop/screens/favourite/favourite.dart';
import 'package:bliguh/features/shop/screens/home/home.dart';
import 'package:bliguh/features/shop/screens/orders/order_screen.dart';
import 'package:bliguh/features/shop/screens/product_reviews/product_reviews.dart';
import 'package:bliguh/features/shop/screens/search_products/search.dart';
import 'package:bliguh/features/shop/screens/store/store.dart';
import 'package:bliguh/routes/routes.dart';
import 'package:get/get.dart';

class AppRoutes {
  static final screens = [
    GetPage(name: TRoutes.home, page: () => const HomeScreen()),
    GetPage(name: TRoutes.store, page: () => const StoreScreen()),
    GetPage(name: TRoutes.favourites, page: () => const FavouriteScreen()),
    GetPage(name: TRoutes.settings, page: () => const SettingsScreen()),
    GetPage(
        name: TRoutes.productReviews, page: () => const ProductReviewsScreen()),
    GetPage(name: TRoutes.order, page: () => const OrderScreen()),
    GetPage(name: TRoutes.checkout, page: () => const CheckoutScreen()),
    GetPage(name: TRoutes.cart, page: () => const CartScreen()),
    GetPage(name: TRoutes.search, page: () => const SearchProductScreen()),
    GetPage(name: TRoutes.userProfile, page: () => const ProfileScreen()),
    GetPage(name: TRoutes.userAddresss, page: () => const UserAddressScreen()),
    GetPage(name: TRoutes.signUp, page: () => const SignUpScreen()),
    GetPage(name: TRoutes.verifyEmail, page: () => const VerifyEmailScreen()),
    GetPage(name: TRoutes.forgetPassword, page: () => const ForgetPassword()),
    GetPage(name: TRoutes.onboarding, page: () => const OnBoardingScreen()),
  ];
}
