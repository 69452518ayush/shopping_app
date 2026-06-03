import 'package:ecommerce/common/widgets/images/circular_image.dart';
import 'package:flutter/material.dart';

import '../../../utils/constants/sizes.dart';
import '../../../utils/helpers/helper_function.dart';

class UVerticalImageText extends StatelessWidget {
  const UVerticalImageText({
    super.key,
    required this.title,
    required this.image,
    required this.textColor,
    this.backgroundColor,
    this.onTap,
  });

  final String title, image;
  final Color textColor;
  final Color? backgroundColor;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    bool dark = UHelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          /// Circular Image
          UCircularImage(image: image,
            height: 56,
            width: 56,
            isNetworkImage: true,
          ),
          /*UCircularContainer(
            height: 56,
            width: 56,
            backgroundColor:
                backgroundColor ?? (dark ? UColors.dark : UColors.light),
            padding: EdgeInsets.all(USizes.sm),
            child: Image(
              image: AssetImage(image),
              fit: BoxFit.cover,
              color: dark ? UColors.light : UColors.dark,
            ),
          ),*/
          SizedBox(height: USizes.spaceBtwItems / 2),

          /// Title
          SizedBox(
            width: 55,
            child: Text(
              title,
              style: Theme.of(
                context,
              ).textTheme.labelMedium!.apply(color: textColor),
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
