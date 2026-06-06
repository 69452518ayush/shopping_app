import 'package:ecommerce/common/styles/padding.dart';
import 'package:ecommerce/common/widgets/appbar/appBar.dart';
import 'package:ecommerce/common/widgets/brands/brand_card.dart';
import 'package:ecommerce/common/widgets/layout/grid_layout.dart';
import 'package:ecommerce/common/widgets/text/section_heading.dart';
import 'package:ecommerce/features/shop/controller/brand/brand_controller.dart';
import 'package:ecommerce/features/shop/models/brand_model.dart';
import 'package:ecommerce/features/shop/screens/brands/brand_products.dart';
import 'package:ecommerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BrandScreen extends StatelessWidget {
  const BrandScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = BrandController.instance;
    return Scaffold(
      appBar: UAppBar(
        showBackArrow: true,
        title: Text('Brand', style: Theme.of(context).textTheme.headlineSmall),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: UPadding.screenPadding,
          child: Column(
            children: [
              /// [Text] - Brands
              USectionHeading(title: 'Brands', showActonButton: false),
              SizedBox(height: USizes.spaceBtwItems),

              /// List of Brands
              Obx(() {
                // loading
                if (controller.isLoading.value) {
                  return Center(child: CircularProgressIndicator());
                }
                // Empty State
                if (controller.allBrands.isEmpty) {
                  return Center(child: Text("Brands are not empty"));
                }
                return UGridLayout(
                  itemCount: controller.allBrands.length,

                  itemBuilder: (context, index) {
                    BrandModel brand = controller.allBrands[index];
                    return UBrandCard(
                      onTap: () => Get.to(() => BrandProductsScreen()),
                      brand: brand,
                    );
                  },
                  mainAxisExtent: 80,
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
