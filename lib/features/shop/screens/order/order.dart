import 'package:ecommerce/common/widgets/appbar/appBar.dart';
import 'package:ecommerce/features/shop/screens/order/widgets/orders_list.dart';
import 'package:flutter/material.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: UAppBar(
        showBackArrow: true,
        title: Text('My Orders', style: Theme.of(context).textTheme.bodyLarge),
      ),
      body: Column(children: [UOrdersList()]),
    );
  }
}
