import 'package:flutter/material.dart';

class ProductListTile extends StatelessWidget {
  final String title;
  final String imageUrl;

  const ProductListTile(this.title, this.imageUrl);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      leading: CircleAvatar(
          backgroundImage: NetworkImage(
        imageUrl,
      )),
      trailing: Row(
        //Added this property because the row was previously unbound causing an error. 
        //This restricts the size of the row to the minimum neccessary 
        //It's in lieu of wrapping the row in a container with fixed bounds
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
              icon: Icon(Icons.edit),
              onPressed: () {},
              color: Theme.of(context).primaryColorDark),
          IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {},
              color: Theme.of(context).errorColor),
        ],
      ),
    );
  }
}
