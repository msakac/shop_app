// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, missing_required_param

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './screens/products_overview_screen.dart';
import './screens/product_detail_screen.dart';
import './providers/products.dart';
import './providers/cart.dart';
import './screens/cart_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  //aded coment to make git tree look nicer
  //aand another one
  //beautiful tree
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider( //provider klasa
          create: (ctx) => Products(),
        ),
        ChangeNotifierProvider( //provider klasa
          create: (ctx) => Cart(),
        ),
      ], //provider verzija 4.x.x, create umjesto builder
      //mjenjali se budu samo oni widget koji slusaju providera
      child: MaterialApp(
        title: 'MyShop',
        theme: ThemeData(
          primarySwatch: Colors.purple,
          accentColor: Colors.deepOrange,
          fontFamily: 'Lato',
        ),
        home: ProductsOverviewScreen(),
        routes: {
          ProductDetailScreen.routeName: (ctx) => ProductDetailScreen(),
          CartScreen.routeName: (ctx) => CartScreen(),
        },
      ),
    );
  }
}
