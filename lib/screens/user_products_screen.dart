import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/screens/edit_product_screen.dart';
import '../providers/products.dart';
import '../widgets/user_product_item.dart';
import '../widgets/app_drawer.dart';

class UserProductsScreen extends StatelessWidget {
  static const routeName = '/user-products';

  const UserProductsScreen({super.key});

  Future<void> _refreshProducts(BuildContext context) async {
    await Provider.of<Products>(context).fetchAndSetProducts();
  }

  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<Products>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Products'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              Navigator.of(context).pushNamed(EditProductScreen.routeName);
            },
          ),
        ],
      ),
      drawer: const AppDrawer(),
      body: RefreshIndicator(
        onRefresh: () => _refreshProducts(context),
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: ListView.builder(
            itemCount: productsData.items.length,
            itemBuilder: (_, i) => Column(
                  children: [
                    UserProductItem(
                      productsData.items[i].id,
                      productsData.items[i].title,
                      productsData.items[i].imageUrl,
                    ),
                    const Divider(),
                  ],
                ),
          ),
        ),
      ),
    );
  }
}
