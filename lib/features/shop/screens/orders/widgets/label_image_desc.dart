import 'package:bliguh/utils/constants/colors.dart';
import 'package:bliguh/utils/constants/image_strings.dart';
import 'package:bliguh/utils/constants/sizes.dart';
import 'package:flutter/cupertino.dart';

class LabelOrderImageDesc extends StatelessWidget {
  const LabelOrderImageDesc(
      {super.key, required this.product_name, required this.variation});

  final String product_name, variation;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(
          TImages.productImage1,
          width: 76,
          height: 76,
          fit: BoxFit.contain,
        ),
        SizedBox(
          width: TSizes.sm,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                product_name,
                style: TextStyle(fontSize: 13, fontWeight: FontWeight.w300),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    variation,
                    style: TextStyle(
                        color: TColors.darkerGrey,
                        fontSize: 11,
                        fontWeight: FontWeight.w300),
                  ),
                  Text(
                    'X 1',
                    style: TextStyle(fontSize: 12),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [Text('Free Returns'), Text('Rp.150.000')],
              )
            ],
          ),
        )
      ],
    );
  }
}
