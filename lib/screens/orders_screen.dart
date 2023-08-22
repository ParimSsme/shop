import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/widgets/order_widget.dart';

import '../providers/orders.dart';
import '../widgets/app_drawer.dart';

class OrdersScreen extends StatelessWidget {

  static const routeName = '/orders';

  const OrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final orderData = Provider.of<Orders>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Orders'),
      ),
      drawer: const AppDrawer(),
      body: ListView.builder(
        itemCount: orderData.orders.length,
        itemBuilder: (ctx, i) => OrderWidget(orderData.orders[i]),
      ),
    );
  }
}
