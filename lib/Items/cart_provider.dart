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

  void removeFromCart(int index) {
    // Deduct the price of the removed item from totalCost
    _totalCost -= double.parse(_items[index].price);
    _items.removeAt(index);
    notifyListeners();
  }

  void clearCart() {
    _items.clear();
    _totalCost = 0.0;
    notifyListeners();
  }
}