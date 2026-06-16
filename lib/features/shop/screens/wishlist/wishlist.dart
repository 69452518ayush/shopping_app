import 'package:ecommerce/common/products/product_carts/product_cart_vertical.dart';
import 'package:ecommerce/common/widgets/appbar/appBar.dart';
import 'package:ecommerce/common/widgets/icons/circular_icon.dart';
import 'package:ecommerce/common/widgets/layout/grid_layout.dart';
import 'package:ecommerce/common/widgets/loader/animation_loader.dart';
import 'package:ecommerce/common/widgets/shimmer/shimmer_effect.dart';
import 'package:ecommerce/common/widgets/shimmer/vertical_product_shimmer.dart';
import 'package:ecommerce/features/shop/controller/product/favourite_controller.dart';
import 'package:ecommerce/features/shop/models/product_model.dart';
import 'package:ecommerce/navigation_menu.dart';
import 'package:ecommerce/utils/constants/sizes.dart';
import 'package:ecommerce/utils/helpers/cloud_helpers_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../utils/constants/images.dart';

class WishlistScreen extends StatelessWidget {
  const WishlistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: UAppBar(
        title: Text(
          'Wishlist',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        action: [
          UCircularIcon(
            icon: Iconsax.add,
            onPressed: () =>
                NavigationController.instance.selectedIndex.value = 0,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(USizes.defaultSpace),
          child: Obx(
            () => FutureBuilder(
              future: FavouriteController.instance.getFavouriteProducts(),
              builder: (context, snapshot) {
                final nothingFound = UAnimationLoader(
                  text: 'Wishlist is Empty....',
                  animation: UImages.perfumeIcon,
                  showActionButton: true,
                  actionText: "Let's add more",
                  onActionPressed: () =>
                      NavigationController.instance.selectedIndex.value = 0,
                );
                const loader = UVerticalProductShimmer(itemCount: 6);

                /// Handle Empty Data, Landing And Error
                final widget = UCloudHelperFunctions.checkMultiRecordState(
                  snapshot: snapshot,
                  loader: loader,
                  nothingFound: nothingFound,
                );
                if (widget != null) return widget;

                // Product Found
                List<ProductModel> product = snapshot.data!;

                return UGridLayout(
                  itemCount: 10,
                  itemBuilder: (context, index) =>
                      UProductCartVertical(product: product[index]),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
