import 'package:ecommerce/utils/helpers/helper_function.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';
import '../../widgets/icons/circular_icon.dart';

class UProductQuantityWithAddRemove extends StatelessWidget {
  const UProductQuantityWithAddRemove({super.key, });



  @override
  Widget build(BuildContext context) {
    bool dark = UHelperFunctions.isDarkMode(context);
    return Row(
      children: [
        UCircularIcon(
          icon: Iconsax.minus,
          width: 32.0,
          height: 32.0,
          size: USizes.iconSm,
          backgroundColor: dark ? UColors.darkerGrey : UColors.light,
          color: dark ? UColors.white : UColors.black,
        ),
        // Counter Text
        SizedBox(width: USizes.spaceBtwItems),
        Text('2', style: Theme.of(context).textTheme.titleSmall),
        SizedBox(width: USizes.spaceBtwItems),

        /// Decrement Button
        UCircularIcon(
          icon: Iconsax.add,
          width: 32.0,
          height: 32.0,
          size: USizes.iconSm,
          backgroundColor: UColors.primary,
          color: UColors.white,
        ),
      ],
    );
  }
}
