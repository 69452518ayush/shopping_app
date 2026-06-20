import 'package:ecommerce/common/styles/padding.dart';
import 'package:ecommerce/common/widgets/appbar/appBar.dart';
import 'package:ecommerce/common/widgets/button/elevated_button.dart';
import 'package:ecommerce/features/personalization/controller/address_controller.dart';
import 'package:ecommerce/utils/constants/sizes.dart';
import 'package:ecommerce/utils/validators/validations.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:iconsax/iconsax.dart';

class AddNewScreen extends StatelessWidget {
  const AddNewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AddressController());
    return Scaffold(
      ///--------------------[AppBar]-----------------------------///
      appBar: UAppBar(
        showBackArrow: true,
        title: Text(
          'Add New Address',
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ),

      ///--------------------[Body]-----------------------------////
      body: SingleChildScrollView(
        child: Padding(
          padding: UPadding.screenPadding,
          child: Form(
            key: controller.addressFormKey,
            child: Column(
              children: [
                /// Name
                TextFormField(
                  controller: controller.name,
                  validator: (value) => UValidator.validateEmptyText('Name', value),
                  decoration: InputDecoration(
                    prefixIcon: Icon(Iconsax.user),
                    labelText: 'Name',
                  ),
                ),
                SizedBox(height: USizes.spaceBtwInputFields),

                /// PhoneNumber
                TextFormField(
                  controller: controller.phoneNumber,
                  validator: (value) => UValidator.validateEmptyText('Phone Number', value),
                  decoration: InputDecoration(
                    prefixIcon: Icon(Iconsax.mobile),
                    labelText: 'Phone Number',
                  ),
                ),
                SizedBox(height: USizes.spaceBtwInputFields),

                /// Street
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        validator: (value) => UValidator.validateEmptyText('Street', value),
                        controller: controller.street,
                        decoration: InputDecoration(
                          prefixIcon: Icon(Iconsax.building_31),
                          labelText: 'Street',
                        ),
                      ),
                    ),
                    SizedBox(width: USizes.spaceBtwInputFields),

                    /// Postal Code
                    Expanded(
                      child: TextFormField(
                        validator: (value) => UValidator.validateEmptyText('Postal Code', value),
                        controller: controller.postalCode,
                        decoration: InputDecoration(
                          prefixIcon: Icon(Iconsax.code),
                          labelText: 'Postal Code',
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: USizes.spaceBtwInputFields),
                Row(
                  children: [
                    Expanded(
                      /// City
                      child: TextFormField(
                        controller: controller.city,
                        validator: (value) => UValidator.validateEmptyText('City', value),
                        decoration: InputDecoration(
                          prefixIcon: Icon(Iconsax.building),
                          labelText: 'City',
                        ),
                      ),
                    ),
                    SizedBox(width: USizes.spaceBtwInputFields),

                    /// State
                    Expanded(
                      child: TextFormField(
                        controller: controller.State,
                        validator: (value) => UValidator.validateEmptyText('State', value),

                        decoration: InputDecoration(
                          prefixIcon: Icon(Iconsax.activity),
                          labelText: 'State',
                        ),
                      ),
                    ),
                  ],
                ),

                /// Country
                TextFormField(
                  controller: controller.Country,
                  validator: (value) => UValidator.validateEmptyText('Country', value),
                  decoration: InputDecoration(
                    prefixIcon: Icon(Iconsax.global),
                    labelText: 'Country',
                  ),
                ),
                SizedBox(height: USizes.spaceBtwSections),

                /// Save Button
                UElevatedButton(onPressed : controller.addNewAddress(), child: Text('Save')),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
