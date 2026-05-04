import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../utils/constants/sizes.dart';
import '../../products/product_carts/product_cart_vertical.dart';
import '../layout/grid_layout.dart' show UGridLayout;

class USortableProduct extends StatelessWidget {
  const USortableProduct({super.key});

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
          itemCount: 10,
          itemBuilder: (context, index) => UProductCartVertical(),
        ),
      ],
    );
  }
}
