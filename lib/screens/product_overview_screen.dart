import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoeapp/providers/cart.dart';
import 'package:shoeapp/widgets/badge.dart';
import 'package:shoeapp/widgets/products_grid.dart';

enum FilterOptions {
  // ignore: constant_identifier_names
  Favorites,
  // ignore: constant_identifier_names
  All,
}

class ProductsOverviewScreen extends StatefulWidget {
  const ProductsOverviewScreen({Key? key}) : super(key: key);

  @override
  State<ProductsOverviewScreen> createState() => _ProductsOverviewScreenState();
}

class _ProductsOverviewScreenState extends State<ProductsOverviewScreen> {
  var _showOnlyFavorites = false;

  get color => null;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('MyShop'), 
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
            icon: const Icon(Icons.more_vert),
            itemBuilder: (_) => [
                  const PopupMenuItem(
                    child: Text("Only Favorites"),
                    value: FilterOptions.Favorites,
                  ),
                  const PopupMenuItem(
                    child: Text("Only All"),
                    value: FilterOptions.All,
                  ),
                ]),
        Consumer<Cart>(
          builder: (_, cart, ch) => Badge(
            // key: Key,
            child: ch!,
            value: cart.itemCount.toString(),
            color: Colors.black,
            ),
            child: IconButton(
                onPressed: () {}, 
                icon: const Icon(Icons.shopping_cart)),
            )
      ]),
      body: ProductsGrid(_showOnlyFavorites),
    );
  }
}
