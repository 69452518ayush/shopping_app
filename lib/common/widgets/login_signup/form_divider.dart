
import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/images.dart';
import '../../../utils/constants/sizes.dart';

class USocialButton extends StatelessWidget {
  const USocialButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        /// Google
        Container(
          decoration: BoxDecoration(
              border: Border.all(color: UColors.grey),
              borderRadius: BorderRadius.circular(100)
          ),
          child: IconButton(onPressed: (){}, icon: Image.asset(UImages.googleIcon,height: USizes.iconMd,width: USizes.iconMd,)),
        ),
        SizedBox(
          width: USizes.spaceBtwItems,
        ),
        /// Facebook
        Container(
          decoration: BoxDecoration(
              border: Border.all(color: UColors.grey),
              borderRadius: BorderRadius.circular(100)
          ),
          child: IconButton(onPressed: (){}, icon: Image.asset(UImages.facebookIcon,height: USizes.iconMd,width: USizes.iconMd,)),
        )
      ],
    );
  }
}
