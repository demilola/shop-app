import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/providers/products.dart';
import 'package:shop_app/widgets/main_drawer.dart';
import 'package:shop_app/widgets/product_list_tile.dart';

class UserProductsPage extends StatelessWidget {
  static const String id = '/UserProductsPage';

  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<Products>(context);

    return Scaffold(
      drawer: MainDrawer(),
      appBar: AppBar(
        title: const Text('Your Products'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(4),
        child: ListView.separated(
          //Using a ListView.Separated to add a divider after every tile except the last tile
          //Theoretically, you could always use another widget there
          //Here:
          separatorBuilder: (_, index) => Divider(),
          itemCount: productsData.items.length,
          itemBuilder: (_, index) => ProductListTile(
              productsData.items[index].title,
              productsData.items[index].imageUrl),
        ),
      ),
    );
  }
}
