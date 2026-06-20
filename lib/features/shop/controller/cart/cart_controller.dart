import 'package:ecommerce/features/shop/controller/product/variation_controller.dart';
import 'package:ecommerce/features/shop/models/cart_item_model.dart';
import 'package:ecommerce/features/shop/models/product_model.dart';
import 'package:ecommerce/features/shop/models/product_variation_model.dart';
import 'package:ecommerce/utils/constants/enums.dart';
import 'package:ecommerce/utils/popups/snackbar_helpers.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  static GetxController get instance => Get.find();

  /// Variables
  RxInt noOfCartItems = 0.obs;
  RxDouble totalPrice = 0.0.obs;
  RxInt productQuantityInCart = 0.obs;
  RxList<CartItemModel> cartItems = <CartItemModel>[].obs;
  final variationController = VariationController.instance;

  /// Add Items in the cart4
  void addToCart(ProductModel product) {
    // Check quantity of the product
    if (productQuantityInCart < 1) {
      USnackBarHelpers.customToast(message: 'Select Quantity');
      return;
    }
    // Check Variation of product if it is variable product
    if (product.productType == ProductType.variable.toString() &&
        variationController.selectedVariation.value.id.isEmpty) {
      USnackBarHelpers.customToast(message: 'Select Variation');
      return;
    }
    // Out of Stock Status
    if (product.productType == ProductType.variable.toString()) {
      if (variationController.selectedVariation.value.stock < 1) {
        USnackBarHelpers.warningSnackBar(
          title: 'Out of Stock ',
          message: 'This variation is out of stock',
        );
        return;
      }
    } else {
      if (product.stock < 1) {
        USnackBarHelpers.warningSnackBar(
          title: 'Out of Stock ',
          message: 'This product is out of stock',
        );
      }
    }
    // Convert the ProductModel to CartItemModel with given quantity
    CartItemModel selectedItem = convertToCartItem(product, productQuantityInCart.value);

    // Check if  already added in the carts
    int index = cartItems.indexWhere((cartItem) => cartItem.productId == selectedCartItem.productId );
  }

  CartItemModel convertToCartItem(ProductModel product, int quantity) {
    if (product.productType == ProductType.single.toString()) {
      // Reset Variation in case of single product type
      variationController.resetSelectedAttributes();
    }
    ProductVariationModel variation   = variationController.selectedVariation.value;
    bool isVariation = variation.id.isNotEmpty;
    String image = isVariation ? variation.image : product.thumbnail;
    double price = isVariation ? variation.salePrice > 0.0 ? variation.salePrice : variation.price : product.salePrice > 0.0 ? product.salePrice : product.price;
    return CartItemModel(
        productId: product.id,
        quantity: quantity,
      title: product.title,
      brandName: product.brand != null ? product.brand!.name : '',
      image: image,
      price: price,
      selectedVariation: isVariation ? variation.attributeValues : null,
      variationId:  variation.id
    );
  }
}
