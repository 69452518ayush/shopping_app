import 'package:ecommerce/common/widgets/button/elevated_button.dart';
import 'package:ecommerce/features/authentication/controller/onboarding/onboarding_controller.dart';
import 'package:ecommerce/features/authentication/screens/onboarding/widgets/onboarding_dot_navigation.dart';
import 'package:ecommerce/features/authentication/screens/onboarding/widgets/onboarding_page.dart';
import 'package:ecommerce/features/authentication/screens/onboarding/widgets/onboarding_skip.dart';
import 'package:ecommerce/features/authentication/screens/onboarding/widgets/onboardingnext_button.dart';
import 'package:ecommerce/utils/constants/images.dart';
import 'package:ecommerce/utils/constants/texts.dart';
import 'package:ecommerce/utils/helpers/device_helpers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:lottie/lottie.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../utils/constants/sizes.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OnBoardingController());
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: USizes.defaultSpace),
        child: Stack(
          children: [
            /// Scrollable Page
            PageView(
              controller: controller.pageController,
              onPageChanged: controller.updatePageIndicator,
              children: [
                OnBoardingPage(
                  animation: UImages.onboarding1Animation,
                  title: UTexts.onboardingTitle1,
                  subtitle: UTexts.onboardingSubTitle1,
                ), // Padding
                OnBoardingPage(
                  animation: UImages.onboarding2Animation,
                  title: UTexts.onboardingTitle2,
                  subtitle: UTexts.onboardingSubTitle2,
                ),
                OnBoardingPage(
                  animation: UImages.onboarding3Animation,
                  title: UTexts.onboardingTitle2,
                  subtitle: UTexts.onboardingSubTitle3,
                ),
              ],
            ),

            /// Indicator
            OnBoardingDotNavigation(),

            /// Bottom Button
            OnboardingNextButton(),

            /// Skip Button
            OnBoardingSkipButton(),
          ],
        ),
      ),
    );
  }
}
