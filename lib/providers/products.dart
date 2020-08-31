import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:shop_app/models/product.dart';

class Products with ChangeNotifier {
  //This list will hold all the products. It is a private list
  List<Product> _items = [];

  //Since the list is private, it is necessary to have a getter method to access it elsewhere
  List<Product> get items => [..._items];

  // void addProduct(Product product) {
  //   _items.add(product);
  //   notifyListeners();
  // }
}
