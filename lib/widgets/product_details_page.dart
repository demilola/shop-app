import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/providers/products.dart';

class ProductDetailsPage extends StatelessWidget {
  static String id = '/product_details';

  @override
  Widget build(BuildContext context) {
    final String productId =
        ModalRoute.of(context).settings.arguments as String;
    //This method uses the product id gotten as an arg from the previous page as an input for the method defined in the products provider to return a product and subsequently store it in the var
    final loadedProduct = Provider.of<Products>(context).findByID(productId);

    return Scaffold(
      appBar: AppBar(
        title: Text(loadedProduct.title),
      ),
    );
  }
}
