import 'package:ecommerce/features/shop/screens/cart/cart_screens.dart';
import 'package:ecommerce/features/shop/screens/store/store.dart';
import 'package:ecommerce/navigation_menu.dart';
import 'package:ecommerce/routes/routes.dart';
import 'package:get/get.dart';

import '../features/authentication/screens/foget_password/forget_password.dart';
import '../features/authentication/screens/onboarding/login/login.dart';
import '../features/authentication/screens/onboarding/onboarding.dart';
import '../features/authentication/screens/signup/signup.dart';
import '../features/authentication/screens/signup/verify_email.dart';
import '../features/personalization/screens/adress/address_screen.dart';
import '../features/personalization/screens/edit_profile/edit_profile.dart';
import '../features/personalization/screens/profile/profile.dart';
import '../features/shop/screens/checkout/checkout.dart';
import '../features/shop/screens/order/order.dart';
import '../features/shop/screens/wishlist/wishlist.dart';

class UAppRoutes {
  static final screen = [
    GetPage(name: URoutes.home, page: () => NavigationMenu()),
    GetPage(name: URoutes.store, page: () => StoreScreen()),
    GetPage(name: URoutes.wishlist, page: () => const WishlistScreen()),
    GetPage(name: URoutes.profile, page: () => const ProfileScreen()),
    GetPage(name: URoutes.order, page: () => const OrderScreen()),
    GetPage(name: URoutes.checkout, page: () => const CheckoutScreen()),
    GetPage(name: URoutes.cart, page: () => const CartScreens()),
    GetPage(name: URoutes.editProfile, page: () => const EditProfileScreen()),
    GetPage(name: URoutes.userAddress, page: () => const AddressScreen()),
    GetPage(name: URoutes.signup, page: () => const SignupScreen()),
    GetPage(name: URoutes.verifyEmail, page: () => const VerifyEmailScreen()),
    GetPage(name: URoutes.signIn, page: () => const LoginScreen()),
    GetPage(
      name: URoutes.forgetPassword,
      page: () => const ForgetPasswordScreen(),
    ),
    GetPage(name: URoutes.onBoarding, page: () => const OnboardingScreen()),
  ];
}
