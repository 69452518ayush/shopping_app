import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce/features/authentication/controller/home/home_controller.dart';
import 'package:ecommerce/features/shop/screens/home/widgets/banners_dot_navigation.dart';
import 'package:flutter/material.dart';

import '../../../../../common/widgets/images/rounded_images.dart';
import '../../../../../utils/constants/sizes.dart';

class UPromoSlider extends StatelessWidget {
  const UPromoSlider({super.key, required this.banners});

  final List<String> banners;

  @override
  Widget build(BuildContext context) {
    final controller = HomeController.instance;
    return Column(
      children: [
        CarouselSlider(
          items: banners
              .map((banner) => URoundedImage(imageUrl: banner))
              .toList(),

          /*Image(image: AssetImage(UImages.homeBanner2)),
            Image(image: AssetImage(UImages.homeBanner3)),
            Image(image: AssetImage(UImages.homeBanner4)),
            Image(image: AssetImage(UImages.homeBanner5)),*/
          options: CarouselOptions(viewportFraction: 1.0,onPageChanged: (index, reason) => controller.onPageChanged(index),),
          carouselController: controller.carouselController,
        ),
        SizedBox(height: USizes.spaceBtwItems),
        BannerDotNavigation(),
      ],
    );
  }
}
