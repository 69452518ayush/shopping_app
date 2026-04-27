import 'package:ecommerce/utils/helpers/helper_function.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../common/widgets/appbar/appBar.dart';
import '../../../../../common/widgets/icons/circular_icon.dart';
import '../../../../../common/widgets/images/rounded_images.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/images.dart';
import '../../../../../utils/constants/sizes.dart';

class UProductThumbnailAndSlider extends StatelessWidget {
  const UProductThumbnailAndSlider({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = UHelperFunctions.isDarkMode(context);
    return Container(
      color: dark ? UColors.darkerGrey : UColors.light,
      child: Stack(
        children: [
          /// [Image] Main Image OR ThumbNail
          SizedBox(
            height: 400,
            child: Padding(
              padding: const EdgeInsets.all(USizes.productImageRadius * 2),
              child: Center(
                child: Image(image: AssetImage(UImages.productImage1)),
              ),
            ),
          ),

          ///Image Slider
          Positioned(
            top: USizes.defaultSpace,
            right: 0,
            bottom: 30,
            child: SizedBox(
              height: 80.0,
              child: ListView.separated(
                separatorBuilder: (context, index) =>
                    SizedBox(width: USizes.spaceBtwItems),
                itemCount: 6,
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => URoundedImage(
                  width: 80,
                  backgroundColor: dark ? UColors.dark : UColors.white,
                  padding: EdgeInsets.all(USizes.sm),
                  border: Border.all(color: UColors.primary),
                  imageUrl: UImages.productImage2,
                ),
              ),
            ),
          ),

          /// [AppBar] - Back arrow and Favourite Button
          UAppBar(
            showBackArrow: true,
            action: [UCircularIcon(icon: Iconsax.heart5, color: Colors.red)],
          ),
        ],
      ),
    );
  }
}
