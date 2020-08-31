import 'package:flutter/material.dart';
import 'package:shop_app/models/product.dart';

class ProductItem extends StatelessWidget {
  const ProductItem(this.product);
  final Product product;

  @override
  Widget build(BuildContext context) {
    return GridTile(
      child: Image.network(
        product.imageUrl,
        fit: BoxFit.cover,
      ),
      footer: GridTileBar(
        backgroundColor: Colors.black45,
        title: Text(
          product.title,
          textAlign: TextAlign.center,
        ),
        leading: IconButton(
          icon: Icon(Icons.favorite_border),
          onPressed: () {},
        ),trailing: IconButton(
          icon: Icon(Icons.shopping_cart_outlined),
          onPressed: () {},
        ),
      ),
    );
  }
}
