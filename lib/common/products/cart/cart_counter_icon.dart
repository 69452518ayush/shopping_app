import 'package:ecommerce/utils/helpers/helper_function.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../utils/constants/colors.dart';

class UCartCounterIcon extends StatelessWidget {
  const UCartCounterIcon({super.key, });

  //final bool dark;

  @override
  Widget build(BuildContext context) {
    bool dark = UHelperFunctions.isDarkMode(context);
    return Stack(
      children: [
        ///---------------------------BagItem-----------------------
        IconButton(
          onPressed: () {},
          icon: Icon(Iconsax.shopping_bag),
          color: dark ? UColors.dark : UColors.light,
        ),

        ///---------------------------Counter Item-----------------------
        Positioned(
          right: 6.0,
          child: Container(
            height: 18,
            width: 18,
            decoration: BoxDecoration(
              color: dark ? UColors.dark : UColors.light,
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Text(
                "2",
                style: Theme.of(
                  context,
                ).textTheme.labelLarge!.apply(fontSizeFactor: 0.8),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
