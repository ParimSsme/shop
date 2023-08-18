import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/cart.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  static const routeName = '/cart';

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Cart'),
      ),
      body: Column(
        children: [
          Card(
            margin: EdgeInsets.all(15),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Total',
                    style: TextStyle(fontSize: 20),
                  ),
                  const Spacer(),
                  Chip(
                    label: Text('\$${cart.totalAmount}', style: TextStyle(color: Theme.of(context).primaryTextTheme.titleLarge?.color),),
                    backgroundColor: Theme.of(context).colorScheme.primary,
                  ),
                  TextButton(onPressed: (){}, child: Text('ORDER NOW', style: TextStyle(color: Theme.of(context).colorScheme.primary),))
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
