import 'package:ecommerce/common/products/product_carts/product_cart_vertical.dart';
import 'package:ecommerce/common/styles/padding.dart';
import 'package:ecommerce/common/widgets/appbar/appBar.dart';
import 'package:ecommerce/common/widgets/layout/grid_layout.dart';
import 'package:ecommerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class AllProductsScreen extends StatelessWidget {
  const AllProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: UAppBar(showBackArrow: true,title: Text('Popular Products',style: Theme.of(context).textTheme.headlineMedium,),),
      body: SingleChildScrollView(
        child: Padding(padding: UPadding.screenPadding,
        child: USortableProduct(),
        ),

      ),
    );
  }
}

class USortableProduct extends StatelessWidget {
  const USortableProduct({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        /// Filter Field
        DropdownButtonFormField(
          decoration: InputDecoration(prefixIcon: Icon(Iconsax.sort)),
          items: ['Name','Lower Price','Higher Price','Sale','Newest'].map((filter){
            return DropdownMenuItem(child: Text(filter), value: filter);
          }).toList(),
          onChanged: (value){},),
        SizedBox(height: USizes.spaceBtwSections,),
        /// Products
        UGridLayout(itemCount: 10,itemBuilder: (context, index) => UProductCartVertical(),)
      ],
    );
  }
}
