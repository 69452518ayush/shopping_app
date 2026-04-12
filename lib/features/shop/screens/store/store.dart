import 'package:ecommerce/common/widgets/customs_shapes/clipper/rounded_container.dart';
import 'package:ecommerce/common/widgets/images/rounded_images.dart';
import 'package:ecommerce/common/widgets/text/brand_title_with_verify_icon.dart';
import 'package:ecommerce/common/widgets/text/section_heading.dart';
import 'package:ecommerce/features/shop/screens/store/widgets/store_primary_header.dart';
import 'package:ecommerce/utils/constants/enums.dart';
import 'package:ecommerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

import '../../../../common/widgets/brands/brand_card.dart';
import '../../../../utils/constants/images.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxScrolled) {
          return [
            SliverAppBar(
              automaticallyImplyLeading: false,
              expandedHeight: 300,
              pinned: true,
              floating: true,
              flexibleSpace: Column(
                children: [
                  /// Primary Header
                  UStorePrimaryHeader(),
                  SizedBox(height: USizes.spaceBtwItems),
                  Column(
                    children: [
                      USectionHeading(title: "Brands", onPressed: () {}),

                      /// Brands Cart
                      SizedBox(
                        height: 70.0,
                        child: ListView.separated(
                          separatorBuilder: (context, index) =>
                              SizedBox(width: USizes.spaceBtwItems),
                          itemCount: 10,
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          itemBuilder: (context, index) => UBrandCard(),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ];
        },
        body: Container(),
      ),
    );
  }
}
