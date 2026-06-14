import 'package:ecommerce/data/repository/product/product_repository.dart';
import 'package:ecommerce/features/shop/models/product_model.dart';
import 'package:ecommerce/utils/constants/enums.dart';
import 'package:ecommerce/utils/constants/texts.dart';
import 'package:ecommerce/utils/popups/snackbar_helpers.dart';
import 'package:get/get.dart';

class ProductController extends GetxController{
  static ProductController get instance => Get.find();
  /// Variables
  final _repository = Get.put(ProductRepository());
  RxList<ProductModel> featuredProducts = <ProductModel>[].obs;
  RxBool isLoading = false.obs;


  @override
  void onInit() {
    getFeaturedProduct();
    super.onInit();
  }

  /// Function to get only 4 products
  Future<void> getFeaturedProduct() async {
    try{
      // Start Loading
      isLoading.value = true;
      // fetch feature products
      List<ProductModel>  featuredProducts    = await _repository.fetchFeaturedProducts();
      //  assign All products
      this.featuredProducts.assignAll(featuredProducts);
    }catch(e){
      USnackBarHelpers.errorSnackBar(title: 'Failed',message: e.toString() );
    } finally{
      isLoading.value = false;
    }
  }

  /// Calculate Sale price Percentage
  String? calculateSalePercentage(double originalPrice, double? salePrice){
    if(salePrice==null || salePrice <= 0.0) return null;
    if(originalPrice<= 0.0 ) return null;
    double percentage = ((originalPrice - salePrice) / originalPrice) * 100;
    return percentage.toStringAsFixed(1);
  }

  /// Get Product Price or Prices Price range For variable product
  String getProductPrice(ProductModel product){
    double smallestPrice = double.infinity;
    double largestPrice = 0.0;
    // if not variation exist , return the single price or salePrice
    if(product.productType== ProductType.single.toString()){
      return product.salePrice > 0 ?  product.salePrice.toString() : product.price.toString();
    } else{
      // Calculate the Smallest and largets price among the variation
      for(final variation  in product.productVariations!){
        double variationPrice = variation.salePrice > 0 ? variation.salePrice : variation.price;

        if(variationPrice > largestPrice){
          largestPrice = smallestPrice ;
        }
        if(variationPrice < smallestPrice){
          smallestPrice = variationPrice ;
        }
      }
      if(smallestPrice.isEqual(largestPrice)){
        return largestPrice.toString();
      } else {
        return '${largestPrice.toStringAsFixed(0)} - ${UTexts.currency}${smallestPrice.toStringAsFixed(0)}';
      }
    }
  }

  /// Get Product stock status
  String getProductStockStatus(int  stock){
    return stock > 0 ? 'In Stock' : ' Out of Stock';
  }
}