import 'package:ecommerce/data/repository/category/category_repository.dart';
import 'package:ecommerce/data/repository/product/product_repository.dart';
import 'package:ecommerce/features/shop/models/category_models.dart';
import 'package:ecommerce/features/shop/models/product_model.dart';
import 'package:ecommerce/utils/popups/snackbar_helpers.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

class CategoryController extends GetxController {
  static CategoryController get instance => Get.find();

  ///  variables
  final _repository = Get.put(CategoryRepository());
  RxList<CategoryModel> allCategories = <CategoryModel>[].obs;
  RxList<CategoryModel> featuredCategories = <CategoryModel>[].obs;
  RxBool isCategoriesLoading = false.obs;
  @override
  void init() {
    fetchCategories();
    super.onInit();
  }

  /// Function to fetch all categories & featured from Firebase
  Future<void> fetchCategories() async {
    try {
      // Start Loading
      isCategoriesLoading.value = false;
      // Fetch categories
      List<CategoryModel> categories = await _repository.getAllCategories();
      allCategories.assignAll(categories);
      // Get featured categories
      featuredCategories.assignAll(
        categories.where(
          (category) => category.isFeatured && category.parentId.isEmpty,
        ),
      );
    } catch (e) {
      USnackBarHelpers.errorSnackBar(title: 'Failed',message: e.toString());
    } finally{
      isCategoriesLoading.value = false;
    }
  }

  /// Get Category Product
  Future<List<ProductModel>> getCategoryProduct({required String categoryId, int limit = 4 }) async {
    try{
      final products = ProductRepository.instance.getProductsForCategory(categoryId: categoryId, limit:limit );

      return products;
    } catch(e){
      USnackBarHelpers.errorSnackBar(title: 'Fialed',message: e.toString());
      return [];
    }
  }
}
