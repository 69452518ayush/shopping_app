import 'dart:io';
import 'package:dio/dio.dart' as dio;

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/data/services/cloudinary_services.dart';
import 'package:ecommerce/features/shop/models/banners_models.dart';
import 'package:ecommerce/utils/constants/keys.dart';
import 'package:ecommerce/utils/helpers/helper_function.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../utils/exceptions/firebase_auth_exceptions.dart';
import '../../../utils/exceptions/firebase_exceptions.dart';
import '../../../utils/exceptions/format_exceptions.dart';
import '../../../utils/exceptions/platform_exceptions.dart';

class BannerRepository extends GetxController {
  static BannerRepository get instance => Get.find();

  /// Variables
  final _db = FirebaseFirestore.instance;
  final _cloudinaryServices = Get.put(CloudinaryServices());

  /// Upload Banners --- Function to upload list of banners
  Future<void> uploadBanners(List<BannerModel> banners) async {
    try {
      for(final banner in banners){
        //  convert assetPath to File
        File image = await UHelperFunctions.assetToFile(banner.imageUrl);
        // Upload banner image to cloudinary
        dio.Response response = await _cloudinaryServices.uploadImage(image, UKeys.bannersFolder);
        if(response.statusCode==200){
          banner.imageUrl = response.data['url'];
        }
        await _db.collection(UKeys.bannersCollection).doc().set(banner.toJson());
        print('Banner Uploaded : ${banner.targetScreen}');
      }

    }
    on FirebaseAuthException catch (e) {
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

  /// [Fetch Banners] ---- Function to fetch all active banners only
 Future<List<BannerModel>> fetchActiveBanners() async {
    try{

      final query = await _db.collection(UKeys.bannersCollection).where('active', isEqualTo: true).get();
      if(query.docs.isNotEmpty){
        List<BannerModel> banners = query.docs.map((document)=> BannerModel.fromDocument(document)).toList();
        return banners;
      }
      return [];
    }
      on FirebaseAuthException catch (e) {
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
