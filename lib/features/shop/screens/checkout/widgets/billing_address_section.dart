import 'package:ecommerce/common/widgets/text/section_heading.dart';
import 'package:ecommerce/utils/constants/colors.dart';
import 'package:ecommerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class UBillingAddressSection extends StatelessWidget {
  const UBillingAddressSection({super.key});

  @override
  Widget build(BuildContext context) {
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// [Text] -  Billing Address
        USectionHeading(title: 'Billing Address',buttonTitle: 'Change',onPressed: (){},),
        Text('Ayush Pandey',style: Theme.of(context).textTheme.titleLarge,),
        SizedBox(height: USizes.spaceBtwItems/2,),
        Row(
          children: [
            Icon(Icons.phone,size: USizes.iconSm,color: UColors.darkerGrey,),
            SizedBox(width: USizes.spaceBtwItems,),
            Text('917307513878'),
          ],
        ),
        SizedBox(height: USizes.spaceBtwItems/2,),
        Row(
          children: [
            Icon(Icons.location_history,size: USizes.iconSm,color: UColors.darkerGrey,),
            SizedBox(width: USizes.spaceBtwItems,),
            Expanded(child: Text('House no 12, Pratapgarh , Uttar Pradesh',softWrap: true,)),
          ],
        )
      ],
    );
  }
}
