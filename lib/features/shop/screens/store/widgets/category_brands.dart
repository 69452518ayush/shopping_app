import 'package:ecommerce/common/widgets/shimmer/boxes_shimmer.dart';
import 'package:ecommerce/common/widgets/shimmer/list_tile_shimmer.dart';
import 'package:ecommerce/features/shop/controller/brand/brand_controller.dart';
import 'package:ecommerce/features/shop/models/category_models.dart';
import 'package:ecommerce/utils/constants/sizes.dart';
import 'package:ecommerce/utils/helpers/cloud_helpers_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../common/widgets/brands/brand_showcase.dart';
import '../../../../../utils/constants/images.dart';

class CategoryBrands extends StatelessWidget {
  const CategoryBrands({super.key, required this.category});
 final CategoryModel category;
  @override
  Widget build(BuildContext context) {
    final controller = BrandController.instance;
    return FutureBuilder(
      future : controller.getBrandForCategory(category.id),
      builder: (context , snapshot){
/// Handle Loader ,No Records , error
        const loader = Column(
          children: [
            UListTileShimmer(),
            SizedBox(height: USizes.spaceBtwItems,),
            UBoxesShimmer(),
            SizedBox(height: USizes.spaceBtwItems,),
          ],
        );
       final widget =  UCloudHelperFunctions.checkMultiRecordState(snapshot: snapshot, loader: loader);
       if(widget != null) return  widget;
        
       
       final brands = snapshot.data!;
        return ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: brands.length,
          itemBuilder: (context , index){
            final brand = brands[index];
            return FutureBuilder(future: controller.getBrandProducts(brand.id,limit: 3),
                builder: (context ,snapshot){
              /// Handle loader , No Records, Error
                  final widget = UCloudHelperFunctions.checkMultiRecordState(snapshot: snapshot);
                  if(widget != null) return widget;
                  /// Products found
                  final products = snapshot.data!;
              return UBrandShowcase(images: products.map((product) => product.thumbnail ).toList(), brand: brand);
                });

          },
        );
      },

    );
  }
}
