import 'package:ecommerce/features/shop/models/brand_model.dart';
import 'package:flutter/material.dart';

import '../../../utils/constants/enums.dart';
import '../../../utils/constants/images.dart' show UImages;
import '../../../utils/constants/sizes.dart';
import '../customs_shapes/clipper/rounded_container.dart';
import '../images/rounded_images.dart';
import '../text/brand_title_with_verify_icon.dart';

class UBrandCard extends StatelessWidget {
  const UBrandCard({
    super.key,
    this.showBorder = true,
    this.onTap,
    required this.brand,
  });

  final bool showBorder;
  final VoidCallback? onTap;
  final BrandModel brand;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: URoundedContainer(
        height: USizes.brandCardHeight,
        showBorder: showBorder,
        padding: EdgeInsets.all(USizes.sm),
        backgroundColor: Colors.transparent,
        child: Row(
          children: [
            /// Brand Image
            Flexible(child: URoundedImage(imageUrl: brand.image,
            isNetworkImage: true,
            backgroundColor: Colors.transparent,
            )),
            SizedBox(width: USizes.spaceBtwItems / 2),

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// Brand Name & verify Icon
                UBrandTitleWithVerifyIcon(
                  title: brand.name,
                  brandTextSizes: TextSizes.large,
                ),

                /// Text
                Text(
                  '${brand.productsCount} products',
                  style: Theme.of(context).textTheme.labelMedium,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
