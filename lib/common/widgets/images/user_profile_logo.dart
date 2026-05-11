import 'package:ecommerce/common/widgets/images/circular_image.dart';
import 'package:ecommerce/features/personalization/controller/user_controller.dart';
import 'package:ecommerce/utils/constants/images.dart';
import 'package:flutter/material.dart';

class USerProfileLogo extends StatelessWidget {
  const USerProfileLogo({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    bool isProfileAvailable = controller.user.value.profilePicture.isNotEmpty;
    return UCircularImage(
      image: isProfileAvailable
          ? controller.user.value.profilePicture
          : UImages.profileIcon,
      height: 120.0,
      width: 120.0,
      borderWidth: 5.0,
      padding: 0,
      isNetworkImage: isProfileAvailable ? true : false,
    );
  }
}
