import 'package:ecommerce/common/styles/padding.dart';
import 'package:ecommerce/common/widgets/appbar/appBar.dart';
import 'package:ecommerce/common/widgets/text/section_heading.dart';
import 'package:ecommerce/features/personalization/controller/user_controller.dart';
import 'package:ecommerce/features/personalization/screens/change_name/change_name_screen.dart';
import 'package:ecommerce/features/personalization/screens/edit_profile/widgets/user_edit_profile_row.dart';
import 'package:ecommerce/features/personalization/screens/edit_profile/widgets/user_profile_with_edit_icon.dart';
import 'package:ecommerce/utils/constants/sizes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    return Scaffold(
      appBar: UAppBar(
        showBackArrow: true,
        title: Text(
          'Edit Profile',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: UPadding.screenPadding,
          child: Column(
            children: [
              UserProfileWithEditIcon(),
              SizedBox(height: USizes.spaceBtwSections),

              /// Divider
              Divider(),
              SizedBox(height: USizes.spaceBtwSections),

              /// Account Setting Heading
              USectionHeading(title: "Account Setting", showActonButton: false),
              UserDetailRow(title: 'Name', value: controller.user.value.fullName, onTap: () => Get.to(() => ChangeNameScreen())),
              UserDetailRow(
                title: 'UserName',
                value: controller.user.value.username,
                onTap: () {},
              ),
              SizedBox(height: USizes.spaceBtwItems),

              Divider(),
              SizedBox(height: USizes.spaceBtwSections),

              /// Profile Setting Heading
              USectionHeading(
                title: "Profile Settings",
                showActonButton: false,
              ),
              SizedBox(height: USizes.spaceBtwItems),

              /// Profile Setting
              UserDetailRow(title: 'userID', value: controller.user.value.id, onTap: () {}),
              UserDetailRow(
                title: 'Email',
                value: controller.user.value.email,
                onTap: () {},
              ),
              UserDetailRow(
                title: 'Phone Number',
                value: '+91${controller.user.value.phoneNumber}',
                onTap: () {},
              ),
              UserDetailRow(title: 'Gender', value: 'Male', onTap: () {}),
              SizedBox(height: USizes.spaceBtwItems),

              /// Divider
              Divider(),
              SizedBox(height: USizes.spaceBtwItems),
              /// Close Account Button
              TextButton(
                onPressed: controller.deleteAccountWarningPopup,
                child: Text(
                  "Closed Account",
                  style: TextStyle(color: Colors.red),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
