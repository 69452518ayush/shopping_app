import 'package:flutter/material.dart';

import '../../../../../common/widgets/button/elevated_button.dart';

class OnboardingNextButton extends StatelessWidget {
  const OnboardingNextButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      child: UElevatedButton(onPressed: () {}, child: Text("Next")),
    );
  }
}