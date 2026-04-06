import 'package:ecommerce/features/shop/screens/home/widgets/home_appbar.dart';
import 'package:ecommerce/features/shop/screens/home/widgets/home_categories.dart';
import 'package:ecommerce/features/shop/screens/home/widgets/primary_header_container.dart';
import 'package:ecommerce/utils/constants/sizes.dart';

import 'package:flutter/material.dart';

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
            UHomeCategories(),
          ],
        ),
      ),
    );
  }
}
