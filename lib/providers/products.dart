import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class Product with ChangeNotifier {
  //Now, since Product uses the ChangeNotifier mixin, it can now notifuy listeners when some properties change
  final String id;
  final String title;
  final String description;
  final double price;
  final String imageUrl;
  bool isFavorite;

  Product({
    @required this.id,
    @required this.title,
    @required this.description,
    @required this.price,
    @required this.imageUrl,
    this.isFavorite = false,
  });

  void toggleFavoriteStatus() {
    isFavorite = !isFavorite;
    notifyListeners();
  }
}


class Products with ChangeNotifier {
  //This list will hold all the products. It is a private list
  List<Product> _items = [
    Product(
      id: 'p1',
      title: 'Red T-Shirt',
      description: 'A red shirt - it is pretty red!',
      price: 29.99,
      imageUrl:
          'https://cdn.pixabay.com/photo/2016/10/02/22/17/red-t-shirt-1710578_1280.jpg',
    ),
    Product(
      id: 'p2',
      title: 'Trousers',
      description: 'A nice pair of trousers.',
      price: 59.99,
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/e/e8/Trousers%2C_dress_%28AM_1960.022-8%29.jpg/512px-Trousers%2C_dress_%28AM_1960.022-8%29.jpg',
    ),
    Product(
      id: 'p3',
      title: 'Yellow Scarf',
      description: 'Warm and cozy - exactly what you need for the winter.',
      price: 19.99,
      imageUrl:
          'https://live.staticflickr.com/4043/4438260868_cc79b3369d_z.jpg',
    ),
    Product(
      id: 'p4',
      title: 'Cast-Iron Pan',
      description: 'Prepare any meal you want.',
      price: 49.99,
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/1/14/Cast-Iron-Pan.jpg/1024px-Cast-Iron-Pan.jpg',
    ),
  ];

  //Since the list is private, it is necessary to have a getter method to access it elsewhere
  List<Product> get items => [..._items];

  List<Product> get favorites =>
      [..._items.where((product) => product.isFavorite)];

  Product findByID(String id) =>
      _items.firstWhere((product) => product.id == id);

  // void addProduct(Product product) {
  //   _items.add(product);
  //   notifyListeners();
  // }
}
