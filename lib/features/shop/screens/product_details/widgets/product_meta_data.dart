import 'package:ecommerce/features/shop/controller/product/product_controller.dart';
import 'package:ecommerce/features/shop/models/product_model.dart';
import 'package:ecommerce/utils/constants/enums.dart';
import 'package:flutter/material.dart';

import '../../../../../common/widgets/customs_shapes/clipper/rounded_container.dart';
import '../../../../../common/widgets/images/circular_image.dart';
import '../../../../../common/widgets/text/brand_title_with_verify_icon.dart';
import '../../../../../common/widgets/text/product_price_text.dart';
import '../../../../../common/widgets/text/product_title_text.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/images.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/texts.dart';

class UProductMetaData extends StatelessWidget {
  const UProductMetaData({super.key, required this.product});
  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final controller = ProductController.instance;
    String? salePercentage = controller.calculateSalePercentage(product.price, product.salePrice);
    return Column(
      children: [
        /// Sale, Tag Sale Price , Actual Price And Share Button
        Row(
          children: [
            // Sale Tag
            if(salePercentage != null)...[
            URoundedContainer(
              radius: USizes.sm,
              backgroundColor: UColors.yellow.withValues(alpha: 0.8),
              padding: const EdgeInsets.symmetric(
                horizontal: USizes.sm,
                vertical: USizes.xs,
              ),
              child: Text(
                '${salePercentage}',
                style: Theme.of(
                  context,
                ).textTheme.labelLarge!.apply(color: UColors.black),
              ),
            ),
            SizedBox(width: USizes.spaceBtwItems),],
            // Actual price
            if(product.productType == ProductType.single.toString() && product.salePrice > 0)...[
            Text(
              '${UTexts.currency}${product.price.toStringAsFixed(0)}',
              style: Theme.of(context).textTheme.titleSmall!.apply(
                decoration: TextDecoration.lineThrough,
              ),
            ),
              SizedBox(width: USizes.spaceBtwItems),
            ],
            // Sale Price or Actual Price
            UProductPriceText(price: controller.getProductPrice(product), isLarge: true),
            Spacer(),
            // Share Button
            IconButton(onPressed: () {}, icon: Icon(Icons.share)),
          ],
        ),
        SizedBox(height: USizes.spaceBtwItems / 1.5),
        UProductTitleText(title: product.title),
        SizedBox(height: USizes.spaceBtwItems / 1.5),

        /// Product status
        Row(
          children: [
            UProductTitleText(title: 'Status'),
            SizedBox(width: USizes.spaceBtwItems),
            Text(controller.getProductStockStatus(product.stock), style: Theme.of(context).textTheme.titleMedium),
          ],
        ),
        SizedBox(height: USizes.spaceBtwItems / 1.5),
        Row(
          children: [
            UCircularImage(
              isNetworkImage: true,
              padding: 0,
              image: product.brand != null ? product.brand!.image : '',
              width: 32.0,
              height: 32.0,
            ),
            SizedBox(width: USizes.spaceBtwItems),
            UBrandTitleWithVerifyIcon(title: product.brand!= null ? product.brand!.name : ''),
          ],
        ),
      ],
    );
  }
}
