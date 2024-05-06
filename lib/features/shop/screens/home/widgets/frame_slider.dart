import 'package:bliguh/common/widgets/shimmer/shimmer_effect.dart';
import 'package:bliguh/features/shop/controllers/banner_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:bliguh/common/widgets/custom_shapes/containers/circular_container.dart';
import 'package:bliguh/common/widgets/images/rounded_image.dart';
import 'package:bliguh/features/shop/controllers/home_controller.dart';
import 'package:bliguh/utils/constants/colors.dart';
import 'package:bliguh/utils/constants/sizes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FrameSlider extends StatelessWidget {
  const FrameSlider({
    super.key,
    required this.banners,
  });

  final List<String> banners;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(BannerController());
    return Obx(() {
      //Loader
      if (controller.isLoading.value)
        return const ShimmerEffect(width: double.infinity, height: 190);

      // No data found
      if (controller.banners.isEmpty) {
        return const Center(
          child: Text('No Data Found'),
        );
      } else {
        return Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(TSizes.sm - 1),
              child: Container(
                width: double.infinity, // Set the width to full width

                height: 120, // Set the desired height
                child: Obx(
                  () => SizedBox(
                    height: 110,
                    child: CarouselSlider(
                      options: CarouselOptions(
                          viewportFraction:
                              1.0, // Ensure each child takes full width
                          autoPlay: true,
                          onPageChanged: (index, _) =>
                              controller.updatePageIndicator(index)),
                      items: controller.banners
                          .map((banner) => RoundedImage(
                                imageUrl: banner.imageUrl,
                                isNetworkImage: true,
                                onPressed: () =>
                                    Get.toNamed(banner.targetScreen),
                              ))
                          .toList(),
                    ),
                  ),
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
                      for (int i = 0; i < controller.banners.length; i++)
                        CircularContainer(
                          width: controller.carouselCurrentIndex.value == i
                              ? 17
                              : 6,
                          height: 3,
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
    });
  }
}
