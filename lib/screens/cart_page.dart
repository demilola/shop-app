import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
//To show only the relevant part to avoid clashes
import 'package:shop_app/providers/cart.dart' show Cart;
//Alternatively, you can add 'as foo' to the second import and use it as a prefix to calling the item you need: foo.itemYouNeed;
import 'package:shop_app/widgets/cart_item.dart';

class CartPage extends StatelessWidget {
  static const String id = '/cart';
  const CartPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Cart cart = Provider.of<Cart>(context);
    final ThemeData theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('🛒Cart🛍'),
      ),
      body: Column(
        children: [
          Card(
            margin: EdgeInsets.all(15.0),
            child: Padding(
              padding: EdgeInsets.all(5.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Total:',
                    style: theme.textTheme.headline5,
                  ),
                  Spacer(),
                  Chip(
                    label: Text('\$${cart.totalAmount}'),
                    backgroundColor: theme.primaryColor,
                  ),
                  FlatButton(onPressed: () {}, child: Text('Place Order'))
                ],
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
                itemCount: cart.itemCount,
                itemBuilder: (context, index) {
                  //.values to access values in map
                  //.toList to turn iterable to a usable list
                  final item = cart.items.values.toList()[index];
                  return CartItem(
                    id: item.id,
                    price: item.price,
                    quantity: item.quantity,
                    title: item.title,
                    productId:cart.items.keys.toList()[index],
                  );
                }),
          ),
        ],
      ),
    );
  }
}
