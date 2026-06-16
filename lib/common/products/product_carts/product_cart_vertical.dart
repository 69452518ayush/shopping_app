import 'package:ecommerce/common/widgets/customs_shapes/clipper/rounded_container.dart';
import 'package:ecommerce/common/widgets/icons/circular_icon.dart';
import 'package:ecommerce/common/widgets/images/rounded_images.dart';
import 'package:ecommerce/common/widgets/products/favourite/favourite_icon.dart';
import 'package:ecommerce/features/shop/controller/product/product_controller.dart';
import 'package:ecommerce/features/shop/models/product_model.dart';
import 'package:ecommerce/features/shop/screens/product_details/product_details.dart';
import 'package:ecommerce/utils/constants/colors.dart';
import 'package:ecommerce/utils/helpers/helper_function.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import '../../../utils/constants/images.dart';
import '../../../utils/constants/sizes.dart';
import '../../styles/shadow.dart';
import '../../widgets/text/brand_title_with_verify_icon.dart';
import '../../widgets/text/product_price_text.dart';
import '../../widgets/text/product_title_text.dart';

class UProductCartVertical extends StatelessWidget {
  const UProductCartVertical({super.key, required this.product});
  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final controller = ProductController.instance;
    final dark = UHelperFunctions.isDarkMode(context);
    String? salePercentage = controller.calculateSalePercentage(product.price, product.salePrice);
    return GestureDetector(
      onTap: () => Get.to(()=>ProductDetailsScreen(product: product,)),
      child: Container(
        width: 180,
        padding: EdgeInsets.all(0.1),
        decoration: BoxDecoration(
          boxShadow: UShadow.verticalProductShadow,
          borderRadius: BorderRadius.circular(USizes.productImageRadius),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          /// Thumbnail, Favourite Button and Discount
          children: [
            URoundedContainer(
              height: 180,
              padding: const EdgeInsets.all(USizes.md),
              backgroundColor: dark ? UColors.dark : UColors.light,
              child: Stack(
                children: [
                  /// Thumbnail
                  Center(child: URoundedImage(imageUrl: product.thumbnail,isNetworkImage: true,)),

                  /// Discount Tag
                  if(salePercentage !=  null)
                  Positioned(
                    top: 12.0,
                    child: URoundedContainer(
                      radius: USizes.md,
                      backgroundColor: UColors.yellow.withValues(alpha: 0.8),
                      padding: const EdgeInsets.symmetric(
                        horizontal: USizes.sm,
                        vertical: USizes.xs,
                      ),
                      child: Text(
                        '$salePercentage',
                        style: Theme.of(
                          context,
                        ).textTheme.labelLarge!.apply(color: UColors.black),
                      ),
                    ),
                  ),

                  ///  Favourite Button
                  Positioned(
                    right: 0,
                    top: 0,
                    child: UFavouriteIcon(productId: product.id,),
                  ),
                ],
              ),
            ),
            SizedBox(height: USizes.spaceBtwItems / 2),

            /// Details
            Padding(
              padding: const EdgeInsets.only(left: USizes.sm),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ///ProductTitle
                  UProductTitleText(title: product.title, smallSize: true),
                  SizedBox(height: USizes.spaceBtwItems / 2),

                  /// Product Brand
                  UBrandTitleWithVerifyIcon(title: product.brand!.name),

                  /// Product Price  & Add Button
                ],
              ),
            ),
            Spacer(),

            /// Product Details Price & Button
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: USizes.sm),
                  child: UProductPriceText(price: controller.getProductPrice(product)),
                ),
                Container(
                  width: USizes.iconLg * 1.2,
                  height: USizes.iconLg * 1.2,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(USizes.cardRadiusMd),
                      bottomRight: Radius.circular(USizes.productImageRadius),
                    ),
                  ),
                  child: Icon(Iconsax.add, color: Colors.white),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
