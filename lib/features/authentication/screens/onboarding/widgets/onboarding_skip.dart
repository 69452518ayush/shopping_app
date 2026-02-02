import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../utils/helpers/device_helpers.dart';

class OnBoardingSkipButton extends StatelessWidget {
  const OnBoardingSkipButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 0,
      bottom: UDeviceHelper.getAppBarHeight(),
      right: 0,
      child: TextButton(onPressed: () {}, child: Text("Skip")),
    );
  }
}