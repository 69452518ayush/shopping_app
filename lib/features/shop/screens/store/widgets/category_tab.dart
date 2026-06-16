import 'package:ecommerce/features/shop/models/category_models.dart';
import 'package:ecommerce/features/shop/models/product_model.dart';
import 'package:ecommerce/features/shop/screens/store/widgets/category_brands.dart';
import 'package:flutter/material.dart';

import '../../../../../common/products/product_carts/product_cart_vertical.dart';
import '../../../../../common/widgets/layout/grid_layout.dart';
import '../../../../../common/widgets/text/section_heading.dart';
 import '../../../../../utils/constants/sizes.dart';

class UCategoryTab extends StatelessWidget {
  const UCategoryTab({super.key, required this.category});
final CategoryModel category;
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
              CategoryBrands(category: category,),

              SizedBox(height: USizes.spaceBtwItems),
              /// You might light Section Heading
              USectionHeading(title: "You might like", onPressed: () {}),
              /// Grid Layout
              UGridLayout(
                itemCount: 4,
                itemBuilder: (context, index) {
                  return UProductCartVertical(product: ProductModel.empty(),);
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
