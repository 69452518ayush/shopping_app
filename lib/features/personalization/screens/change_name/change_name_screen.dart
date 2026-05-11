import 'package:ecommerce/common/styles/padding.dart';
import 'package:ecommerce/common/widgets/appbar/appBar.dart';
import 'package:ecommerce/common/widgets/button/elevated_button.dart';
import 'package:ecommerce/features/personalization/controller/change_name_controller.dart';
import 'package:ecommerce/utils/constants/texts.dart';
import 'package:ecommerce/utils/validators/validations.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../utils/constants/sizes.dart';

class ChangeNameScreen extends StatelessWidget {
  const ChangeNameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ChangeNameController());
    return Scaffold(
      /// AppBar
      appBar: UAppBar(
        showBackArrow: true,
        title: Text(
          'Update Name',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: UPadding.screenPadding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// [Text] - Heading
              Text(
                'Update your name to keep your profile accurate and personalized',
                style: Theme.of(context).textTheme.labelMedium,
              ),
              SizedBox(height: USizes.spaceBtwItems),

              /// Forms
              Form(
                key: controller.updateUserFormKey,
                child: Column(
                  children: [
                    // First Name
                    TextFormField(
                      controller: controller.firstName,
                      validator: (value) =>
                          UValidator.validateEmptyText('First Name ', value),
                      decoration: InputDecoration(
                        labelText: UTexts.firstName,
                        prefixIcon: Icon(Iconsax.user),
                      ),
                    ),
                    SizedBox(height: USizes.spaceBtwInputFields),
                    TextFormField(
                      controller: controller.lastName,
                      validator: (value) =>
                          UValidator.validateEmptyText('Last Name ', value),
                      decoration: InputDecoration(
                        labelText: UTexts.firstName,
                        prefixIcon: Icon(Iconsax.user),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: USizes.spaceBtwSections),

              /// Save Button
              UElevatedButton(onPressed:  controller.updateUserName, child: Text('Save')),
            ],
          ),
        ),
      ),
    );
  }
}
