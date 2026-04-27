import 'package:ecommerce/features/shop/screens/product_details/widgets/product_meta_data.dart';
import 'package:ecommerce/features/shop/screens/product_details/widgets/product_thumbnail_and_slider.dart';

import 'package:ecommerce/utils/helpers/helper_function.dart';
import 'package:flutter/material.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = UHelperFunctions.isDarkMode(context);
    return Scaffold(
      ///-------[Body]--------------///
      body: SingleChildScrollView(
        child: Column(
          children: [
            ///---------[Product Image with slider]-------------///
            UProductThumbnailAndSlider(),

            ///---------[Product Details]-------------------
            ///---------------Price , Title, Stacks, And Brand
            UProductMetaData(),

            ///-------- Attributes--------
            ///---------Checkout Button
            ///--------------Description--------------
            ///--
          ],
        ),
      ),
      ////-----------------[Bottom Navigation]
    );
  }
}
