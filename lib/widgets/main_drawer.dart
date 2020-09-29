import 'package:flutter/material.dart';
import 'package:shop_app/screens/orders_page.dart';
import 'package:shop_app/screens/user_products_page.dart';

class MainDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          // DrawerHeader(
          //   decoration: BoxDecoration(color: Theme.of(context).primaryColor),
          //   child: Center(
          //     child: Text(
          //       'Shop App',
          //       style: Theme.of(context).textTheme.headline5,
          //     ),
          //   ),
          // ),
          AppBar(
            automaticallyImplyLeading: false,
          ),
          ListTile(
            leading: Icon(Icons.shopping_bag),
            title: Text('Shop'),
            onTap: () => Navigator.pushReplacementNamed(context, '/'),
          ),
          ListTile(
            leading: Icon(Icons.payment),
            title: Text('Orders'),
            onTap: () => Navigator.pushReplacementNamed(context, OrdersPage.id),
          ),
          ListTile(
            leading: Icon(Icons.inventory),
            title: Text('Your Products'),
            onTap: () => Navigator.pushReplacementNamed(context, UserProductsPage.id),
          ),
        ],
      ),
    );
  }
}
