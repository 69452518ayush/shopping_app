import 'package:ecommerce/common/widgets/customs_shapes/clipper/rounded_container.dart';
import 'package:ecommerce/common/widgets/text/product_price_text.dart';
import 'package:ecommerce/common/widgets/text/product_title_text.dart';
import 'package:ecommerce/common/widgets/text/section_heading.dart';
import 'package:ecommerce/utils/constants/colors.dart';
import 'package:ecommerce/utils/constants/sizes.dart';
import 'package:ecommerce/utils/helpers/helper_function.dart';
import 'package:flutter/material.dart';

class UProductAttributes extends StatelessWidget {
  const UProductAttributes({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = UHelperFunctions.isDarkMode(context);
    return Column(
      children: [
        /// Selected Attributes Pricing & Description
        URoundedContainer(
          padding: EdgeInsets.all(USizes.md),
          backgroundColor: dark ? UColors.darkerGrey : UColors.grey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Title , Price & Stock
              Row(
                children: [
                  /// [Text] variation Heading
                  USectionHeading(title: 'Variation', showActonButton: false),
                  SizedBox(width: USizes.spaceBtwItems),
                  Column(
                    children: [
                      /// Price , Sale Price, Stock, Actual Price
                      Row(
                        children: [
                          /// Actual Price
                          UProductTitleText(title: 'Price', smallSize: true),
                          Text(
                            '250',
                            style: Theme.of(context).textTheme.titleSmall!
                                .apply(decoration: TextDecoration.lineThrough),
                          ),
                          SizedBox(width: USizes.spaceBtwItems),

                          /// Sale Price
                          UProductPriceText(price: '200'),
                        ],
                      ),

                      /// Stock Status
                      Row(
                        children: [
                          UProductTitleText(title: 'Stock', smallSize: true),
                          Text(
                            'In Stock',
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),

              /// Attributes Description
              UProductTitleText(title: 'This is a product of iPhone11 with 512 GB storage',smallSize: true,maxLines: 4,)
            ],
          ),
        ),
      ],
    );
  }
}
