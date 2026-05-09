import 'package:ecommerce/data/repository/user/user_repository.dart';
import 'package:ecommerce/features/authentication/models/user_model.dart';
import 'package:ecommerce/utils/popups/snackbar_helpers.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class UserController  extends GetxController{
  static UserController get instance => Get.find();

  /// Variable
  final _userRepository = Get.put(UserRepository());
 Future<void> saveUserRecord(UserCredential userCredential) async {
   try{
     // Convert Full Name to First Name to last Name
     final nameParts =  UserModel.nameParts(userCredential.user!.displayName);
     final username = '${userCredential.user!.displayName}730545';
     // Create User Model
     UserModel userModel = UserModel(
         id: userCredential.user!.uid,
         firstName: nameParts[0],
         lastName: nameParts.length> 1 ? nameParts.sublist(1).join(''): '',
         username: username,
         email: userCredential.user!.email ?? '',
         phoneNumber: userCredential.user!.phoneNumber ?? '',
         profilePicture: userCredential.user!.photoURL ?? '');
     // Save User record
     await _userRepository.savedUserRecord(userModel);
   } catch(e){
     USnackBarHelpers.warningSnackBar(title: 'Data not sayed',message: ' Something went wrong while saying your information');
   }
 }
}