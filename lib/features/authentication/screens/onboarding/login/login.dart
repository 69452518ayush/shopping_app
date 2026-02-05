import 'package:ecommerce/common/styles/padding.dart';
import 'package:ecommerce/common/widgets/button/elevated_button.dart';
import 'package:ecommerce/features/authentication/screens/onboarding/login/widgets/login_form.dart';
import 'package:ecommerce/features/authentication/screens/onboarding/login/widgets/login_header.dart';
import 'package:ecommerce/utils/constants/images.dart';
import 'package:ecommerce/utils/constants/sizes.dart';
import 'package:ecommerce/utils/constants/texts.dart';
import 'package:ecommerce/utils/helpers/helper_function.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../utils/constants/colors.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = UHelperFunctions.isDarkMode(context);
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
            UFormDivider(dark: dark),
            SizedBox(height: USizes.spaceBtwSections,),
            /// -----[Footer]------
            USocialButton()
          ],
        ),
      ),

    );
  }
}

class USocialButton extends StatelessWidget {
  const USocialButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        /// Google
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: UColors.grey),
            borderRadius: BorderRadius.circular(100)
          ),
          child: IconButton(onPressed: (){}, icon: Image.asset(UImages.googleIcon,height: USizes.iconMd,width: USizes.iconMd,)),
        ),
        SizedBox(
          width: USizes.spaceBtwItems,
        ),
        /// Facebook
        Container(
          decoration: BoxDecoration(
              border: Border.all(color: UColors.grey),
              borderRadius: BorderRadius.circular(100)
          ),
          child: IconButton(onPressed: (){}, icon: Image.asset(UImages.facebookIcon,height: USizes.iconMd,width: USizes.iconMd,)),
        )
      ],
    );
  }
}

class UFormDivider extends StatelessWidget {
  const UFormDivider({
    super.key,
    required this.dark,
  });

  final bool dark;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: Divider(indent: 60,endIndent: 5,thickness: 0.5,color: dark? UColors.darkGrey :UColors.grey,)),
        Text(UTexts.orSignInWith,style: Theme.of(context).textTheme.labelMedium,),
        Expanded(child: Divider(indent: 5,endIndent: 60,thickness: 0.5,color: dark? UColors.darkGrey :UColors.grey)),
      ],
    );
  }
}
