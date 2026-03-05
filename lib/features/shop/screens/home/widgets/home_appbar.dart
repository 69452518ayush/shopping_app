import 'package:flutter/material.dart';

import '../../../../../common/products/cart/cart_counter_icon.dart';
import '../../../../../common/widgets/appbar/appBar.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/texts.dart';

class UHomeAppBar extends StatelessWidget {
  const UHomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return UAppBar(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// -------------------------------TITLE--------------------------------
          Text(
            UTexts.homeAppBarTitle,
            style: Theme.of(
              context,
            ).textTheme.labelMedium!.apply(color: UColors.grey),
          ),

          /// -------------------------------SUBTITLE--------------------------------
          Text(
            UTexts.homeAppBarSubTitle,
            style: Theme.of(
              context,
            ).textTheme.headlineSmall!.apply(color: UColors.white),
          ),
        ],
      ),
      action: [UCartCounterIcon()],
    );
  }
}
