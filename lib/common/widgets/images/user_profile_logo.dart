import 'package:ecommerce/common/widgets/images/circular_image.dart';
import 'package:flutter/material.dart';

import '../../../utils/constants/images.dart';

class USerProfileLogo extends StatelessWidget {
  const USerProfileLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return UCircularImage(
      image: UImages.profileIcon,
      height: 120.0,
      width: 120.0,
      borderWidth: 5.0,
      padding: 0,
    );
  }
}
