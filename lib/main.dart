import 'package:flutter/material.dart';
import 'package:shoeapp/screens/product_overview_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ShopApp',
      theme: ThemeData(
       
         primarySwatch: Colors.purple,
        // ignore: deprecated_member_use
        accentColor: Colors.deepOrange,
        fontFamily: "Lato",
      ),
      home: ProductsOverviewScreen(),
    );
  }
}

