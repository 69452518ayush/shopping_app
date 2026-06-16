import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/common/styles/padding.dart';
import 'package:ecommerce/common/widgets/appbar/appBar.dart';
import 'package:ecommerce/features/shop/controller/product/all_product_controller.dart';
import 'package:ecommerce/utils/helpers/cloud_helpers_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/widgets/products/sortable_products.dart';
import '../../models/product_model.dart';

class AllProductsScreen extends StatelessWidget {
  const AllProductsScreen({super.key,  this.futureMethod, this.query, required this.title});

  final Future<List<ProductModel>>? futureMethod;
  final Query? query;
  final String title;
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AllProductController());
    return Scaffold(
      appBar: UAppBar(
        showBackArrow: true,
        title: Text(
          title,
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: UPadding.screenPadding,
          child: FutureBuilder(
            future: futureMethod ?? controller.fetchProductByQuery(query),
              builder: (context, snapshot){
              final widget = UCloudHelperFunctions.checkMultiRecordState(snapshot: snapshot);
              if(widget != null) return  widget;
              final products = snapshot.data;
              return USortableProduct();
            },
          ),
        ),
      ),
    );
  }
}
