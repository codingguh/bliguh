import 'package:ecommerce_firebase_getx/utils/constants/colors.dart';
import 'package:ecommerce_firebase_getx/utils/constants/sizes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LabelShippingOrder extends StatelessWidget {
  const LabelShippingOrder(
      {super.key, required this.status, required this.order_desc});

  final String status, order_desc;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Divider(),
        SizedBox(
          height: TSizes.xs,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                getOrderDesc(status, order_desc),
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                style: TextStyle(fontSize: 11, color: TColors.thirdDark),
              ),
            ),
            Icon(
              Icons.chevron_right,
              color: Colors.grey,
            ),
          ],
        ),
      ],
    );
  }

  String getOrderDesc(String status, order_desc) {
    switch (status) {
      case 'To Received':
        return 'Pesanan telah diserahkan kepada kurir';
      case 'Completed':
        return 'Pesanan telah sampai di terima oleh yang bersangkutan';
      default:
        return order_desc;
    }
  }
}
