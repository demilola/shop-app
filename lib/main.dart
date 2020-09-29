import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/providers/cart.dart';
import 'package:shop_app/providers/orders.dart';
import 'package:shop_app/providers/products.dart';
import 'package:shop_app/screens/cart_page.dart';
import 'package:shop_app/screens/orders_page.dart';
import 'package:shop_app/screens/products_overview_page.dart';
import 'package:shop_app/screens/product_details_page.dart';
import 'package:shop_app/screens/user_products_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //Switched to a multiprovider because we have more than 1 provider to be used in a wide range of pages
    return MultiProvider(
        providers: [
          ChangeNotifierProvider<Products>(create: (context) => Products()),
          ChangeNotifierProvider<Cart>(create: (context) => Cart()),
          ChangeNotifierProvider<Orders>(create: (context) => Orders())
        ],
        //remember that you can always create a provider for other dataTypes. For example:
        //Provider<String>(create: (context) => 'This is a string'),
        builder: (context, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            theme: ThemeData(
              primarySwatch: Colors.cyan,
              // accentColor: Colors.tealAccent,
              visualDensity: VisualDensity.adaptivePlatformDensity,
              textTheme: GoogleFonts.latoTextTheme(),
              appBarTheme: AppBarTheme(centerTitle: true),
              typography: Typography.material2018(),
            ),
            home: ProductsOverviewPage(),
            routes: {
              ProductDetailsPage.id: (context) => ProductDetailsPage(),
              CartPage.id: (context) => CartPage(),
              OrdersPage.id: (context) => OrdersPage(),
              UserProductsPage.id: (context) => UserProductsPage(),
            },
          );
        });
  }
}
