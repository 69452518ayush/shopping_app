import 'package:ecommerce/common/styles/padding.dart';
import 'package:ecommerce/common/widgets/appbar/appBar.dart';
import 'package:ecommerce/common/widgets/customs_shapes/clipper/rounded_container.dart';
import 'package:ecommerce/features/personalization/screens/adress/add_new_screen.dart';
import 'package:ecommerce/features/personalization/screens/adress/widgets/single_address.dart';
import 'package:ecommerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../utils/constants/colors.dart';

class AddressScreen extends StatelessWidget {
  const AddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      ///-----------[AppBar]------------------///
      appBar: UAppBar(showBackArrow: true,title: Text('Addresses',style: Theme.of(context).textTheme.headlineMedium,),),
      ///-----------[Body]------------------///
      body: SingleChildScrollView(
        child: Padding(padding: UPadding.screenPadding,child: Column(
          children: [
            USingleAddresses(isSelected: true,),
            SizedBox(height: USizes.spaceBtwItems,),
            USingleAddresses(isSelected: true,),
          ],
        ),
        )
      ),
      ///-------------[FloatingActionButton]------------------///
      floatingActionButton: FloatingActionButton(onPressed: () => Get.to(()=> AddNewScreen()),child: Icon(Iconsax.add),backgroundColor: UColors.primary,),
    );
  }
}
