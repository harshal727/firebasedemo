import 'package:firebase/coffee_shop/const.dart';
import 'package:firebase/coffee_shop/shop_page.dart';
import 'package:flutter/material.dart';

import 'bottom_navigationbar.dart';
import 'cart_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  int selectedIndex=0;
  void navigateBottomBar(int index){
    setState(() {
      selectedIndex=index;

    });
  }

  final List <Widget> pages=[
    const ShopPage(),
    const CartPage()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      bottomNavigationBar:  MyBottomBar(onTabChange: (index ) => navigateBottomBar(index),),
      body: pages[selectedIndex],
    );
  }
}
