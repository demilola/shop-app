import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/providers/product.dart';
import 'package:shop_app/screens/product_details_page.dart';

class ProductItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //Now, instead of accepting data from previous pages, we use context to get the datatype whatever
    final product = Provider.of<Product>(context, listen: false); //The widgets using this will not listen for changes
    //Switched to using consumer
    return ClipRRect(
        borderRadius: BorderRadius.circular(10.0),
        child: GridTile(
          child: GestureDetector(
            onTap: () => Navigator.pushNamed(
              context,
              ProductDetailsPage.id,
              arguments: product.id,
            ),
            child: Image.network(
              product.imageUrl,
              fit: BoxFit.cover,
            ),
          ),
          footer: GridTileBar(
            backgroundColor: Colors.black45,
            title: Text(
              product.title,
              textAlign: TextAlign.center,
            ),
            //Here, we need to listen for changes. Hence, we'll use a Consumer instead
            leading: Consumer<Product>(
      builder: (context, product, child) => IconButton(
              icon: Icon(
                product.isFavorite ? Icons.favorite : Icons.favorite_border,
                color: Theme.of(context).accentColor,
              ),
              onPressed: () => product.toggleFavoriteStatus(),
            ),),
            trailing: IconButton(
              icon: Icon(
                Icons.shopping_cart_outlined,
                color: Theme.of(context).accentColor,
              ),
              onPressed: () {},
            ),
          ),
        ),
    );
  }
}
