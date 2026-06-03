import 'dart:convert';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crypto/crypto.dart';
import 'package:dio/dio.dart' as dio;
import 'package:ecommerce/data/repository/authentication_repository.dart';
import 'package:ecommerce/data/services/cloudinary_services.dart';
import 'package:ecommerce/features/authentication/models/user_model.dart';
import 'package:ecommerce/utils/constants/apis.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../utils/constants/keys.dart';
import '../../../utils/exceptions/firebase_auth_exceptions.dart';
import '../../../utils/exceptions/firebase_exceptions.dart';
import '../../../utils/exceptions/format_exceptions.dart';
import '../../../utils/exceptions/platform_exceptions.dart';

class UserRepository extends GetxController {
  static UserRepository get instance => Get.find();

  /// Variable
  final _db = FirebaseFirestore.instance;
  final _cloudinaryServices = Get.put(CloudinaryServices());

  /// Function to store User data
  Future<void> savedUserRecord(UserModel user) async {
    try {
      await _db
          .collection(UKeys.userCollection)
          .doc(user.id)
          .set(user.toJson());
    } on FirebaseAuthException catch (e) {
      throw UFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw UFirebaseException(e.code).message;
    } on FormatException catch (e) {
      throw UFormatException();
    } on PlatformException catch (e) {
      throw UPlatformException(e.code).message;
    } catch (e) {
      throw ' Something went wrong. Please try again later';
    }
  }

  ///[Read] - Function to fetch user details based on current user
  Future<UserModel> fetchUserDetails() async {
    try {
      final documentSnapshots = await _db
          .collection(UKeys.userCollection)
          .doc(AuthenticationRepository.instance.currentUser!.uid)
          .get();
      if (documentSnapshots.exists) {
        UserModel user = UserModel.fromSnapshot(documentSnapshots);
        return user;
      }
      return UserModel.empty();
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

  /// [Update] -- Functions to update user single field
  Future<void> updateSingleField(Map<String, dynamic> map) async {
    try {
      _db
          .collection(UKeys.userCollection)
          .doc(AuthenticationRepository.instance.currentUser!.uid)
          .update(map);
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

  /// [Delete] - Function to delete user record
  Future<void> removeUserRecord(String userId) async {
    try {
      await _db.collection(UKeys.userCollection).doc(userId).delete();
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

  /// [UploadImage] - Function to upload user profile picture
  Future<dio.Response> uploadImage(File image) async {
    try {
      /*String api = UApiUrls.uploadApi(UKeys.cloudName);
      dio.FormData formData = dio.FormData.fromMap({
        'upload_preset': UKeys.uploadPreset,
        'folder': UKeys.profileFolder,
        'file': await dio.MultipartFile.fromFile(
          image.path,
          filename: image.path.split('/').last,
        ),
      });
      dio.Response response = await dio.Dio().post(api, data: formData);*/

      dio.Response response = await _cloudinaryServices.uploadImage(
        image,
        UKeys.profileFolder,
      );
      return response;
    } catch (e) {
      throw 'Failed to upload profile picture. Please try again';
    }
  }

  Future<dio.Response> deleteProfilePicture(String publicId) async {
    try {
      /*String api = UApiUrls.deleteApi(UKeys.cloudName);
      int timeStamp = (DateTime.now().millisecondsSinceEpoch / 1000).round();
      String signatureBase =
          'public_id=$publicId&timestamp=$timeStamp${UKeys.apiSecret}';
      String signature = sha1.convert(utf8.encode(signatureBase)).toString();
      final formData = dio.FormData.fromMap({
        'public_id': publicId,
        'api_key': UKeys.apiKey,
        'timestamp': timeStamp,
        'signature': signature,
      });
      dio.Response response = await dio.Dio().post(api, data: formData);*/
      dio.Response response = await _cloudinaryServices.deleteProfilePicture(
        publicId,
      );
      return response;
    } catch (e) {
      throw 'Something went wrong.Please try again';
    }
  }
}
