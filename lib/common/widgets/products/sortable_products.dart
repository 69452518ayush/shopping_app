import 'package:ecommerce/features/shop/controller/product/all_product_controller.dart';
import 'package:ecommerce/features/shop/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:iconsax/iconsax.dart';

import '../../../utils/constants/sizes.dart';
import '../../products/product_carts/product_cart_vertical.dart';
import '../layout/grid_layout.dart' show UGridLayout;

class USortableProduct extends StatelessWidget {
   USortableProduct({super.key,required this.products}) ;


List<ProductModel> products;
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AllProductController());
    controller.assignProducts(products);
    return Column(
      children: [
        /// Filter Field
        DropdownButtonFormField(
          value: controller.selectedSortOption.value,
          decoration: InputDecoration(prefixIcon: Icon(Iconsax.sort)),
          items: ['Name', 'Lower Price', 'Higher Price', 'Sale', 'Newest'].map((
            filter,
          ) {
            return DropdownMenuItem(child: Text(filter), value: filter);
          }).toList(),
          onChanged: (value) => controller.sortProducts(value!),
        ),
        SizedBox(height: USizes.spaceBtwSections),

        /// Products
        UGridLayout(
          itemCount: 10,
          itemBuilder: (context, index) => UProductCartVertical(product: products[index],),
        ),
      ],
    );
  }
}
