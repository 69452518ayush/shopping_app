import 'package:ecommerce/common/styles/padding.dart';
import 'package:ecommerce/common/widgets/appbar/appBar.dart';
import 'package:ecommerce/features/personalization/controller/address_controller.dart';
import 'package:ecommerce/features/personalization/screens/adress/add_new_screen.dart';
import 'package:ecommerce/features/personalization/screens/adress/widgets/single_address.dart';
import 'package:ecommerce/features/personalization/screens/models/address_model.dart';
import 'package:ecommerce/utils/constants/sizes.dart';
import 'package:ecommerce/utils/helpers/cloud_helpers_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../utils/constants/colors.dart';

class AddressScreen extends StatelessWidget {
  const AddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller =  Get.put(AddressController());
    return Scaffold(
      ///-----------[AppBar]------------------///
      appBar: UAppBar(showBackArrow: true,title: Text('Addresses',style: Theme.of(context).textTheme.headlineMedium,),),
      ///-----------[Body]------------------///
      body: SingleChildScrollView(
        child: Padding(padding: UPadding.screenPadding,child:
        Obx(
            () =>  FutureBuilder
              (
               key: Key(controller.refreshData.value.toString()),
                future: controller.getAllAddresses(),


              builder: (context , snapshot){
                /// Handle  ,Error , Loading
                final widget = UCloudHelperFunctions.checkMultiRecordState(snapshot: snapshot);
                //[Data Found] - Address Found
                List<AddressModel> addresses = snapshot.data!;
                return ListView.separated(
                  shrinkWrap: true,
                    separatorBuilder: (context, index) => SizedBox(height: USizes.spaceBtwItems,),
                    itemCount: addresses.length,
                itemBuilder: (context , index) {
                   return USingleAddresses(onTap: () => controller.selectedAddress,
                   address: addresses[index]
                   );
                });
              }),
        )

        )
      ),
      ///-------------[FloatingActionButton]------------------///
      floatingActionButton: FloatingActionButton(onPressed: () => Get.to(()=> AddNewScreen()),child: Icon(Iconsax.add),backgroundColor: UColors.primary,),
    );
  }
}
