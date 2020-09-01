import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/providers/product.dart';
import 'package:shop_app/providers/products.dart';
import 'package:shop_app/widgets/product_item.dart';

class ProductsGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //To access the provider and its content
    final productsData = Provider.of<Products>(context);

    //To get the list of products
    List products = productsData.items;

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
        ChangeNotifierProvider<Product>(
          create: (context)=>products[index],
              child: ProductItem(),
            ));
  }
}
