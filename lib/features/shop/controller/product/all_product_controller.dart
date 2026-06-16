import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/data/repository/product/product_repository.dart';
import 'package:ecommerce/features/shop/models/product_model.dart';
import 'package:ecommerce/utils/popups/snackbar_helpers.dart';
import 'package:get/get.dart';

class AllProductController extends GetxController {
  static AllProductController get instance => Get.find();
  final _repository = ProductRepository.instance;
  final RxString selectedSortOption = 'Name'.obs;
  final RxList<ProductModel> products = <ProductModel>[].obs;

  /// Fetch products using dynamic query
  Future<List<ProductModel>> fetchProductByQuery(Query? query) async {
    try {
      if (query == null) return [];
      List<ProductModel> products = await _repository.fetchProductsByQuery(
          query);
      return products;
    } catch (e) {
      USnackBarHelpers.errorSnackBar(title: 'Failed', message: e.toString());
      return [];
    }
  }
  /// Function to sort products
  void sortProducts(String sortOption) {
    selectedSortOption.value = sortOption;


    switch (sortOption) {
      case 'Name':
        products.sort((a, b) => a.title.compareTo(b.title));
        break;
      case 'Lower Price':
        products.sort((a, b) => a.price.compareTo(b.price));
      case 'Higher Price':
        products.sort((a, b) => b.price.compareTo(a.price));
      case 'Newest ':
        products.sort((a, b) => a.date!.compareTo(b.date!));
      case 'Sale ':
        products.sort((a, b) {
          if (b.salePrice > 0) {
            return b.salePrice.compareTo(a.salePrice);
          } else if (a.salePrice > 0) {
            return -1;
          } else {
            return 1;
          }
        });
      default:
    }
  }
   /// Function to  assign
        void assignProducts(List<ProductModel> products) {
          this.products.addAll(products);
          sortProducts('Name');
        }
    }