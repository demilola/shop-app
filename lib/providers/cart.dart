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
  Map<String, CartItem> _items = {};

  Map<String, CartItem> get items => {..._items};

  int get itemCount => _items.length;
  double get totalAmount {
    double total = 0.0;
    _items.forEach((key, item) => total += item.price * item.quantity);
    return total;
  }

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

  ///Removes item with passed product id
  void removeItem(String productId) {
    _items.remove(productId);
    notifyListeners();
  }

  ///Removes a single item from cart
  void removeSingleItem(String productId) {
    //If the item isn't on the list, do nothing
    if (!_items.containsKey(productId)) {
      return;
    }

    //If there's more than 1 of the item on the list, reduce by 1
    if (_items[productId].quantity > 1) {
      _items.update(
        productId,
        (item) => CartItem(
          id: item.id,
          title: item.title,
          price: item.price,
          quantity: item.quantity - 1,
        ),
      );
    }

    //If there's only 1 of the item on the list, remove it
    else {
      _items.remove(productId);
    }
    notifyListeners();
  }


  ///Clears the cart
  void clearCart() {
    _items.clear();
    notifyListeners();
  }
}
