import 'package:flutter/material.dart';

class TitleVoucherDesc extends StatelessWidget {
  const TitleVoucherDesc({super.key, this.title = 'Shipping Voucher'});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(fontSize: 15, fontWeight: FontWeight.w800),
        ),
        Text(
          '1 Voucher can be selected',
          style: TextStyle(fontSize: 12),
        )
      ],
    );
  }
}
