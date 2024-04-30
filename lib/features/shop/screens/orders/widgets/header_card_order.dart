import 'package:bliguh/utils/constants/colors.dart';
import 'package:flutter/cupertino.dart';

class HeaderOrderCard extends StatelessWidget {
  const HeaderOrderCard(
      {super.key, required this.store_name, required this.status});

  final String store_name, status;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(store_name),
        Text(
          status,
          style: TextStyle(color: TColors.primary),
        ),
      ],
    );
  }
}
