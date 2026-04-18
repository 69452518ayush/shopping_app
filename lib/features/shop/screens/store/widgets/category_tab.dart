import 'package:flutter/material.dart';

import '../../../../../common/products/product_carts/product_cart_vertical.dart';
import '../../../../../common/widgets/brands/brand_showcase.dart';
import '../../../../../common/widgets/layout/grid_layout.dart';
import '../../../../../common/widgets/text/section_heading.dart';
import '../../../../../utils/constants/images.dart';
import '../../../../../utils/constants/sizes.dart';

class UCategoryTab extends StatelessWidget {
  const UCategoryTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: USizes.defaultSpace),
          child: Column(
            children: [
              UBrandShowcase(
                images: [
                  UImages.productImage47,
                  UImages.productImage43,
                  UImages.productImage7,
                ],
              ),
              UBrandShowcase(
                images: [
                  UImages.productImage47,
                  UImages.productImage43,
                  UImages.productImage7,
                ],
              ),
              SizedBox(height: USizes.spaceBtwItems),
              USectionHeading(title: "You might like", onPressed: () {}),
              UGridLayout(
                itemCount: 4,
                itemBuilder: (context, index) {
                  return UProductCartVertical();
                },
              ),
              SizedBox(height: USizes.spaceBtwSections,)
            ],
          ),
        ),
      ],
    );
  }
}
