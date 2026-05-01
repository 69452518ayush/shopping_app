import 'package:ecommerce/common/products/cart/cart_items.dart';
import 'package:ecommerce/common/styles/padding.dart';
import 'package:ecommerce/common/widgets/appbar/appBar.dart';
import 'package:ecommerce/common/widgets/customs_shapes/clipper/rounded_container.dart';
import 'package:ecommerce/common/widgets/screens/success_screen.dart';
import 'package:ecommerce/features/shop/screens/checkout/widgets/billing_amount_section.dart';
import 'package:ecommerce/features/shop/screens/checkout/widgets/billing_payment_section.dart';
import 'package:ecommerce/navigation_menu.dart';
import 'package:ecommerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/widgets/button/elevated_button.dart';
import '../../../../common/widgets/textfields/promo_code.dart';
import '../../../../utils/constants/images.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      ///-------------[AppBar]------------///
        appBar: UAppBar(
          showBackArrow: true,
          title: Text(
            'Order Review',
            style: Theme
                .of(context)
                .textTheme
                .headlineSmall,
          ),
        ),

        ///------------[Body]------------------///
        body: SingleChildScrollView(
          child: Padding(
            padding: UPadding.screenPadding,
            child: Column(
                children: [

                  /// Items
                  UCartItems(showAddRemoveButtons: false,),
                  SizedBox(height: USizes.spaceBtwSections,),

                  /// Promo code - TextField
                  UPromoCode(),
                  SizedBox(height: USizes.spaceBtwSections,),

                  /// Billing Amount
                  URoundedContainer(
                    showBorder: true,
                    padding: EdgeInsets.all(USizes.md),
                    backgroundColor: Colors.transparent,
                    child: Column(
                      children: [

                        ///Amount
                        UBillingAmountSection(),
                        SizedBox(height: USizes.spaceBtwItems,),

                        /// Billing
                        UBillingPaymentSection(),
                      ],
                    ),
                  )

                ]
            ),
          ),
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(USizes.defaultSpace),
          child: UElevatedButton(
            onPressed: () =>
                Get.to(() =>
                    SuccessScreen(title: 'Payment Success',
                        subTitle: 'Your item will be shipped soon!',
                        image: UImages.successfulPaymentIcon,
                        onTap: () => Get.offAll(() => NavigationMenu()))),
            child: Text('Checkout\$9874128'),
          ),
        ),
    );
  }
}
