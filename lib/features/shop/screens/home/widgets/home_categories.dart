import 'package:ecommerce/common/widgets/shimmer/category_shimmer.dart';
import 'package:ecommerce/features/shop/controller/category/category_controller.dart';
import 'package:ecommerce/features/shop/models/category_models.dart';
import 'package:ecommerce/features/shop/screens/sub_category/sub_category.dart';
import 'package:ecommerce/utils/constants/images.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../common/widgets/image_text/vartical_image_text.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/texts.dart';

class UHomeCategories extends StatelessWidget {
  const UHomeCategories({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CategoryController());
    return Padding(
      padding: const EdgeInsets.only(left: USizes.spaceBtwSections),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// SectionHeading
          Text(
            UTexts.popularCategories,
            style: Theme.of(
              context,
            ).textTheme.headlineSmall!.apply(color: UColors.white),
          ),
          SizedBox(height: USizes.spaceBtwSections),

          /// Categories ListView
          Obx(() {
            final categories = controller.featuredCategories;

            /// [LoadingState]
            if (controller.isCategoriesLoading.value) {
              return UCategoryShimmer(itemCount: 6,);
            }

            /// [Empty]
            if (categories.isEmpty) {
              return Text('Categories Not Found');
            }
            /// Data Found
            return SizedBox(
              height: 80,
              child: ListView.separated(
                separatorBuilder: (context, index) =>
                    SizedBox(width: USizes.spaceBtwItems),
                scrollDirection: Axis.horizontal,
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  CategoryModel category = categories[index];
                  return UVerticalImageText(
                    title: category.name,
                    image: category.image,
                    textColor: UColors.white,
                    onTap: () => Get.to(() => SubCategoryScreen(category: category)),
                  );
                },
              ),
            );
          }),
        ],
      ),
    );
  }
}
