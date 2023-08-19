import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/cart.dart' show Cart;
import '../providers/orders.dart';
import '../widgets/cart_widget.dart';

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
                    label: Text(
                      '\$${cart.totalAmount.toStringAsFixed(2)}',
                      style: TextStyle(
                          color: Theme.of(context)
                              .primaryTextTheme
                              .titleLarge
                              ?.color),
                    ),
                    backgroundColor: Theme.of(context).colorScheme.primary,
                  ),
                  TextButton(
                      onPressed: () {
                        Provider.of<Orders>(context, listen: false).addOrder(
                          cart.items.values.toList(),
                          cart.totalAmount,
                        );
                        cart.clear();
                      },
                      child: Text(
                        'ORDER NOW',
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.primary),
                      ))
                ],
              ),
            ),
          ),
          SizedBox(height: 10),
          Expanded(
            child: ListView.builder(
              itemCount: cart.items.length,
              itemBuilder: (ctx, i) => CartWidget(
                  id: cart.items.values.toList()[i].id,
                  productId: cart.items.keys.toList()[i],
                  title: cart.items.values.toList()[i].title,
                  quantity: cart.items.values.toList()[i].quantity,
                  price: cart.items.values.toList()[i].price),
            ),
          )
        ],
      ),
    );
  }
}
