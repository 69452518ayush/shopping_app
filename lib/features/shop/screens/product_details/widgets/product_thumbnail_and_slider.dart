import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce/features/shop/controller/product/image_controller.dart';
import 'package:ecommerce/features/shop/models/product_model.dart';
import 'package:ecommerce/utils/helpers/helper_function.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../common/widgets/appbar/appBar.dart';
import '../../../../../common/widgets/icons/circular_icon.dart';
import '../../../../../common/widgets/images/rounded_images.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/images.dart';
import '../../../../../utils/constants/sizes.dart';

class UProductThumbnailAndSlider extends StatelessWidget {
  const UProductThumbnailAndSlider({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final dark = UHelperFunctions.isDarkMode(context);
    final controller = Get.put(ImageController());
    List<String> images = controller.setAllProductImages(product);

    return Container(
      color: dark ? UColors.darkerGrey : UColors.light,
      child: Stack(
        children: [
          /// [Image] Main Image OR ThumbNail
          SizedBox(
            height: 400,
            child: Padding(
              padding: const EdgeInsets.all(USizes.productImageRadius * 2),
              child: Center(
                child: Obx(() {
                  final image = controller.selectedProductImage.value;
                  return GestureDetector(
                    onTap: () => controller.showEnlargeImage(image),
                    child: CachedNetworkImage(
                      imageUrl: image,
                      progressIndicatorBuilder: (context, url, progress) =>
                          CircularProgressIndicator(
                            color: UColors.primary,
                            value: progress.progress,
                          ),
                    ),
                  );
                }),
              ),
            ),
          ),

          ///Image Slider
          Positioned(
            top: USizes.defaultSpace,
            right: 0,
            bottom: 30,
            child: SizedBox(
              height: 80.0,
              child: ListView.separated(
                separatorBuilder: (context, index) =>
                    SizedBox(width: USizes.spaceBtwItems),
                itemCount: images.length,
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => Obx(
                  (){
                    bool isImageSelected = controller.selectedProductImage.value == images[index];
                    return URoundedImage(
                      width: 80,
                      isNetworkImage: true,
                      onTap: ()=> controller.selectedProductImage.value = images[index],
                      backgroundColor: dark ? UColors.dark : UColors.white,
                      padding: EdgeInsets.all(USizes.sm),
                      border: Border.all(color: isImageSelected ? UColors.primary : Colors.transparent),
                      imageUrl: images[index],
                    );
                  }
                ),
              ),
            ),
          ),

          /// [AppBar] - Back arrow and Favourite Button
          UAppBar(
            showBackArrow: true,
            action: [UCircularIcon(icon: Iconsax.heart5, color: Colors.red)],
          ),
        ],
      ),
    );
  }
}
