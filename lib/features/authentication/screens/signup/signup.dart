import 'package:ecommerce/common/styles/padding.dart';
import 'package:ecommerce/common/widgets/button/social_buttons.dart';
import 'package:ecommerce/common/widgets/login_signup/form_divider.dart';
import 'package:ecommerce/features/authentication/controller/signup/signup_controller.dart';

import 'package:ecommerce/features/authentication/screens/signup/widgets/signup_form.dart';
import 'package:ecommerce/utils/constants/sizes.dart';
import 'package:ecommerce/utils/constants/texts.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignUpController());
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: UPadding.screenPadding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// ---------HEADER--------------
              /// ----------TITLE-------------
              Text(
                UTexts.signupTitle,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              SizedBox(height: USizes.spaceBtwSections),

              /// ---------FORM----------------
              USignupForm(),
              SizedBox(height: USizes.spaceBtwSections),

              /// ---------DIVIDER-------------
              UFormDivider(title: UTexts.orSignupWith),

              /// ---------FOOTER--------------
              USocialButton(),
            ],
          ),
        ),
      ),
    );
  }
}
