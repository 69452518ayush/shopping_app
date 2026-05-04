import 'package:ecommerce/common/widgets/text/section_heading.dart';
import 'package:ecommerce/features/shop/screens/brands/all_brands.dart';
import 'package:ecommerce/features/shop/screens/store/widgets/category_tab.dart';
import 'package:ecommerce/features/shop/screens/store/widgets/store_primary_header.dart';

import 'package:ecommerce/utils/constants/sizes.dart';
import 'package:ecommerce/utils/helpers/helper_function.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/widgets/appbar/tabbar.dart';
import '../../../../common/widgets/brands/brand_card.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = UHelperFunctions.isDarkMode(context);
    return DefaultTabController(
      length: 5,
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
                    Tab(child: Text("Sports")),
                    Tab(child: Text("Furniture")),
                    Tab(child: Text("Electronic")),
                    Tab(child: Text("Clothes")),
                    Tab(child: Text("Cosmetics")),
                  ],
                ),
              ),
            ];
          },
          body: TabBarView(children: [UCategoryTab()]),
        ),
      ),
    );
  }
}
