import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce_firebase_getx/common/widgets/custom_shapes/containers/circular_container.dart';
import 'package:ecommerce_firebase_getx/common/widgets/images/rounded_image.dart';
import 'package:ecommerce_firebase_getx/features/shop/controllers/home_controller.dart';
import 'package:ecommerce_firebase_getx/utils/constants/colors.dart';
import 'package:ecommerce_firebase_getx/utils/constants/sizes.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class FrameSlider extends StatelessWidget {
  const FrameSlider({
    super.key,
    required this.banners,
  });

  final List<String> banners;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController());
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(TSizes.sm - 1),
          child: Container(
            width: double.infinity, // Set the width to full width

            height: 150, // Set the desired height
            child: CarouselSlider(
              options: CarouselOptions(
                  viewportFraction: 1.0, // Ensure each child takes full width
                  autoPlay: true,
                  onPageChanged: (index, _) =>
                      controller.updatePageIndicator(index)),
              items: banners
                  .map((url) => RoundedImage(imageUrl: url, radius: 0))
                  .toList(),
            ),
          ),
        ),
        Positioned(
            left: 4,
            bottom: 3,
            child: Obx(
              () => Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  for (int i = 0; i < banners.length; i++)
                    CircularContainer(
                      width:
                          controller.carouselCurrentIndex.value == i ? 17 : 6,
                      height: 6,
                      margin: EdgeInsets.only(right: 3),
                      backgroundColor:
                          controller.carouselCurrentIndex.value == i
                              ? TColors.primary
                              : TColors.grey,
                    ),
                ],
              ),
            ))
      ],
    );
  }
}
