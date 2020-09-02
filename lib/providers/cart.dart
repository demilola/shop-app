import 'package:flutter/foundation.dart';

class CartItem {
  final String id;
  final String title;
  final int quantity;
  final double price;

  CartItem({
    @required this.id,
    @required this.title,
    @required this.quantity,
    @required this.price,
  });
}

class Cart with ChangeNotifier {
  Map<String, CartItem> _items={};

  Map<String, CartItem> get items => {..._items};

  int get itemCount => _items.length;

  void addItem(String id, String title, double price) {
    //Check if the item is in the cart already:
    if (_items.containsKey(id)) {
      _items.update(
          id,
          (item) => CartItem(
                id: item.id,
                title: item.title,
                price: item.price,
                quantity: item.quantity + 1,
              ));
    } else {
      _items.putIfAbsent(
          id,
          () => CartItem(
                id: DateTime.now().toIso8601String(),
                title: title,
                quantity: 1,
                price: price,
              ));
    }
    notifyListeners();
  }
}
