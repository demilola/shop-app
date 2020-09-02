import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/providers/products.dart';
import 'package:shop_app/screens/products_overview_page.dart';
import 'package:shop_app/screens/product_details_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      //Here, remember that you can always create a provider for other dataTypes. For example:
      //Provider<String>(create: (context) => 'This is a string'),
      create: (context) => Products(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.cyan,
          // accentColor: Colors.tealAccent,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          textTheme: GoogleFonts.latoTextTheme(),
          appBarTheme: AppBarTheme(centerTitle: true),
        ),
        home: ProductsOverviewPage(),
        routes: {ProductDetailsPage.id: (context) => ProductDetailsPage()},
      ),
    );
  }
}
