import 'package:flutter/cupertino.dart';

class TitleCardAddress extends StatelessWidget {
  const TitleCardAddress({
    super.key,
    required this.addressName,
    required this.phoneNo,
  });

  final String addressName, phoneNo;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
            addressName.length <= 12
                ? addressName
                : addressName.substring(0, 12) + '..',
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
            style: TextStyle(fontWeight: FontWeight.bold)),
        Text(' | '),
        Text(phoneNo, style: TextStyle()),
      ],
    );
  }
}
