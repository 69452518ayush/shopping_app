import 'package:ecommerce/common/styles/padding.dart';
import 'package:ecommerce/common/widgets/button/elevated_button.dart';
import 'package:ecommerce/features/authentication/screens/onboarding/login/widgets/login_form.dart';
import 'package:ecommerce/features/authentication/screens/onboarding/login/widgets/login_header.dart';
import 'package:ecommerce/features/authentication/screens/onboarding/login/widgets/login_social.dart';
import 'package:ecommerce/utils/constants/images.dart';
import 'package:ecommerce/utils/constants/sizes.dart';
import 'package:ecommerce/utils/constants/texts.dart';
import 'package:ecommerce/utils/helpers/helper_function.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../common/widgets/login_signup/form_divider.dart';
import '../../../../../utils/constants/colors.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
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
            UFormDivider(title: UTexts.orSignInWith, ),

            SizedBox(height: USizes.spaceBtwSections),

            /// -----[Footer]------
            USocialButton(),
          ],
        ),
      ),
    );
  }
}
