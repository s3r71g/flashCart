import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
class CartModel extends ChangeNotifier {
  // list of items on sale
  final List<List<dynamic>> _shopItems = const [
    // [ itemName, itemPrice, imagePath, color ]
    ["Avocado", "4.00", "assets/desi_tomato.png", Colors.green],
    ["Banana", "2.50", "assets/desi_tomato.png", Colors.yellow],
    ["Chicken", "12.80", "assets/desi_tomato.png", Colors.brown],
    ["Water", "1.00", "assets/desi_tomato.png", Colors.blue],
  ];

  // list of cart items
  List<List<dynamic>> _cartItems = [];

  List<List<dynamic>> get cartItems => _cartItems;

  List<List<dynamic>> get shopItems => _shopItems;

  // add item to cart
  void addItemToCart(int index) {
    _cartItems.add(_shopItems[index]);
    notifyListeners();
  }

  // remove item from cart
  void removeItemFromCart(int index) {
    _cartItems.removeAt(index);
    notifyListeners();
  }

  // calculate total price
  String calculateTotal() {
    double totalPrice = 0;
    for (int i = 0; i < cartItems.length; i++) {
      totalPrice += double.parse(cartItems[i][1]);
    }
    return totalPrice.toStringAsFixed(2);
  }
}
