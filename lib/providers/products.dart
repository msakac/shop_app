// ignore_for_file: prefer_final_fields

import 'package:flutter/material.dart';
import './product.dart';

class Products with ChangeNotifier {
  //promjene unutar liste produkta dogadaju se samo unutar ove klase
  //provider klasa

  // var _showFavorites = false;

  List<Product> _items = [
    Product(
      id: 'p1',
      title: 'Red Shirt',
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
      title: 'A Pan',
      description: 'Prepare any meal you want.',
      price: 49.99,
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/1/14/Cast-Iron-Pan.jpg/1024px-Cast-Iron-Pan.jpg',
    ),
  ]; //ova lista produkta je privatna
  List<Product> get items {
    //getter koji vraca sve podatke iz privatne liste ili sve koji su favorite
    // if(_showFavorites){
    //   return _items.where((element) => element.isFavorite).toList();
    // }
    return [..._items]; //vracam kopiju
  }

  List<Product> get favoriteItems {
    return _items.where((element) => element.isFavorite).toList();
  }

  Product findById(String id) {
    return _items.firstWhere((product) => product.id == id);
  }

  // void showFavoritesOnly(){
  //   _showFavorites = true;
  //   notifyListeners();
  // }

  //   void showAll(){
  //   _showFavorites = false;
  //   notifyListeners();
  // }

  void addProduct(Product product) {
    //ovdje se dodaju novi produkti. Promjene se dogadaju samo unutar klase tak da moremo koristiti notify listeners
    final newProduct = Product(
      title: product.title,
      description: product.description,
      imageUrl: product.imageUrl,
      price: product.price,
      id: DateTime.now().toString(),
    );
    _items.add(newProduct);
    notifyListeners();
  }
}
