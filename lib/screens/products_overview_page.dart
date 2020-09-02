import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/providers/cart.dart';
import 'package:shop_app/widgets/badge.dart';
import 'package:shop_app/widgets/products_grid.dart';

enum FilterOptions { Favorites, All }

class ProductsOverviewPage extends StatefulWidget {
  @override
  _ProductsOverviewPageState createState() => _ProductsOverviewPageState();
}

class _ProductsOverviewPageState extends State<ProductsOverviewPage> {
  bool _showOnlyFavorites = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Shopping App'),
          actions: [
            PopupMenuButton(
                onSelected: (FilterOptions value) {
                  setState(() {
                    switch (value) {
                      case FilterOptions.Favorites:
                        _showOnlyFavorites = true;
                        break;
                      default:
                        _showOnlyFavorites = false;
                    }
                  });
                },
                itemBuilder: (context) => [
                      PopupMenuItem(
                        child: Text('Only favorites'),
                        value: FilterOptions.Favorites,
                      ),
                      PopupMenuItem(
                        child: Text('Show All'),
                        value: FilterOptions.All,
                      )
                    ]),
            Consumer<Cart>(
              //The third parameter (pikin) doesnt listen to changes
                builder: (_, cart, pikin) => Badge(
                      child: pikin,
                      value: cart.itemCount.toString(),
                    ),
                child: IconButton(
                  icon: Icon(Icons.shopping_cart),
                  onPressed: () {},
                ))
          ],
        ),
        //The bool set by selecting differnt options in the popupmenu is passed to the next page
        body: ProductsGrid(_showOnlyFavorites));
  }
}
