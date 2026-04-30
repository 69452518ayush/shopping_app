import 'package:ecommerce/common/styles/padding.dart';
import 'package:ecommerce/common/widgets/button/elevated_button.dart';
import 'package:ecommerce/common/widgets/text/section_heading.dart';
import 'package:ecommerce/features/shop/screens/product_details/widgets/bottom_add_to_cart.dart';
import 'package:ecommerce/features/shop/screens/product_details/widgets/product_attributes.dart';
import 'package:ecommerce/features/shop/screens/product_details/widgets/product_meta_data.dart';
import 'package:ecommerce/features/shop/screens/product_details/widgets/product_thumbnail_and_slider.dart';
import 'package:ecommerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      ///-------[Body]--------------///
      body: SingleChildScrollView(
        child: Column(
          children: [
            ///---------[Product Image with slider]-------------///
            UProductThumbnailAndSlider(),

            ///---------[Product Details]-------------------
            ///---------------Price , Title, Stacks, And Brand
            Padding(
              padding: UPadding.screenPadding,
              child: Column(
                children: [
                  UProductMetaData(),

                  ///-------- Attributes--------
                  UProductAttributes(),
                  SizedBox(height: USizes.spaceBtwSections),

                  ///---------Checkout Button
                  UElevatedButton(onPressed: () {}, child: Text('Checkout')),
                  SizedBox(height: USizes.spaceBtwSections),

                  ///--------------Description--------------
                  USectionHeading(title: 'Description', showActonButton: false),
                  SizedBox(height: USizes.spaceBtwItems),
                  ReadMoreText(
                    'This is a product of iPhone 11 with 512 GB',
                    trimLines: 2,
                    trimMode: TrimMode.Line,
                    trimCollapsedText: 'Show more',
                    trimExpandedText: 'Less',
                    moreStyle: TextStyle(
                      fontSize: 14.0,
                      fontWeight: FontWeight.w800,
                    ),
                    lessStyle: TextStyle(
                      fontSize: 14.0,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: USizes.spaceBtwSections),
          ],
        ),
      ),
      ////-----------------[Bottom Navigation]----------------
      bottomNavigationBar: UBottomAddToCart(),
    );
  }
}
