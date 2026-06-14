import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce/features/shop/models/product_model.dart';
import 'package:ecommerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ImageController extends GetxController{
  static ImageController get instance => Get.find();

  /// Variables
  RxString selectedProductImage = ''.obs;
  /// Function to load all image of product
  List<String> setAllProductImages(ProductModel product){
    Set<String> images = {};
    // Load Thumbnail image
    images.add(product.thumbnail);
    // Assign Thumbnail as selected Image
    selectedProductImage.value = product.thumbnail;
    // Load all Images of product
    if(product.images != null || product.images!.isNotEmpty){
      images.addAll(product.images!);
    }
    //Load all images from the product variation
    if(product.productVariations != null || product.productVariations!.isNotEmpty){
      List<String> variationImages = product.productVariations!.map((e)=> e.image).toList();
      images.addAll(variationImages);
    }
    return images.toList();
  }


  void showEnlargeImage(String image){
    Get.to(fullscreenDialog: true,
        () => Dialog.fullscreen(
          child: Column(
            children: [
              // Image
              Padding(padding: EdgeInsets.symmetric(vertical: USizes.defaultSpace * 2, horizontal: USizes.defaultSpace),
              child: CachedNetworkImage(imageUrl: image),),
              SizedBox(height: USizes.spaceBtwSections,),
              // Close  button
              Align(
                alignment: Alignment.bottomCenter,
                child: SizedBox(width: 150,
                child: OutlinedButton(onPressed: () => Get.back, child: Text('Close')),),
              )
            ],
          ),
        )

    );
  }
}