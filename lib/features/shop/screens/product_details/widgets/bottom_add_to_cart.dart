import 'package:ecommerce/common/widgets/icons/circular_icon.dart';
import 'package:ecommerce/utils/constants/colors.dart';
import 'package:ecommerce/utils/constants/sizes.dart';
import 'package:ecommerce/utils/helpers/helper_function.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class UBottomAddToCart extends StatelessWidget {
  const UBottomAddToCart({super.key});

  @override
  Widget build(BuildContext context) {
    bool dark = UHelperFunctions.isDarkMode(context);
    return Container(
      padding: EdgeInsets.symmetric(horizontal: USizes.defaultSpace,vertical: USizes.defaultSpace/2),
      decoration: BoxDecoration(
        color: dark ? UColors.darkerGrey : UColors.light,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(USizes.cardRadiusLg),
          topRight: Radius.circular(USizes.cardRadiusLg)
        )
      ),
      child: Row(
        children: [
          /// Decrement Button
          UCircularIcon(icon: Iconsax.minus,backgroundColor: UColors.darkerGrey,width: 40,height: 40,color: UColors.white,),
          SizedBox(width: USizes.spaceBtwItems,),
          /// Counter
          Text('2',style: Theme.of(context).textTheme.titleSmall,),
          /// Increment
          UCircularIcon(icon: Iconsax.add,backgroundColor: UColors.black,width: 40,height: 40,color: UColors.white,),
          Spacer(),
          /// Add to cart Button
          ElevatedButton(onPressed: (){}, child: Row(
            children: [
              Icon(Iconsax.shopping_bag),
              SizedBox(width: USizes.spaceBtwItems/2,),
              Text('Add to Cart'),
            ],
          ),style: ElevatedButton.styleFrom(padding: EdgeInsets.all(USizes.md),backgroundColor: UColors.black,side: BorderSide(color: UColors.black)),),
        ],
      ),
    );
  }
}
