import 'package:ecommerce/common/widgets/shimmer/brands_shimmer.dart';
import 'package:ecommerce/common/widgets/text/section_heading.dart';
import 'package:ecommerce/features/shop/controller/brand/brand_controller.dart';
import 'package:ecommerce/features/shop/controller/category/category_controller.dart';
import 'package:ecommerce/features/shop/models/brand_model.dart';
import 'package:ecommerce/features/shop/screens/brands/all_brands.dart';
import 'package:ecommerce/features/shop/screens/store/widgets/category_tab.dart';
import 'package:ecommerce/features/shop/screens/store/widgets/store_primary_header.dart';

import 'package:ecommerce/utils/constants/sizes.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/widgets/appbar/tabbar.dart';
import '../../../../common/widgets/brands/brand_card.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = CategoryController.instance;
    final brandController = Get.put(BrandController());
    return DefaultTabController(
      length: controller.featuredCategories.length,
      child: Scaffold(
        body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxScrolled) {
            return [
              SliverAppBar(
                automaticallyImplyLeading: false,
                expandedHeight: 320,
                pinned: true,
                floating: false,
                flexibleSpace: SingleChildScrollView(
                  child: Column(
                    children: [
                      /// Primary Header
                      UStorePrimaryHeader(),
                      SizedBox(height: USizes.spaceBtwItems),
                      Column(
                        children: [
                          USectionHeading(
                            title: "Brands",
                            onPressed: () => Get.to(() => BrandScreen()),
                          ),

                          /// Brands Cards
                          SizedBox(
                            height: USizes.brandCardHeight,
                            child: Obx(() {
                              // loading State
                              if (brandController.isLoading.value) {
                                return UBrandShimmer();
                              }
                              // Empty State
                              if (brandController.featureBrands.isEmpty) {
                                return Text('Brands not Found!');
                              }
                              // Data Found State
                              return ListView.separated(
                                separatorBuilder: (context, index) =>
                                    SizedBox(width: USizes.spaceBtwItems),
                                itemCount: brandController.featureBrands.length,
                                scrollDirection: Axis.horizontal,
                                shrinkWrap: true,
                                itemBuilder: (context, index) {
                                  BrandModel brand =
                                      brandController.featureBrands[index];
                                  return SizedBox(
                                    width: USizes.brandCardWidth,
                                    child: UBrandCard(brand: brand),
                                  );
                                },
                              );
                            }),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                bottom: UTabBar(
                  tabs: controller.featuredCategories
                      .map((category) => Tab(child: Text(category.name)))
                      .toList(),
                ),
              ),
            ];
          },
          body: TabBarView(
            children: controller.featuredCategories
                .map((category) => UCategoryTab())
                .toList(),
          ),
        ),
      ),
    );
  }
}
