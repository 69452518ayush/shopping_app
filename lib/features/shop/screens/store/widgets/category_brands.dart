import 'package:ecommerce/common/widgets/shimmer/boxes_shimmer.dart';
import 'package:ecommerce/common/widgets/shimmer/list_tile_shimmer.dart';
import 'package:ecommerce/features/shop/controller/brand/brand_controller.dart';
import 'package:ecommerce/features/shop/models/category_models.dart';
import 'package:ecommerce/utils/constants/sizes.dart';
import 'package:ecommerce/utils/helpers/cloud_helpers_functions.dart';
import 'package:flutter/material.dart';

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

        return UBrandShowcase(
          images: [
            UImages.productImage47,
            UImages.productImage43,
            UImages.productImage7,
          ],
        );
      },

    );
  }
}
