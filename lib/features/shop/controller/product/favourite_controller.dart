import 'dart:convert';

import 'package:ecommerce/data/repository/authentication_repository.dart';
import 'package:ecommerce/data/repository/product/product_repository.dart';
import 'package:ecommerce/features/shop/models/product_model.dart';
import 'package:ecommerce/utils/popups/snackbar_helpers.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class FavouriteController extends GetxController{
  static FavouriteController instance = Get.find();
  
  
  /// Variables
  RxMap<String, bool> favourites = <String, bool>{}.obs;
  final _storage = GetStorage(AuthenticationRepository.instance.currentUser!.uid);
  @override
  void onInit(){
    initFavourites();
    super.onInit();
  }
  /// Load to add Or Remove Product from wishlist
  Future<void> initFavourites() async {
      String encodedFavourites = await _storage.read('favourites');
      Map<String, dynamic> storedFavourites = jsonDecode(encodedFavourites) as Map<String ,dynamic>;
      favourites.assignAll(storedFavourites.map((key , value) => MapEntry(key, value as bool)));
  }
  /// Function to remove Product from wishlist
  void toggleFavouriteProduct(String productId) {
    if(favourites.containsKey(productId)){
      favourites.remove(productId);
      saveFavouriteToStorage();
      USnackBarHelpers.customToast(message: 'Product has been removed from the Wishlist');
    } else{
      favourites[productId] = true;
      saveFavouriteToStorage();
      USnackBarHelpers.customToast(message: 'Product has been added from the Wishlist');

    }
  }
  /// Function to store favourites in local storage
  void saveFavouriteToStorage() {
    String encodeFavourites = jsonEncode(favourites);
    _storage.write('favourite', encodeFavourites);
  }
  
  bool isFavourite(String productId){
    return favourites[productId] ?? false;
  }
  
  
  Future<List<ProductModel>> getFavouriteProducts() async{
    final productIds = favourites.keys.toList();
    return await ProductRepository.instance.getFavouriteProducts(productIds);
  }
}