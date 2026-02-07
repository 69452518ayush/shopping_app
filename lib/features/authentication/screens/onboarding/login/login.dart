import 'package:ecommerce/common/styles/padding.dart';
import 'package:ecommerce/features/authentication/screens/onboarding/login/widgets/login_form.dart';
import 'package:ecommerce/features/authentication/screens/onboarding/login/widgets/login_header.dart';
import 'package:ecommerce/utils/constants/sizes.dart';
import 'package:ecommerce/utils/constants/texts.dart';
import 'package:flutter/material.dart';
import '../../../../../common/widgets/button/social_buttons.dart';
import '../../../../../common/widgets/login_signup/form_divider.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: UPadding.screenPadding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              /// ----- [Header]-------
              /// Title
              ULoginHeader(),

              /// Header
              SizedBox(height: USizes.spaceBtwSections),

              /// ------[Form]-----
              ULoginForm(),
              SizedBox(height: USizes.spaceBtwSections),

              /// -----[Divider]------
              // UFormDivider(title: UTexts.orSignInWith),
              UFormDivider(title: UTexts.orSignInWith),

              SizedBox(height: USizes.spaceBtwSections),

              /// -----[Footer]------
              USocialButton(),
            ],
          ),
        ),
      ),
    );
  }
}
