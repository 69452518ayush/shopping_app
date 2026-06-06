import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/data/services/cloudinary_services.dart';
import 'package:ecommerce/features/shop/models/brand_model.dart';
import 'package:ecommerce/utils/constants/keys.dart';
import 'package:ecommerce/utils/helpers/helper_function.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart' as dio;

import '../../../utils/exceptions/firebase_auth_exceptions.dart';
import '../../../utils/exceptions/firebase_exceptions.dart';
import '../../../utils/exceptions/format_exceptions.dart';
import '../../../utils/exceptions/platform_exceptions.dart';

class BrandRepositories extends GetxController {
  static BrandRepositories get instance => Get.find();

  /// Variables
  final _db = FirebaseFirestore.instance;
  final _cloudinaryServices = Get.put(CloudinaryServices());

  ///[Upload] - Function to upload all brands

  Future<void> uploadBrands(List<BrandModel> brands) async {
    try {
      for (BrandModel brand in brands) {
        // Convert asset path to file
        File brandImage = await UHelperFunctions.assetToFile(brand.image);
        // Upload Brand image to cloudinary
        dio.Response response = await _cloudinaryServices.uploadImage(
          brandImage,
          UKeys.brandFolder,
        );
        if (response.statusCode == 200) {
          brand.image = response.data['url'];
        }
        // Store data to firebase to firestore
        await _db
            .collection(UKeys.brandCollection)
            .doc(brand.id)
            .set(brand.toJson());
        print('Brand ${brand.name} uploaded successfully');
      }
    } on FirebaseAuthException catch (e) {
      throw UFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw UFirebaseException(e.code).message;
    } on FormatException catch (e) {
      throw UFormatException();
    } on PlatformException catch (e) {
      throw UPlatformException(e.code).message;
    } catch (e) {
      throw ' Something went wrong . Please try again later';
    }
  }

  ///[Fetch] - Function to get all brands

  Future<List<BrandModel>> fetchBrands() async {
    try {
      final query = await _db.collection(UKeys.brandCollection).get();
      if (query.docs.isNotEmpty) {
        final brands = query.docs
            .map((document) => BrandModel.fromSnapshot(document))
            .toList();
        return brands;
      }
      return [];
    } on FirebaseAuthException catch (e) {
      throw UFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw UFirebaseException(e.code).message;
    } on FormatException catch (e) {
      throw UFormatException();
    } on PlatformException catch (e) {
      throw UPlatformException(e.code).message;
    } catch (e) {
      throw ' Something went wrong . Please try again later';
    }
  }
}
