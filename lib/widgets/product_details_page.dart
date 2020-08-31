import 'package:flutter/material.dart';
import 'package:shop_app/models/product.dart';

class ProductDetailsPage extends StatelessWidget {
  static String id = '/product_details';

  @override
  Widget build(BuildContext context) {
    final String productId =
        ModalRoute.of(context).settings.arguments as String;
    return Scaffold(
      appBar: AppBar(
        title: Text(productId.toString()),
      ),
    );
  }
}
