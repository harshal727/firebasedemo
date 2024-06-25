import 'package:firebase/coffee_shop/models/coffee.dart';
import 'package:firebase/coffee_shop/models/coffee_shop.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'coffee_tile.dart';
import 'const.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPAgeState();
}

class _ShopPAgeState extends State<ShopPage> {
  void addToCart(Coffee coffee) {
    Provider.of<CoffeeShop>(context, listen: false).addItemToCart(coffee);

    showDialog(
        context: context,
        builder: (context) => const AlertDialog(
              title: Text(
                "Successfully add to Cart ",
              ),
            ));
  }

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
                    "How would you like a coffee ??",
                    style: TextStyle(fontSize: 20),
                  ),
                  const SizedBox(height: 25),
                  Expanded(
                      child: ListView.builder(
                    itemCount: value.coffeeShop.length,
                    itemBuilder: (BuildContext context, int index) {
                      Coffee eachCoffee = value.coffeeShop[index];

                      return CoffeeTile(
                        coffee: eachCoffee,
                        onPressed: () => addToCart(eachCoffee),
                        icon: const Icon(Icons.add),
                      );
                    },
                  ))
                ],
              ),
            ),
          )),
    );
  }
}
