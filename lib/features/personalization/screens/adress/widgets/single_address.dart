
import 'package:ecommerce/utils/constants/colors.dart';
import 'package:ecommerce/utils/helpers/helper_function.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../common/widgets/customs_shapes/clipper/rounded_container.dart';
import '../../../../../utils/constants/sizes.dart';

class USingleAddresses extends StatelessWidget {
  const USingleAddresses({
    super.key, required this.isSelected,
  });
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    final dark = UHelperFunctions.isDarkMode(context);
    return URoundedContainer(
      width: double.infinity,
      showBorder: true,
      backgroundColor: isSelected ? UColors.primary.withValues(alpha: 0.5) : Colors.transparent,
      borderColor: isSelected ? Colors.transparent :dark ? UColors.darkerGrey:UColors.light,
      padding: EdgeInsets.all(USizes.md),
      child:Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// UserName
              Text('Ayush Pandey',style: Theme.of(context).textTheme.titleLarge,maxLines: 1,overflow: TextOverflow.ellipsis,),
              SizedBox(height: USizes.spaceBtwItems/2,),
              // Phone  Number
              Text('+917307513878',maxLines: 3,overflow: TextOverflow.ellipsis,),
              SizedBox(height: USizes.spaceBtwItems/2,),

              // Address
              Text('Jamadar ka Purwa , Umari , Antu ,Pratapgarh,Uttar Pradesh',maxLines: 1,overflow: TextOverflow.ellipsis,),
            ],
          ),
          if (isSelected)Positioned(
              top: 0,
              bottom: 0,
              right: 6,
              child: Icon(Iconsax.tick_circle5))
        ],
      )
    );
  }
}
