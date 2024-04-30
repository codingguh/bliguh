import 'package:bliguh/utils/constants/image_strings.dart';
import 'package:flutter/widgets.dart';

class ImageCoupon extends StatelessWidget {
  const ImageCoupon({super.key, this.image = TImages.freeShipping});

  final String image;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 20,
      child: Container(
        width: 70,
        height: 110,
        child: Center(
          child: Image.asset(
            image, // Replace with your image path
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
