import 'package:ecommerce/common/widgets/customs_shapes/clipper/rounded_container.dart';
import 'package:ecommerce/common/widgets/text/product_price_text.dart';
import 'package:ecommerce/common/widgets/text/product_title_text.dart';
import 'package:ecommerce/common/widgets/text/section_heading.dart';
import 'package:ecommerce/features/shop/controller/product/variation_controller.dart';
import 'package:ecommerce/features/shop/models/product_model.dart';
import 'package:ecommerce/utils/constants/colors.dart';
import 'package:ecommerce/utils/constants/sizes.dart';
import 'package:ecommerce/utils/constants/texts.dart';
import 'package:ecommerce/utils/helpers/helper_function.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../../../common/widgets/chip/choice_chip.dart';

class UProductAttributes extends StatelessWidget {
  const UProductAttributes({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final dark = UHelperFunctions.isDarkMode(context);
    final controller = Get.put(VariationController());
    return Obx(
        () =>  Column(
        children: [
          /// Selected Attributes Pricing & Description
          if(controller.selectedVariation.value.id.isNotEmpty)
          URoundedContainer(
            padding: EdgeInsets.all(USizes.md),
            backgroundColor: dark ? UColors.darkerGrey : UColors.grey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// Title , Price & Stock
                Row(
                  children: [
                    /// [Text] variation Heading
                    USectionHeading(title: 'Variation', showActonButton: false),
                    SizedBox(width: USizes.spaceBtwItems),
                    Column(
                      children: [
                        /// Price , Sale Price, Stock, Actual Price
                        Row(
                          children: [
                            /// Actual Price
                            UProductTitleText(title: 'Price', smallSize: true),
                            if(controller.selectedVariation.value.salePrice > 0)
                            Text(
                              '${UTexts.currency}${controller.selectedVariation.value.price.toString()}',
                              style: Theme.of(context).textTheme.titleSmall!
                                  .apply(decoration: TextDecoration.lineThrough),
                            ),
                            SizedBox(width: USizes.spaceBtwItems),

                            /// Sale Price
                            UProductPriceText(price: controller.getVariationPrice()),
                          ],
                        ),

                        /// Stock Status
                        Row(
                          children: [
                            UProductTitleText(title: 'Stock', smallSize: true),
                            Text(
                              controller.variationStockStatus.value,
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),

                /// Attributes Description
                UProductTitleText(
                  title: controller.selectedVariation.value.description ?? '',
                  smallSize: true,
                  maxLines: 4,
                ),
              ],
            ),
          ),
          SizedBox(height: USizes.spaceBtwItems),

          /// Attributes - colors
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: product.productAttributes!.map((attribute) {
              return Column(
                children: [
                  USectionHeading(
                    title: attribute.name ?? '',
                    showActonButton: false,
                  ),
                  SizedBox(height: USizes.spaceBtwItems / 2),
                  Wrap(
                    spacing: USizes.sm,
                    children: attribute.values!.map((attribute) {
                      bool isSelected =
                          controller.selectedAttributes[attribute.name] ==
                          attributeValue;
                      bool available = controller
                          .getAttributesAvailabilityInVariation(
                            product.productVariations!,
                            attribute.Name!,
                          )
                          .contains(attributeValue);
                      return UChoiceChip(
                        text: attributeValue,
                        selected: true,
                        onSelected: available ? (selected) {
                          if(available && selected){
                            controller.onAttributeSelected(product, attribute.name, attributeValue);
                          }
                        } : null,
                      );
                    }).toList(),
                  ),
                ],
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
