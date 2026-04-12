import 'package:flutter/material.dart';

import '../../../utils/constants/enums.dart';
import '../../../utils/constants/images.dart' show UImages;
import '../../../utils/constants/sizes.dart';
import '../customs_shapes/clipper/rounded_container.dart';
import '../images/rounded_images.dart';
import '../text/brand_title_with_verify_icon.dart';

class UBrandCard extends StatelessWidget {
  const UBrandCard({super.key});

  @override
  Widget build(BuildContext context) {
    return URoundedContainer(
      width: 170.0,
      showBorder: true,
      padding: EdgeInsets.all(USizes.sm),
      backgroundColor: Colors.transparent,
      child: Row(
        children: [
          /// Brand Image
          URoundedImage(imageUrl: UImages.bataLogo),
          SizedBox(width: USizes.spaceBtwItems / 2),

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Brand Name & verify Icon
              UBrandTitleWithVerifyIcon(
                title: 'Bata',
                brandTextSizes: TextSizes.large,
              ),

              /// Text
              Text(
                '172',
                style: Theme.of(context).textTheme.labelMedium,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
