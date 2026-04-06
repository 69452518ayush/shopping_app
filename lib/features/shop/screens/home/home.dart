import 'package:ecommerce/common/widgets/customs_shapes/circular_container.dart';
import 'package:ecommerce/features/shop/screens/home/widgets/home_appbar.dart';
import 'package:ecommerce/features/shop/screens/home/widgets/primary_header_container.dart';
import 'package:ecommerce/utils/constants/sizes.dart';
import 'package:ecommerce/utils/constants/texts.dart';
import 'package:flutter/material.dart';

import '../../../../utils/constants/colors.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: UPrimaryHeaderContainer(
        child: Column(
          children: [
            /// HomeAppBar
            UHomeAppBar(),
            SizedBox(height: USizes.spaceBtwSections),

            /// Home Categories
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
                      UCircularContainer(height: 56, width: 56),

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
        ),
      ),
    );
  }
}
