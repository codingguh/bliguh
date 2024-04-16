import 'package:ecommerce_firebase_getx/utils/constants/sizes.dart';
import 'package:flutter/cupertino.dart';

class OrderTab extends StatelessWidget {
  const OrderTab({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const NeverScrollableScrollPhysics(),
      children: [
        Padding(
            padding: const EdgeInsets.all(TSizes.defaultSpace), child: child),
      ],
    );
  }
}
