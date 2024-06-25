import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase/database/bottombar.dart';


import 'package:flutter/material.dart';

class AddProduct extends StatefulWidget {
  const AddProduct({Key? key}) : super(key: key);

  @override
  State<AddProduct> createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  final formkey = GlobalKey<FormState>();


  TextEditingController name = TextEditingController();
  TextEditingController price = TextEditingController();
  TextEditingController discount = TextEditingController();

  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  bool loading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 30),
          child: Form(
            key: formkey,
            child: Column(
              children: [
                TextFormField(
                  controller: name,
                  validator: (value) {
                    bool validName = RegExp("[a-zA-Z]").hasMatch(value!);
                    if (validName) {
                      return null;
                    } else {
                      return "plese enter name";
                    }
                  },
                  decoration: InputDecoration(
                      filled: true,
                      hintText: "Enter the name",
                      fillColor: Colors.white,
                      label: const Text(
                        "Name",
                        style: TextStyle(color: Colors.brown),
                      ),
                      border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(15))),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: price,
                  validator: (value) {
                    bool validPrice = RegExp("^[0-9]+\$").hasMatch(value!);

                    if (validPrice) {
                      return null;
                    } else {
                      return "enter the prise";
                    }
                  },
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      hintText: "Enter the price",
                      label: const Text("Price",
                          style: TextStyle(color: Colors.brown)),
                      border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(15))),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  validator: (value) {
                    bool validDis = RegExp("^[0-9]+\$").hasMatch(value!);
                    if (validDis) {
                      return null;
                    } else {
                      return "enter the discount";
                    }
                  },
                  controller: discount,
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      hintText: "Enter the discount",
                      label: const Text("Discount",
                          style: TextStyle(color: Colors.brown)),
                      border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(15))),
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkResponse(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Bottombar()));
                      },
                      child: Container(
                        height: 40,
                        width: 90,
                        decoration: BoxDecoration(
                            color: Colors.brown.shade300,
                            borderRadius: BorderRadius.circular(8)),
                        child: const Center(
                            child: Text("Cancel",
                                style: TextStyle(color: Colors.white))),
                      ),
                    ),
                    const SizedBox(width: 20),
                    InkResponse(
                      onTap: () async {
                        if (formkey.currentState!.validate()) {
                          setState(() {
                            loading = true;
                          });

                           firebaseFirestore.collection("product").add({
                            "name": name.text,
                            "price": price.text,
                            "discount": discount.text,
                            "favourite": []
                            //false,
                          });
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const Bottombar()));
                          setState(() {
                            name.clear();
                            price.clear();
                            discount.clear();
                          });
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text("invalid "),
                            ),
                          );
                        }
                      },
                      child: Container(
                        height: 40,
                        width: 90,
                        decoration: BoxDecoration(
                            color: Colors.brown.shade300,
                            borderRadius: BorderRadius.circular(8)),
                        child: const Center(
                            child: Text("Add",
                                style: TextStyle(color: Colors.white))),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
