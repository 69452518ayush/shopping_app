import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../authentication/controller/home/home_controller.dart';
import '../../../controller/banner/banner_controller.dart';

class BannerDotNavigation extends StatelessWidget {
  const BannerDotNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    //final controller = HomeController.instance;
    final bannerController = Get.put(BannerController());
    return Obx(
      () => SmoothPageIndicator(
        effect: ExpandingDotsEffect(dotHeight: 6.0),
        controller: PageController(
          initialPage: bannerController.currentIndex.value,
        ),
        count: bannerController.banners.length,
      ),
    );
  }
}
