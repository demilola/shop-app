import 'package:flutter/material.dart';

class CartItem extends StatelessWidget {
  const CartItem({Key key, this.id, this.price, this.quantity, this.title})
      : super(key: key);
  final String id;
  final double price;
  final int quantity;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(
        horizontal: 15.0,
        vertical: 4.0,
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.all(8.0),
        leading: CircleAvatar(
          child: FittedBox(
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: Text(
                '\$$price',
                style: Theme.of(context).textTheme.subtitle2,
              ),
            ),
          ),
        ),
        title: Text(title),
        subtitle: Text('Total: \$${price * quantity}'),
        trailing: Text('x$quantity'),
      ),
    );
  }
}
