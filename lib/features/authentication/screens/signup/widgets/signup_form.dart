import 'package:ecommerce/features/authentication/controller/signup/signup_controller.dart';
import 'package:ecommerce/features/authentication/screens/signup/widgets/privacy_policy_check_box.dart';
import 'package:ecommerce/utils/validators/validations.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../../common/widgets/button/elevated_button.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/texts.dart';

class USignupForm extends StatelessWidget {
  const USignupForm({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = SignUpController.instance;
    return Form(
      key: controller.signUpFormKey,
      child: Column(
        children: [
          /// First and LastName
          Row(
            children: [
              /// First Name
              Expanded(
                child: TextFormField(
                  validator: (value) => UValidator.validateEmptyText('First Name', value),
                  decoration: InputDecoration(
                    labelText: UTexts.firstName,
                    prefixIcon: Icon(Iconsax.user),
                  ),
                ),
              ),
              SizedBox(width: USizes.spaceBtwInputFields),
              // Last Name
              Expanded(
                child: TextFormField(
                  validator: (value)=> UValidator.validateEmptyText('Last Name', value),
                  decoration: InputDecoration(
                    labelText: UTexts.lastName,
                    prefixIcon: Icon(Iconsax.user),
                  ),
                ),
              ),
            ],
          ),
          TextFormField(
            validator: (value)=> UValidator.validateEmail(value),
            decoration: InputDecoration(
              labelText: UTexts.email,
              prefixIcon: Icon(Iconsax.direct_right),
            ),
          ),
          SizedBox(height: USizes.spaceBtwInputFields),
          TextFormField(
            validator: (value) => UValidator.validatePhoneNumber(value),
            decoration: InputDecoration(
              labelText: UTexts.phoneNumber,
              prefixIcon: Icon(Iconsax.call),
            ),
          ),
          SizedBox(height: USizes.spaceBtwInputFields),
          TextFormField(
            validator: (value) => UValidator.validatePassword(value),
            decoration: InputDecoration(
              labelText: UTexts.password,
              prefixIcon: Icon(Iconsax.password_check),
              suffixIcon: Icon(Iconsax.eye),
            ),
          ),
          SizedBox(height: USizes.spaceBtwInputFields / 2),
          UFormPrivacyCheckbox(),
          SizedBox(height: USizes.spaceBtwItems),
      
          /// Create Account
          UElevatedButton(onPressed:  controller.registerUser, child: Text(UTexts.createAccount)),
        ],
      ),
    );
  }
}
