import 'package:ecommerce/common/widgets/brands/brand_card.dart';
import 'package:ecommerce/utils/helpers/helper_function.dart';
import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';
import '../customs_shapes/clipper/rounded_container.dart';

class UBrandShowcase extends StatelessWidget {
  const UBrandShowcase({super.key, required this.images});

  final List<String> images;

  @override
  Widget build(BuildContext context) {
    final dark = UHelperFunctions.isDarkMode(context);
    return URoundedContainer(
      showBorder: true,
      borderColor: UColors.darkGrey,
      backgroundColor: Colors.transparent,
      padding: EdgeInsets.all(USizes.md),
      margin: EdgeInsets.only(bottom: USizes.spaceBtwItems),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// Brand with product count
          UBrandCard(showBorder: false),
          Row(
            children: images
                .map((image) => buildBrandImage(dark, image))
                .toList(),
          ),
        ],
      ),
    );
  }
}

Widget buildBrandImage(bool dark, String image) {
  return Expanded(
    child: URoundedContainer(
      height: 100,
      margin: EdgeInsets.only(right: USizes.sm),
      padding: EdgeInsets.all(USizes.md),
      backgroundColor: dark ? UColors.darkGrey : UColors.light,
      child: Image(image: AssetImage(image), fit: BoxFit.cover),
    ),
  );
}
