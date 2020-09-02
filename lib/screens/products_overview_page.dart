import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/providers/products.dart';
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
                    ])
          ],
        ),
        //The bool set by selecting differnt options in the popupmenu is passed to the next page
        body: ProductsGrid(_showOnlyFavorites));
  }
}
