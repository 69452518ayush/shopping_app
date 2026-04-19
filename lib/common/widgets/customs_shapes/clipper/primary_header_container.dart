import 'package:ecommerce/common/widgets/customs_shapes/rounded_edges_container.dart';
import 'package:flutter/material.dart';
import '../circular_container.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/helpers/device_helpers.dart';

class UPrimaryHeaderContainer extends StatelessWidget {
  const UPrimaryHeaderContainer({super.key, required this.child, required this.height});

  final Widget child;
  final double height;

  @override
  Widget build(BuildContext context) {
    return URoundedEdges(
      child: Container(
        height: height,
        color: UColors.primary,
        child: Stack(
          children: [
            ///----------Circular Container------------------
            Positioned(
              top: -150,
              right: -250,
              child: UCircularContainer(
                height: 320,
                width: 320,
                backgroundColor: UColors.white.withValues(alpha: 0.1),
              ),
            ),

            ///----------Circular Container------------------
            Positioned(
              top: 50,
              right: -250,
              child: UCircularContainer(
                height: UDeviceHelper.getScreenHeight(context) * 0.4,
                width: UDeviceHelper.getScreenHeight(context) * 0.4,
                backgroundColor: UColors.white.withValues(alpha: 0.1),
              ),
            ),
            child,
          ],
        ),
      ),
    );
  }
}
