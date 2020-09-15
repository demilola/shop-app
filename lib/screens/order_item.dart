import 'dart:math';

import 'package:flutter/material.dart';
import 'package:shop_app/providers/orders.dart' as op;
import 'package:intl/intl.dart';

class OrderItem extends StatefulWidget {
  final op.OrderItem order;
  final int index;

  const OrderItem(this.index, this.order, {Key key}) : super(key: key);

  @override
  _OrderItemState createState() => _OrderItemState();
}

class _OrderItemState extends State<OrderItem> {
  bool _expanded = false;
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(
        horizontal: 15.0,
        vertical: 4.0,
      ),
      child: Column(
        children: [
          ListTile(
            leading: CircleAvatar(
              child: Text(widget.index.toString()),
            ),
            title: Text(
              '\$${widget.order.amount.toStringAsFixed(2)}',
              style: Theme.of(context).textTheme.subtitle2,
            ),
            subtitle: Text(
              //Date formats to dd/MM/yyyy HH:mm
              // (equivalent of: DateFormat('dd/MM/yyyy HH:mm'))
              DateFormat.yMd().add_Hm().format(widget.order.dateTime),
            ),
            trailing: IconButton(
                icon: Icon(_expanded ? Icons.expand_less : Icons.expand_more),
                onPressed: () => setState(() => _expanded = !_expanded)),
          ),
          if (_expanded)
            Container(
                //min returns the smaller of the two values
                //Here, the two values are (180) and the amount of products in the order * 20 + 100
                height: min(widget.order.products.length * 30.0 + 10, 120),
                child: ListView(
                  children: widget.order.products
                      .map(
                        (product) => Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16.0, vertical: 4.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                product.title,
                                style: Theme.of(context).textTheme.bodyText1,
                              ),
                              Text('${product.quantity} x \$${product.price}')
                            ],
                          ),
                        ),
                      )
                      .toList(),
                ))
        ],
      ),
    );
  }
}
