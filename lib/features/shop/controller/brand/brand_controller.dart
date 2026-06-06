import 'package:ecommerce/data/repository/brand/brand_repositories.dart';
import 'package:ecommerce/features/shop/models/brand_model.dart';
import 'package:ecommerce/utils/popups/snackbar_helpers.dart';
import 'package:get/get.dart';

class BrandController extends GetxController{
  static BrandController get instance => Get.find();

  /// Variables
 final _repository = Get.put(BrandRepositories());
 RxList<BrandModel> allBrands =<BrandModel>[].obs;
 RxList<BrandModel> featureBrands =<BrandModel>[].obs;
 RxBool isLoading = false.obs;

  @override
  void onInit() {
    getBrands();
    super.onInit();
  } // Get All Brands And Featured Brands
 Future<void> getBrands() async {
   try{
     // Start Loading
     isLoading.value = true;
      List<BrandModel> allBrands=await _repository.fetchBrands();
      this.allBrands.assignAll(allBrands);
      featureBrands.assignAll(allBrands.where((brand) => brand.isFeatured ?? false));
   } catch(e){
     USnackBarHelpers.errorSnackBar(title: 'Failed',message: e.toString());
   } finally{
     isLoading.value =false;
   }
 }
}