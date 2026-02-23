import 'package:ecommerce/utils/constants/colors.dart';
import 'package:ecommerce/utils/helpers/device_helpers.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: UDeviceHelper.getScreenHeight(context) * 0.4,
        color: UColors.primary,
        child: Stack(
          children: [
            Positioned(
              top: -150,
              right: -250,
              child: Container(
                height: UDeviceHelper.getScreenHeight(context) * 0.4,
                width: UDeviceHelper.getScreenHeight(context) * 0.4,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(500),
                  color: UColors.white.withValues(alpha: 0.1),
                ),
              ),
            ),
            Positioned(
              top: 50,
              right: -250,
              child: Container(
                height: UDeviceHelper.getScreenHeight(context) * 0.4,
                width: UDeviceHelper.getScreenHeight(context) * 0.4,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(500),
                  color: UColors.white.withValues(alpha: 0.1),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
