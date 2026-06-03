import 'package:ecommerce/common/widgets/text/section_heading.dart';
import 'package:ecommerce/features/shop/controller/category/category_controller.dart';
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

                          /// Brands Cart
                          SizedBox(
                            height: 70.0,
                            child: ListView.separated(
                              separatorBuilder: (context, index) =>
                                  SizedBox(width: USizes.spaceBtwItems),
                              itemCount: 10,
                              scrollDirection: Axis.horizontal,
                              shrinkWrap: true,
                              itemBuilder: (context, index) => SizedBox(
                                width: USizes.brandCardWidth,
                                child: UBrandCard(),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                bottom: UTabBar(
                  tabs: [
                   controller.featuredCategories.map((category) => Tab(child: category.name,)).toList(),
                  ],
                ),
              ),
            ];
          },
          body: TabBarView(children: [controller.featuredCategories.map((category)=> UCategoryTab()).toList()]),

        ),
      ),
    );
  }
}
