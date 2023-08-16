import 'package:flutter/material.dart';
import 'package:shop/screens/product_detail_screen.dart';
import 'package:shop/screens/products_overview_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(  
      title: 'MyShop',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        colorScheme: ThemeData().colorScheme.copyWith(
          secondary: Colors.deepOrange
        ),
        fontFamily: 'Lato',
      ),
      home: ProductsOverviewScreen(),
      routes: {
        ProductDetailScreen.routeName: (ctx) => ProductDetailScreen()
      },
    );
  }
}

