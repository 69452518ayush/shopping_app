import 'package:ecommerce/features/shop/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../common/products/product_carts/product_cart_vertical.dart';
import '../../../../../common/widgets/layout/grid_layout.dart';
import '../../../../../utils/constants/sizes.dart';

class USortableProduct extends StatelessWidget {
  const USortableProduct({super.key, required this.products});

  final List<ProductModel> products;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        /// Filter Field
        DropdownButtonFormField(
          decoration: InputDecoration(prefixIcon: Icon(Iconsax.sort)),
          items: ['Name', 'Lower Price', 'Higher Price', 'Sale', 'Newest'].map((
            filter,
          ) {
            return DropdownMenuItem(child: Text(filter), value: filter);
          }).toList(),
          onChanged: (value) {},
        ),
        SizedBox(height: USizes.spaceBtwSections),

        /// Products
        UGridLayout(
          itemCount: 18,
          itemBuilder: (context, index) =>
              UProductCartVertical(product: products[index]),
        ),
      ],
    );
  }
}
