import 'package:flutter/material.dart';

import '../../../utils/constants/sizes.dart';
import '../../products/product_carts/product_cart_vertical.dart';

class UGridLayout extends StatelessWidget {
  const UGridLayout({
    super.key,
    required this.itemCount,
    this.mainAxisCount = 200,
    required this.itemBuilder,
  });

  final int itemCount;
  final double? mainAxisCount;
  final Widget Function(BuildContext, int index) itemBuilder;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: NeverScrollableScrollPhysics(),
      itemCount: itemCount,
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        mainAxisSpacing: USizes.gridViewSpacing,
        crossAxisSpacing: USizes.gridViewSpacing,
        mainAxisExtent: 288,
        crossAxisCount: 2,
      ),
      itemBuilder: itemBuilder
    );
  }
}
