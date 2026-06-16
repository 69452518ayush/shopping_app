import 'package:ecommerce/common/widgets/shimmer/vertical_product_shimmer.dart';
import 'package:ecommerce/features/shop/controller/category/category_controller.dart';
import 'package:ecommerce/features/shop/models/category_models.dart';
import 'package:ecommerce/features/shop/models/product_model.dart';
import 'package:ecommerce/features/shop/screens/all_products/all_products.dart';
import 'package:ecommerce/features/shop/screens/store/widgets/category_brands.dart';
import 'package:ecommerce/utils/helpers/cloud_helpers_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../common/products/product_carts/product_cart_vertical.dart';
import '../../../../../common/widgets/layout/grid_layout.dart';
import '../../../../../common/widgets/text/section_heading.dart';
 import '../../../../../utils/constants/sizes.dart';

class UCategoryTab extends StatelessWidget {
  const UCategoryTab({super.key, required this.category});
final CategoryModel category;
  @override
  Widget build(BuildContext context) {
    final controller = CategoryController.instance;
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
              USectionHeading(title: "You might like", onPressed: () => Get.to(() => AllProductsScreen(title: category.name,
              futureMethod:  controller.getCategoryProduct(categoryId: category.id,limit: -1),

              ))),
              /// Grid Layout
             FutureBuilder(future: controller.getCategoryProduct(categoryId: category.id,),
                 builder: (context ,snapshot){
                   /// Handle Error, Loader and Empty States
                   const loader = UVerticalProductShimmer();
                   final widget = UCloudHelperFunctions.checkMultiRecordState(snapshot: snapshot);
                   if(widget != null) return widget;

                   /// Data Found
                   List<ProductModel> products = snapshot.data!;
               return  UGridLayout(
                 itemCount: products.length,
                 itemBuilder: (context, index) {
                   ProductModel product = products[index];
                   return UProductCartVertical(product: product);
                 },
               );
                 }),
              SizedBox(height: USizes.spaceBtwSections,)
            ],
          ),
        ),
      ],
    );
  }
}
