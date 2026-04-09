import 'package:ecommerce/common/widgets/customs_shapes/clipper/rounded_container.dart';
import 'package:ecommerce/common/widgets/images/rounded_images.dart';
import 'package:ecommerce/utils/constants/colors.dart';
import 'package:ecommerce/utils/helpers/helper_function.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import '../../../utils/constants/images.dart';
import '../../../utils/constants/sizes.dart';
import '../../styles/shadow.dart';

class UProductCartVertical extends StatelessWidget {
  const UProductCartVertical({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = UHelperFunctions.isDarkMode(context);
    return Container(
      width: 180,
      padding: EdgeInsets.all(0.1),
      decoration: BoxDecoration(
        boxShadow: UShadow.verticalProductShadow,
        borderRadius: BorderRadius.circular(USizes.productImageRadius),
      ),
      child: Column(
        /// Thumbnail, Favourite Button and Discount
        children: [
          URoundedContainer(
            width: 180,
            padding: const EdgeInsets.all(USizes.md),
            backgroundColor: dark ? UColors.dark : UColors.light,
            child: Stack(
              children: [
                /// Thumbnail
                URoundedImage(imageUrl: UImages.productImage15),
                /// Discount Tag
                Positioned(
                  top: 12.0,
                  child: URoundedContainer(
                    radius: USizes.md,
                    backgroundColor: UColors.yellow.withValues(alpha: 0.8),
                    padding: const EdgeInsets.symmetric(horizontal: USizes.sm,vertical: USizes.xs),
                    child: Text('20%',style: Theme.of(context).textTheme.labelLarge!.apply(color: UColors.black),),
                  ),
                ),
                ///  Favourite Button
                IconButton(onPressed: (){}, icon: Icon(Iconsax.heart5,color: Colors.red,)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
