import 'package:flutter/material.dart';

import '../../../../../common/styles/padding.dart';
import '../../../../../common/widgets/customs_shapes/clipper/rounded_container.dart';
import '../../../../../common/widgets/images/circular_image.dart';
import '../../../../../common/widgets/text/brand_title_with_verify_icon.dart';
import '../../../../../common/widgets/text/product_price_text.dart';
import '../../../../../common/widgets/text/product_title_text.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/images.dart';
import '../../../../../utils/constants/sizes.dart';

class UProductMetaData extends StatelessWidget {
  const UProductMetaData({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            URoundedContainer(
              radius: USizes.sm,
              backgroundColor: UColors.yellow.withValues(alpha: 0.8),
              padding: const EdgeInsets.symmetric(
                horizontal: USizes.sm,
                vertical: USizes.xs,
              ),
              child: Text(
                '20%',
                style: Theme.of(
                  context,
                ).textTheme.labelLarge!.apply(color: UColors.black),
              ),
            ),
            SizedBox(width: USizes.spaceBtwItems),
            // Sale price
            Text(
              '\$250',
              style: Theme.of(context).textTheme.titleSmall!.apply(
                decoration: TextDecoration.lineThrough,
              ),
            ),
            SizedBox(width: USizes.spaceBtwItems),
            // Actual Price
            UProductPriceText(price: '150', isLarge: true),
            Spacer(),
            // Share Button
            IconButton(onPressed: () {}, icon: Icon(Icons.share)),
          ],
        ),
        SizedBox(height: USizes.spaceBtwItems / 1.5),
        UProductTitleText(title: 'Apple iPhone16'),
        SizedBox(height: USizes.spaceBtwItems / 1.5),

        /// Product status
        Row(
          children: [
            UProductTitleText(title: 'Status'),
            SizedBox(width: USizes.spaceBtwItems),
            Text('In Stock', style: Theme.of(context).textTheme.titleMedium),
          ],
        ),
        SizedBox(height: USizes.spaceBtwItems / 1.5),
        Row(
          children: [
            UCircularImage(
              padding: 0,
              image: UImages.appleLogo,
              width: 32.0,
              height: 32.0,
            ),
            SizedBox(width: USizes.spaceBtwItems),
            UBrandTitleWithVerifyIcon(title: 'Apple'),
          ],
        ),
      ],
    );
  }
}
