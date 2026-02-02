import 'package:ecommerce/features/authentication/screens/onboarding/widgets/onboarding_page.dart';
import 'package:ecommerce/utils/constants/images.dart';
import 'package:ecommerce/utils/constants/texts.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../../../utils/constants/sizes.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            children: [
              OnBoardingPage(animation: UImages.onboarding1Animation , title: UTexts.onboardingTitle1, subtitle: UTexts.onboardingSubTitle1,), // Padding
              OnBoardingPage(animation: UImages.onboarding2Animation, title: UTexts.onboardingTitle2, subtitle: UTexts.onboardingSubTitle2,),
              OnBoardingPage(animation: UImages.onboarding3Animation, title: UTexts.onboardingTitle2, subtitle: UTexts.onboardingSubTitle3,),

            ]
          ),
        ],
      ),
    );
  }
}


