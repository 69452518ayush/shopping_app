import 'package:ecommerce/features/authentication/controller/home/home_controller.dart';
import 'package:ecommerce/features/shop/screens/home/widgets/home_appbar.dart';
import 'package:ecommerce/features/shop/screens/home/widgets/home_categories.dart';
import 'package:ecommerce/features/shop/screens/home/widgets/primary_header_container.dart';
import 'package:ecommerce/features/shop/screens/home/widgets/promo_slider.dart';
import 'package:ecommerce/utils/constants/images.dart';
import 'package:ecommerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../common/products/product_carts/product_cart_vertical.dart';
import '../../../../common/widgets/layout/grid_layout.dart';
import '../../../../common/widgets/text/section_heading.dart';
import '../../../../common/widgets/textfields/search_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController());
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            /// Upper part
            Stack(
              children: [
                UPrimaryHeaderContainer(
                  height: USizes.homePrimaryHeaderHeight,
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
              child: Column(
                children: [
                  UPromoSlider(
                    banners: [
                      UImages.homeBanner1,
                      UImages.homeBanner2,
                      UImages.homeBanner3,
                      UImages.homeBanner4,
                      UImages.homeBanner5,
                    ],
                  ),
                  SizedBox(height: USizes.spaceBtwItems),

                  /// Section Heading
                  USectionHeading(title: 'Popular Products'),
                  SizedBox(height: USizes.spaceBtwItems),

                  /// Grid Layout And ProductCard
                  UGridLayout(
                    itemCount: 6,
                    itemBuilder: (BuildContext, int index) {
                      return UProductCartVertical();
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
