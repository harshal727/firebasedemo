import 'dart:core';

import 'package:flutter/cupertino.dart';

import 'coffee.dart';

class CoffeeShop extends ChangeNotifier {
  //coffee for sale list

  final List<Coffee> shop = [
    // black coffee
    Coffee(
        name: "Long Black",
        price: "₹ 349",
        imagepath: "assets/images/hot-coffee.png"),

    // latte

    Coffee(name: "Latte", price: "₹ 299", imagepath: "assets/images/pour.png"),

    // espresso

    Coffee(
        name: "Espresso",
        price: "₹ 429",
        imagepath: "assets/images/hot-tea.png"),

    //iced coffee

    Coffee(
        name: "Iced coffee",
        price: "₹ 399",
        imagepath: "assets/images/ice-coffee.png")
  ];

  //user cart

  List<Coffee> userCart = [];

  // get Coffee List

  List<Coffee> get coffeeShop => shop;

  //get user cart

  List<Coffee> get userCarts => userCart;

  // add item to cart

  void addItemToCart(Coffee coffee) {
    userCart.add(coffee);
    notifyListeners();
  }

  //  remove item to cart

  void removeItemToCart(Coffee coffee) {
    userCarts.remove(coffee);
    notifyListeners();
  }
}
