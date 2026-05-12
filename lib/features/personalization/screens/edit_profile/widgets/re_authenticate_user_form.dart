import 'package:ecommerce/common/styles/padding.dart';
import 'package:ecommerce/common/widgets/appbar/appBar.dart';
import 'package:ecommerce/common/widgets/button/elevated_button.dart';
import 'package:ecommerce/features/personalization/controller/user_controller.dart';
import 'package:ecommerce/utils/constants/sizes.dart';
import 'package:ecommerce/utils/validators/validations.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../utils/constants/texts.dart';

class ReAuthenticateUserForm extends StatelessWidget {
  const ReAuthenticateUserForm({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    return   Scaffold(
      appBar: UAppBar(showBackArrow: true,title: Text('Re-Authenticate User'),),
      body: SingleChildScrollView(
        child: Padding(
            padding:UPadding.screenPadding,
        child: Form(
          key: controller.reAuthFormKey,
            child: Column(
          children: [
            /// Email
            Obx(
                () => TextFormField(
                controller: controller.email,
                validator:  UValidator.validateEmail,
                decoration: InputDecoration(
                  prefixIcon: Icon(Iconsax.direct_right),
                  labelText: UTexts.email
                ),
              ),
            ),
            SizedBox(height: USizes.spaceBtwSections,),
            /// Password
            Obx(
              () => TextFormField(
                controller: controller.password,
                obscureText: controller.isPasswordVisible.value,
                validator: (value) =>  UValidator.validateEmptyText('Password', value),
                decoration: InputDecoration(
                    prefixIcon: Icon(Iconsax.direct_right),
                    labelText: UTexts.password,
                  suffixIcon: IconButton(onPressed: () => controller.isPasswordVisible.toggle(), icon: Icon(controller.isPasswordVisible.value ? Iconsax.eye :Iconsax.eye_slash))
                ),
              ),
            ),
            /// Verify  Button
            UElevatedButton(onPressed:  controller.reAuthenticateUser, child: Text('Verified'))
          ],
        )),),
      ),
    );
  }
}
