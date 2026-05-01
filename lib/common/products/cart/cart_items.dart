import 'package:ecommerce/common/products/cart/cart_item.dart';
import 'package:ecommerce/common/products/cart/product_quantity_with_add_remove.dart';
import 'package:flutter/material.dart';

import '../../../utils/constants/sizes.dart';
import '../../widgets/text/product_price_text.dart';

class UCartItems extends StatelessWidget {
  const UCartItems({super.key, this.showAddRemoveButtons = true});

  final bool showAddRemoveButtons;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      separatorBuilder: (context, index) =>
          SizedBox(height: USizes.spaceBtwSections),
      itemCount: 2,
      itemBuilder: (context, index) {
        return Column(
          children: [
            ///Cart Item
            UCartItem(),
            if (showAddRemoveButtons) SizedBox(height: USizes.spaceBtwItems),

            /// Price , Counter , Buttons
            if (showAddRemoveButtons)
              Row(
                children: [
                  /// Extra Space
                  SizedBox(width: 70.0),

                  /// Increment Button
                  UProductQuantityWithAddRemove(),
                  Spacer(),
                  UProductPriceText(price: '323'),
                ],
              ),
          ],
        );
      },
    );
  }
}
