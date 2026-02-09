import 'package:ecommerce/features/authentication/screens/foget_password/forget_password.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../../common/widgets/button/elevated_button.dart';
import '../../../../../../utils/constants/sizes.dart';
import '../../../../../../utils/constants/texts.dart';
import '../../../signup/signup.dart';

class ULoginForm extends StatelessWidget {
  const ULoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Email
        TextFormField(
          decoration: InputDecoration(
            prefixIcon: Icon(Iconsax.direct_right),
            labelText: UTexts.email,
          ),
        ),
        SizedBox(height: USizes.spaceBtwInputFields),
        // Password
        TextFormField(
          decoration: InputDecoration(
            prefixIcon: Icon(Iconsax.password_check),
            labelText: UTexts.password,
            suffixIcon: Icon(Iconsax.eye),
          ),
        ),
        SizedBox(height: USizes.spaceBtwInputFields / 2),

        /// Remember me & Forgot Password
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                Checkbox(value: true, onChanged: (value) {}),
                Text(UTexts.rememberMe),
              ],
            ),

            /// Forget Password
            TextButton(onPressed: () => Get.to(() => ForgetPasswordScreen()), child: Text(UTexts.forgetPassword)),
          ],
        ),
        SizedBox(height: USizes.spaceBtwSections),

        /// Sign IN
        UElevatedButton(onPressed: () {}, child: Text(UTexts.signIn)),
        SizedBox(height: USizes.spaceBtwItems / 2),

        /// Create Account
        SizedBox(
          width: double.infinity,
          child: OutlinedButton(
            onPressed: () => Get.to(()=> SignupScreen()),
            child: Text(UTexts.createAccount),
          ),
        ),
      ],
    );
  }
}
