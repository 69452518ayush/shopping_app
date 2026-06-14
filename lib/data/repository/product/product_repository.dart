import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart' as dio;
import 'package:ecommerce/data/services/cloudinary_services.dart';
import 'package:ecommerce/features/shop/models/product_model.dart';
import 'package:ecommerce/utils/constants/keys.dart';
import 'package:ecommerce/utils/exceptions/firebase_exceptions.dart';
import 'package:ecommerce/utils/exceptions/format_exceptions.dart';
import 'package:ecommerce/utils/exceptions/platform_exceptions.dart';
import 'package:ecommerce/utils/helpers/helper_function.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class ProductRepository extends GetxController {
  static ProductRepository get to => Get.find();

  final _db = FirebaseFirestore.instance;
  final _cloudinaryServices = Get.put(CloudinaryServices());

  ///[Upload] -- Function to upload  list of products to FireStore
  Future<void> uploadProducts(List<ProductModel> products) async {
    try {
      for (ProductModel product in products) {
        /// Upload Thumbnail to Cloudinary
        File thumbnailFile = await UHelperFunctions.assetToFile(
          product.thumbnail,
        );
        dio.Response response = await _cloudinaryServices.uploadImage(
          thumbnailFile,
          UKeys.productFolder,
        );
        if (response.statusCode == 200) {
          response.data['url'];
        }
        if (product.images != null && product.images!.isEmpty) {
          List<String> imageUrls = [];

          // upload image one by one
          for (String image in product.images!) {
            File  imageFile = await  UHelperFunctions.assetToFile(
              image,
            );
            dio.Response response = await _cloudinaryServices.uploadImage(
              thumbnailFile,
              UKeys.productFolder,
            );
            if (response.statusCode == 200) {
              imageUrls.add(response.data['url']);
            }
          }
          // update product variation images
          for(final variation in product.productVariations!){
            int index = product.images!.indexWhere((element) => element == variation.image);
            variation.image = imageUrls[index];
          }
          // assign image Urls to product
          product.images!.clear();
          product.images!.assignAll(imageUrls);
        }
        // Upload product from Fire Store
        await _db
            .collection(UKeys.productCollection)
            .doc(product.id)
            .set(product.toJson());
      }
    } on FirebaseException catch (e) {
      throw UFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw UFormatException();
    } on PlatformException catch (e) {
      throw UPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again later';
    }
  }
}
