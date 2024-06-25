import 'package:firebase/coffee_shop/coffee_tile.dart';
import 'package:firebase/coffee_shop/const.dart';
import 'package:firebase/coffee_shop/models/coffee.dart';
import 'package:firebase/coffee_shop/models/coffee_shop.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  void removeFromCart(Coffee coffee) {

    Provider.of<CoffeeShop>(context, listen: false).removeItemToCart(coffee);
  }

  void payButton() {}
  @override
  Widget build(BuildContext context) {
    return Consumer<CoffeeShop>(
        builder: (context, value, child) => Scaffold(
            backgroundColor: backgroundColor,
            body: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(25),
                child: Column(
                  children: [
                    const Text(
                      "Your Cart",
                      style: TextStyle(fontSize: 20),
                    ),
                    const SizedBox(height: 25),
                    Expanded(
                        child: ListView.builder(
                      itemCount: value.userCart.length,
                      itemBuilder: (BuildContext context, int index) {
                        Coffee eachCoffee = value.userCart[index];

                        return CoffeeTile(
                            coffee: eachCoffee,
                            onPressed: () => removeFromCart(eachCoffee),
                            icon: const Icon(Icons.delete));
                      },
                    )),
                    const SizedBox(height: 10),
                    GestureDetector(onTap: payButton,
                      child: Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(25),
                        decoration: BoxDecoration(
                            color: Colors.brown,
                            borderRadius: BorderRadius.circular(12)),
                        child: const Center(
                          child: Text(
                            "Pay Now",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )));
  }
}
