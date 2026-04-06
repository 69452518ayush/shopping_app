import 'package:flutter/material.dart';

import '../../../../../common/widgets/customs_shapes/circular_container.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/texts.dart';

class UHomeCategories extends StatelessWidget {
  const UHomeCategories({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        /// SectionHeading
        Text(
          UTexts.popularCategories,
          style: Theme.of(
            context,
          ).textTheme.headlineSmall!.apply(color: UColors.white),
        ),
        SizedBox(height: USizes.spaceBtwSections / 2),
        SizedBox(
          height: 80,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 10,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  /// Circular Image
                  UCircularContainer(height: 56, width: 56,
                  child: Image,),

                  /// Title
                  SizedBox(
                    width: 55,
                    child: Text(
                      "Sport Categories",
                      style: Theme.of(
                        context,
                      ).textTheme.labelMedium!.apply(color: UColors.white),
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ],
    );
  }
}
