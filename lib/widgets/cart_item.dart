import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/providers/cart.dart';

class CartItem extends StatelessWidget {
  const CartItem(
      {Key key, this.id, this.price, this.quantity, this.title, this.productId})
      : super(key: key);
  final String id;
  final String productId;
  final double price;
  final int quantity;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(id), //What if you use a UniqueKey()
      direction: DismissDirection.endToStart,
      background: Container(
        margin: EdgeInsets.symmetric(
            horizontal:
                16.0), //So that the edge can be aligned with the edge of the card
        color: Theme.of(context).errorColor,
        alignment: Alignment(0.9, 0.0),
        child: Icon(Icons.delete, size: 25.0),
      ),
      onDismissed: (direction) {
        Provider.of<Cart>(context, listen: false).removeItem(productId);
        Scaffold.of(context).showSnackBar(
          SnackBar(
            content: Text("$title removed from Cart"),
            duration: Duration(seconds: 1),
            backgroundColor:Theme.of(context).errorColor ,
          ),
        );
      },
      child: Card(
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
          subtitle: Text('Total: \$${(price * quantity).toStringAsFixed(2)}'),
          trailing: Text('x$quantity'),
        ),
      ),
    );
  }
}
