import 'package:ecommerce/common/widgets/appbar/appBar.dart';
import 'package:ecommerce/features/authentication/controller/home/home_controller.dart';
import 'package:ecommerce/features/shop/screens/home/widgets/home_appbar.dart';
import 'package:ecommerce/features/shop/screens/home/widgets/home_categories.dart';
import 'package:ecommerce/features/shop/screens/home/widgets/primary_header_container.dart';
import 'package:ecommerce/features/shop/screens/home/widgets/promo_slider.dart';
import 'package:ecommerce/utils/constants/images.dart';
import 'package:ecommerce/utils/constants/sizes.dart';
import 'package:ecommerce/utils/constants/texts.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../common/widgets/textfields/search_bar.dart';
import '../../../../utils/constants/colors.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController());
    return Scaffold(
      body: Column(
        children: [
          /// Upper part
          Stack(
            children: [
              UPrimaryHeaderContainer(
                child: Column(
                  children: [
                    /// HomeAppBar
                    UHomeAppBar(),
                    SizedBox(height: USizes.spaceBtwSections),
                    /// Home Categories
                    UHomeCategories(),
                  ],
                ),
              ),
              /// SearchBar
              USearchBar(),
            ],
          ),
          SizedBox(height: USizes.defaultSpace),

          /// lower part
          /// Banner
          Padding(
            padding: const EdgeInsets.all(USizes.defaultSpace),
            child: UPromoSlider(
              banners: [
                UImages.homeBanner1,
                UImages.homeBanner2,
                UImages.homeBanner3,
                UImages.homeBanner4,
                UImages.homeBanner5,
              ],
            ),
          ),
        ],
      ),
    );
  }
}
