import 'dart:convert';
import 'dart:io';

import 'package:crypto/crypto.dart';
import 'package:dio/dio.dart' as dio ;
import 'package:get/get.dart';

import '../../utils/constants/apis.dart';
import '../../utils/constants/keys.dart';

class CloudinaryServices extends GetxController{
  static CloudinaryServices get instance => Get.find();
final _dio = dio.Dio();
  /// [UploadImage] - Function to upload user profile picture
  Future<dio.Response> uploadImage(File image , String folderName) async {
    try {
      String api = UApiUrls.uploadApi(UKeys.cloudName);
      dio.FormData formData = dio.FormData.fromMap({
        'upload_preset': UKeys.uploadPreset,
        'folder': folderName,
        'file': await dio.MultipartFile.fromFile(
          image.path,
          filename: image.path.split('/').last,
        ),
      });
      dio.Response response = await _dio.post(api, data: formData);
      return response;
    } catch (e) {
      throw 'Failed to upload profile picture. Please try again';
    }
  }

  Future<dio.Response> deleteProfilePicture(String publicId) async {
    try {
      String api = UApiUrls.deleteApi(UKeys.cloudName);
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
      dio.Response response = await _dio.post(api, data: formData);
      return response;
    } catch (e) {
      throw 'Something went wrong.Please try again';
    }
  }
}