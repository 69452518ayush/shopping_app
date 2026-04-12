import 'package:ecommerce/common/widgets/customs_shapes/clipper/rounded_container.dart';
import 'package:ecommerce/common/widgets/icons/circular_icon.dart';
import 'package:ecommerce/common/widgets/images/rounded_images.dart';
import 'package:ecommerce/utils/constants/colors.dart';
import 'package:ecommerce/utils/helpers/helper_function.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import '../../../utils/constants/images.dart';
import '../../../utils/constants/sizes.dart';
import '../../styles/shadow.dart';
import '../../widgets/text/brand_title_text.dart';
import '../../widgets/text/brand_title_with_verify_icon.dart';
import '../../widgets/text/product_price_text.dart';
import '../../widgets/text/product_title_text.dart';

class UProductCartVertical extends StatelessWidget {
  const UProductCartVertical({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = UHelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: () {},
      child: Container(
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
                      padding: const EdgeInsets.symmetric(
                        horizontal: USizes.sm,
                        vertical: USizes.xs,
                      ),
                      child: Text(
                        '20%',
                        style: Theme.of(
                          context,
                        ).textTheme.labelLarge!.apply(color: UColors.black),
                      ),
                    ),
                  ),

                  ///  Favourite Button
                  Positioned(
                    right: 0,
                    top: 0,
                    child: UCircularIcon(
                      icon: Iconsax.heart5,
                      color: Colors.red,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: USizes.spaceBtwItems / 2),

            /// Details
            Padding(
              padding: const EdgeInsets.only(left: USizes.sm),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ///ProductTitle
                  UProductTitleText(title: 'Blue Bata Shoes', smallSize: true),
                  SizedBox(height: USizes.spaceBtwItems / 2),

                  /// Product Brand
                  UBrandTitleWithVerifyIcon(title: 'Bata'),

                  /// Product Price  & Add Button
                ],
              ),
            ),
            Spacer(),

            /// Product Details Price & Button
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: USizes.sm),
                  child: UProductPriceText(price: '65'),
                ),
                Container(
                  width: USizes.iconLg * 1.2,
                  height: USizes.iconLg * 1.2,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(USizes.cardRadiusMd),
                      bottomRight: Radius.circular(USizes.productImageRadius),
                    ),
                  ),
                  child: Icon(Iconsax.add, color: Colors.white),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
