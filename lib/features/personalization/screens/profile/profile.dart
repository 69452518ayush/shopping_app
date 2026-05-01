import 'package:ecommerce/common/widgets/text/section_heading.dart';
import 'package:ecommerce/features/personalization/screens/adress/address_screen.dart';
import 'package:ecommerce/features/personalization/screens/profile/widgets/profile_primary_header.dart';
import 'package:ecommerce/features/personalization/screens/profile/widgets/setting_menu_tile.dart';
import 'package:ecommerce/features/personalization/screens/profile/widgets/user_profile.dart';
import 'package:ecommerce/features/shop/screens/order/order.dart';
import 'package:ecommerce/utils/constants/sizes.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            UProfilePrimaryHeader(),
            Padding(
              padding: const EdgeInsets.all(USizes.defaultSpace),
              child: Column(
                children: [

                  /// User profile
                  UserProfileTile(),

                  /// Account Setting Heading
                  USectionHeading(
                    title: 'Account Setting',
                    showActonButton: false,
                  ),

                  /// Setting Menu
                  SettingMenuTile(title: 'My Addresses',onTap: () => Get.to(()=> AddressScreen()),
                    subtitle: 'Set shopping delivery addresses',
                    icon: Iconsax.safe_home,),
                  SettingMenuTile(title: 'My Cart',onTap: (){},
                    subtitle: 'Add, remove products and move to checkout',
                    icon: Iconsax.shopping_cart,),
                  SettingMenuTile(title: 'My Orders',onTap: () => Get.to(()=> OrderScreen()),
                    subtitle: 'In - progress and Completed Orders',
                    icon: Iconsax.bag_tick,),
                  SizedBox(height: USizes.spaceBtwSections,),

                  /// Logout
                  SizedBox(
                      width: double.infinity,
                      child: OutlinedButton(
                          onPressed: () {}, child: Text('Logout'))),
                  SizedBox(height: USizes.spaceBtwSections,),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
