import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/images.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/helpers/helper_function.dart';
import '../../widgets/images/rounded_images.dart';
import '../../widgets/text/brand_title_with_verify_icon.dart';
import '../../widgets/text/product_title_text.dart';

class UCartItem extends StatelessWidget {
  const UCartItem({super.key, });



  @override
  Widget build(BuildContext context) {
    bool dark = UHelperFunctions.isDarkMode(context);
    return Row(
      children: [
        /// Product Image
        URoundedImage(
          imageUrl: UImages.productImage2,
          height: 60.0,
          width: 60.0,
          padding: EdgeInsets.all(USizes.md),
          backgroundColor: dark ? UColors.darkerGrey : UColors.light,
        ),

        /// Brand , Name , Variation
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //// Brand
              UBrandTitleWithVerifyIcon(title: 'iPhone'),

              /// Title
              UProductTitleText(title: 'iPhone 11 64 GB'),
              RichText(
                text: TextSpan(
                  children: [
                    /// variation OR Attributes
                    TextSpan(
                      text: 'Color',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    TextSpan(
                      text: 'Green',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    TextSpan(
                      text: 'Storage',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    TextSpan(
                      text: '512GB',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
