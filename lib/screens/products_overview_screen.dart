import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/screens/cart_screen.dart';
import '../providers/cart.dart';
import '../widgets/products_grid.dart';
import '../widgets/badge.dart';

enum FilterOptions { Favorites, All }

class ProductsOverviewScreen extends StatefulWidget {
  const ProductsOverviewScreen({super.key});

  @override
  State<ProductsOverviewScreen> createState() => _ProductsOverviewScreenState();
}

class _ProductsOverviewScreenState extends State<ProductsOverviewScreen> {
  var _showOnlyFavorites = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MyShop'),
        actions: <Widget>[
          PopupMenuButton(
            onSelected: (FilterOptions selectedValue) {
              setState(() {
                if (selectedValue == FilterOptions.Favorites) {
                  _showOnlyFavorites = true;
                } else {
                  _showOnlyFavorites = false;
                }
              });
            },
            icon: const Icon(
              Icons.more_vert,
            ),
            itemBuilder: (_) => const [
              PopupMenuItem(
                  value: FilterOptions.Favorites,
                  child: Text('Only Favorites')),
              PopupMenuItem(value: FilterOptions.All, child: Text('Show All')),
            ],
          ),
          Consumer<Cart>(
            builder: (_, cart, ch) => BadgeWidget(
                value: cart.itemCount.toString(),
                child: ch ?? const SizedBox()),
            child:
                IconButton(onPressed: () {
                  Navigator.of(context).pushNamed(CartScreen.routeName);
                }, icon: Icon(Icons.shopping_cart)),
          ),
        ],
      ),
      body: ProductsGrid(_showOnlyFavorites),
    );
  }
}
