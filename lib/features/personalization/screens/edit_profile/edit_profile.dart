import 'package:ecommerce/common/styles/padding.dart';
import 'package:ecommerce/common/widgets/appbar/appBar.dart';
import 'package:ecommerce/common/widgets/text/section_heading.dart';
import 'package:ecommerce/features/personalization/screens/edit_profile/widgets/user_edit_profile_row.dart';
import 'package:ecommerce/features/personalization/screens/edit_profile/widgets/user_profile_with_edit_icon.dart';
import 'package:ecommerce/utils/constants/sizes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
              UserDetailRow(title: 'Name', value: 'Ayush Pandey', onTap: () {}),
              UserDetailRow(
                title: 'UserName',
                value: 'ayush3878',
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
              UserDetailRow(title: 'userID', value: '513878', onTap: () {}),
              UserDetailRow(
                title: 'Email',
                value: 'ayushpandey.pratapgarh@gmail.com',
                onTap: () {},
              ),
              UserDetailRow(
                title: 'Phone Number',
                value: '+917307513878',
                onTap: () {},
              ),
              UserDetailRow(title: 'Gender', value: 'Male', onTap: () {}),
              SizedBox(height: USizes.spaceBtwItems),

              /// Divider
              Divider(),
              SizedBox(height: USizes.spaceBtwItems),
              TextButton(
                onPressed: () {},
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
