import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/data/repository/authentication_repository.dart';
import 'package:ecommerce/features/authentication/models/user_model.dart';
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

  /// Function to store User data
  Future<void> savedUserRecord(UserModel user) async {
    try {
      await _db.collection(UKeys.userCollection).doc(user.id).set(user.toJson());
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
      final documentSnapshots = await _db.collection(UKeys.userCollection).doc(AuthenticationRepository.instance.currentUser!.uid).get();
      if(documentSnapshots.exists){
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
    } catch(e){
      throw ' Something went wrong . Please try again later';
    }
  }
  /// [Update] -- Functions to update user single field
  Future<void> updateSingleField(Map<String , dynamic> map) async {
    try {
      _db.collection(UKeys.userCollection).doc(AuthenticationRepository.instance.currentUser!.uid).update(map);
    } on FirebaseAuthException catch (e) {
      throw UFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw UFirebaseException(e.code).message;
    } on FormatException catch (e) {
      throw UFormatException();
    } on PlatformException catch (e) {
      throw UPlatformException(e.code).message;
    } catch(e){
      throw ' Something went wrong . Please try again later';
    }
  }
}
