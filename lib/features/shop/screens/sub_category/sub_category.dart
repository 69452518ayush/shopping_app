import 'package:ecommerce/common/styles/padding.dart';
import 'package:ecommerce/common/widgets/appbar/appBar.dart';
import 'package:ecommerce/common/widgets/customs_shapes/clipper/rounded_container.dart';
import 'package:ecommerce/common/widgets/images/rounded_images.dart';
import 'package:ecommerce/common/widgets/text/section_heading.dart';
import 'package:ecommerce/utils/constants/colors.dart';
import 'package:ecommerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../common/widgets/icons/circular_icon.dart';
import '../../../../common/widgets/products/product_cards/product_card_horizontal.dart';
import '../../../../utils/constants/images.dart';

class SubCategoryScreen extends StatelessWidget {
  const SubCategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
          appBar: UAppBar(showBackArrow: true,title: Text('Sports',style: Theme.of(context).textTheme.headlineMedium,),),
      body: SingleChildScrollView(
        child: Padding(padding: UPadding.screenPadding,
        child: Column(
          children: [
            /// Sub Category
            USectionHeading(title: 'Sports Shoes',onPressed: (){},),
            SizedBox(height: USizes.spaceBtwItems/2,),
            /// Container Product Card
            SizedBox(
                height: 120,
                child: ListView.separated(
                  separatorBuilder: (context, index) => SizedBox(width: USizes.spaceBtwItems/2,),
                    itemCount: 10,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                  return UProductCartHorizontal();
                })),
            USectionHeading(title: 'Sports Shoes',onPressed: (){},),
            SizedBox(height: USizes.spaceBtwItems/2,),
            /// Container Product Card
            SizedBox(
                height: 120,
                child: ListView.separated(
                    separatorBuilder: (context, index) => SizedBox(width: USizes.spaceBtwItems/2,),
                    itemCount: 10,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return UProductCartHorizontal();
                    }))
          ],
        ),
        ),
      ),
    );
  }
}