import 'package:ecommerce/common/styles/shadow.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/constants/texts.dart';

class USearchBar extends StatelessWidget {
  const USearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      right: USizes.spaceBtwItems,
      left: USizes.spaceBtwItems,
      child: Container(
        height: 60,
        padding: EdgeInsets.symmetric(horizontal: USizes.md),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(USizes.borderRadiusLg),
          color: UColors.white,
          boxShadow: UShadow.searchBarShadow,
        ),
        child: Row(
          children: [
            Icon(Iconsax.search_normal),
            SizedBox(width: USizes.spaceBtwItems),
            Text(
              UTexts.searchBarTitle,
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ],
        ),
      ),
    );
  }
}
