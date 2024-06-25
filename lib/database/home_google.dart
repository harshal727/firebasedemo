import 'package:flutter/material.dart';

class HomeGoogle extends StatefulWidget {
  const HomeGoogle({Key? key}) : super(key: key);

  @override
  State<HomeGoogle> createState() => _HomeGoogleState();
}

class _HomeGoogleState extends State<HomeGoogle> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text("Hello...!!"),
          )
        ],
      ),
    );
  }
}
