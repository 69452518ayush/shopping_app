import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/data/repository/product/product_repository.dart';
import 'package:ecommerce/features/shop/models/product_model.dart';
import 'package:ecommerce/utils/popups/snackbar_helpers.dart';
import 'package:get/get.dart';

class AllProductController extends GetxController{
  static AllProductController get instance => Get.find();
  final _repository = ProductRepository.instance;


  Future<List<ProductModel>> fetchProductByQuery(Query? query) async {
    try{
      if(query==null) return [];
      List<ProductModel> products = await _repository.fetchProductsByQuery(query);
      return products;
    } catch(e){
      USnackBarHelpers.errorSnackBar(title: 'Failed', message: e.toString());
      return [];

    }
  }
}