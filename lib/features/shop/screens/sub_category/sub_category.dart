import 'package:ecommerce/common/styles/padding.dart';
import 'package:ecommerce/common/widgets/appbar/appBar.dart';
import 'package:ecommerce/common/widgets/shimmer/horizontal_product_shimmer.dart';
import 'package:ecommerce/common/widgets/text/section_heading.dart';
import 'package:ecommerce/features/shop/controller/category/category_controller.dart';
import 'package:ecommerce/features/shop/models/category_models.dart';
import 'package:ecommerce/features/shop/models/product_model.dart';
import 'package:ecommerce/features/shop/screens/all_products/all_products.dart';
import 'package:ecommerce/utils/constants/sizes.dart';
import 'package:ecommerce/utils/helpers/cloud_helpers_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/widgets/products/product_cards/product_card_horizontal.dart';

class SubCategoryScreen extends StatelessWidget {
  const SubCategoryScreen({super.key, required this.category});

  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    final controller = CategoryController.instance;
    return Scaffold(
      appBar: UAppBar(
        showBackArrow: true,
        title: Text(
          category.name,
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: UPadding.screenPadding,
          child: Column(
            children: [
              FutureBuilder(
                future: controller.getCategoryProduct(categoryId: category.id),
                builder: (context, snapshot) {
                  /// Handle Loader, Error , Empty
                  const loader = UHorizontalProductShimmer();
                  final widget = UCloudHelperFunctions.checkMultiRecordState(
                    snapshot: snapshot, loader: loader
                  );
                  if (widget != null) return widget;

                  // Data Found Subcategories Found
                  List<CategoryModel> subCategories = snapshot.data!;
                  return ListView.builder(
                    shrinkWrap: true,
                    itemCount: subCategories.length,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      CategoryModel subCategory = subCategories[index];

                      /// Fetch Products for sub Category
                      return FutureBuilder(
                        future: controller.getCategoryProduct(
                          categoryId: category.id,
                        ),
                        builder: (context, snapshot) {
                          /// Handle Loader, Error, Empty
                          const loader = UHorizontalProductShimmer();
                          final widget =
                              UCloudHelperFunctions.checkMultiRecordState(
                                snapshot: snapshot,loader: loader
                              );
                          if (widget != null) return widget;

                          /// Data Found - Products Found
                          List<ProductModel> products = snapshot.data!;
                          return Column(
                            children: [
                              USectionHeading(
                                title: subCategory.name,
                                onPressed: () => Get.to(() => AllProductsScreen(title: subCategory.name,
                                futureMethod:  controller.getCategoryProduct(categoryId: subCategory.id,limit: -1),
                                )),
                              ),
                              SizedBox(height: USizes.spaceBtwItems / 2),

                              /// Horizontal Product Card
                              SizedBox(
                                height: 120,
                                child: ListView.separated(
                                  separatorBuilder: (context, index) =>
                                      SizedBox(width: USizes.spaceBtwItems / 2),
                                  itemCount: products.length,
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (context, index) {
                                    ProductModel product = products[index];
                                    return UProductCartHorizontal(
                                      product: product,
                                    );
                                  },
                                ),
                              ),
                            ],
                          );
                        },
                      );
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
