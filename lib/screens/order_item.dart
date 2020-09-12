import 'package:flutter/material.dart';
import 'package:shop_app/providers/orders.dart' as op;
import 'package:intl/intl.dart';

class OrderItem extends StatelessWidget {
  final op.OrderItem order;
  final int index;

  const OrderItem(this.index, this.order, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // OrderItem item = Provider.of<Orders>(context).orders[index];
    return Card(
      margin: const EdgeInsets.symmetric(
        horizontal: 15.0,
        vertical: 4.0,
      ),
      child: Column(
        children: [
          ListTile(
            leading: CircleAvatar(
              child: Text(index.toString()),
            ),
            title: Text(
              '\$${order.amount}',
              style: Theme.of(context).textTheme.subtitle2,
            ),
            subtitle: Text(
              //Date formats to dd/MM/yyyy HH:mm
              // (equivalent of: DateFormat('dd/MM/yyyy HH:mm'))
              DateFormat.yMd().add_Hm().format(order.dateTime),
            ),
            trailing:
                IconButton(icon: Icon(Icons.expand_more), onPressed: () {}),
          ),
        ],
      ),
    );
  }
}
