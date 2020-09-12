import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/providers/orders.dart' hide OrderItem;
import 'package:shop_app/screens/order_item.dart';
import 'package:shop_app/widgets/main_drawer.dart';

class OrdersPage extends StatelessWidget {
  static const String id = '/OrdersPage';
  const OrdersPage();

  @override
  Widget build(BuildContext context) {
    Orders orderData = Provider.of<Orders>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Orders'),
      ),
      drawer: MainDrawer(),
      body: ListView.builder(
        itemCount: orderData.numberOfOrders,
        itemBuilder: (context, index) => OrderItem(
            orderData.numberOfOrders - index, orderData.orders[index]),
      ),
    );
  }
}
