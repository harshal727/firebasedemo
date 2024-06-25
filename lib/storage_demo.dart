import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

class StorageDemo extends StatefulWidget {
  const StorageDemo({Key? key}) : super(key: key);

  @override
  State<StorageDemo> createState() => _StorageDemoState();
}

class _StorageDemoState extends State<StorageDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.orange.shade200,
                prefixIcon: const Icon(Icons.email_outlined),
                label: const Text("Email"),
                border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(15)),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.orange.shade200,
                  prefixIcon: const Icon(Icons.remove_red_eye),
                  label: const Text("Password"),
                  border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(15))),
            ),
            const SizedBox(
              height: 15,
            ),
            ElevatedButton(onPressed: () {}, child: const Text("Register")),
          ],
        ),
      ),
    );
  }
}
