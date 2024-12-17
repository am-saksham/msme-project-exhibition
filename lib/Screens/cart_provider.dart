import 'package:flutter/material.dart';
import 'cart_model.dart';

class CartProvider with ChangeNotifier {
  final List<CartItem> _items = [];
  double _totalCost = 0.0;

  List<CartItem> get items => _items;
  double get totalCost => _totalCost;

  void addToCart(CartItem item) {
    _items.add(item);
    _totalCost += double.parse(item.price);
    notifyListeners();
  }

  void clearCart() {
    _items.clear();
    _totalCost = 0.0;
    notifyListeners();
  }
}
