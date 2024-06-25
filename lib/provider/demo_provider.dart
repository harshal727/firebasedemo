import 'package:flutter/material.dart';

class DemoProvider extends StatefulWidget {
  const DemoProvider({super.key});

  @override
  State<DemoProvider> createState() => _DemoProviderState();
}

class _DemoProviderState extends State<DemoProvider> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Provider")
          ],
        ),
      ),
    );
  }
}
