import 'package:ecommerce/common/widgets/shimmer/shimmer_effect.dart';
import 'package:ecommerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class UBrandShimmer extends StatelessWidget {
  const UBrandShimmer({super.key, this.itemCount = 4});

  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (context, index) =>
          SizedBox(width: USizes.spaceBtwItems),
      itemCount: itemCount,
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) =>
          const UShimmerEffect(width: USizes.brandCardWidth, height: USizes.brandCardHeight),
    );
  }
}
