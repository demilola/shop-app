import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/providers/products.dart';
import 'package:shop_app/widgets/product_item.dart';

class ProductsGrid extends StatelessWidget {
  //This bool is received to let the app know whether or not to show only favorite items
  final bool _showOnlyFavorites;

  const ProductsGrid(this._showOnlyFavorites);

  @override
  Widget build(BuildContext context) {
    //To access the provider and its content
    final productsData = Provider.of<Products>(context);

    //To get the list of products
    //Here, there is a ternary expressionto check what the enduser wants to see and return whatever it is in a list
    List<Product> products =
        _showOnlyFavorites ? productsData.favorites : productsData.items;

    return GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 1.5,
            crossAxisSpacing: 8.0,
            mainAxisSpacing: 8.0),
        itemCount: products.length,
        itemBuilder: (context, index) =>

            //To listen to provider of a specific product
            //Since we are now using a provider, it is unnecessary to pass data to the page. Provider will handle that with context
            //If you dont need the context, use provider.value(as shown below) instead
            //Use when youre providing data on grid or lists instead
            ChangeNotifierProvider<Product>.value(
              //Also, this provider cleans up automatically to free up memory
              value: products[index],
              child: ProductItem(),
            ));
  }
}
