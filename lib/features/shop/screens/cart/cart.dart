import 'package:ecommerce_firebase_getx/common/widgets/appbar/appbar.dart';
import 'package:ecommerce_firebase_getx/common/widgets/products/cart/button_checkout_all_list.dart';
import 'package:ecommerce_firebase_getx/features/shop/screens/checkout/checkout_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'widgets/cart_items.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 242, 242, 242),
      appBar: TAppBar(
        isCenter: true,
        showBackground: true,
        bgColor: Colors.white,
        showBackArrow: true,
        onTap: () {
          Get.back();
        },
        title: Text(
          'Cart',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      body: SingleChildScrollView(
        child: CartItems(
          total: 12,
          showGap: true,
        ),
      ),
      bottomNavigationBar: ButtonCheckout(
        showcheckAll: true,
        showTotalItems: true,
        totalItems: '3',
        onTap: () {
          Get.to(() => CheckoutScreen());
        },
        onCheckedAll: (bool) {
          print('Checlist all');
        },
      ),
    );
  }
}
