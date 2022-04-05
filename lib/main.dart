import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoeapp/providers/cart.dart';
import 'package:shoeapp/providers/orders.dart';
import 'package:shoeapp/providers/products.dart';
import 'package:shoeapp/screens/cart_screen.dart';
import 'package:shoeapp/screens/orders_screen.dart';
import 'package:shoeapp/screens/product_detail_screen.dart';
import 'package:shoeapp/screens/product_overview_screen.dart';
import 'package:shoeapp/screens/user_products_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
      create: (ctx) => Products(),
        ),
        ChangeNotifierProvider(
      create: (ctx) => Cart(),
        ),
        ChangeNotifierProvider(
      create: (ctx) => Orders(),
        ),

      ],
      child: MaterialApp(
        title: 'ShopApp',
        theme: ThemeData(
         
           primarySwatch: Colors.purple,
          // ignore: deprecated_member_use
          accentColor: Colors.deepOrange,
          fontFamily: "Lato",
          
        ),
        debugShowCheckedModeBanner: false,
        home: const ProductsOverviewScreen(),
        routes: {
          ProductDetailScreen.routeName: (ctx) => const ProductDetailScreen(),
          CartScreen.routeName: (ctx) => const CartScreen(),
          OrdersScreen.routeName: (ctx) => const OrdersScreen(),
          UserProductsScreen.routeName: (ctx) => const UserProductsScreen()
        },
      ),
    );
  }
}

