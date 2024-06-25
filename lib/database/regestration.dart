import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase/preference_manager/prefernce_manager.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'bottombar.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({Key? key}) : super(key: key);

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController firstController = TextEditingController();
  TextEditingController lastController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  ImagePicker imagePicker = ImagePicker();
  FirebaseStorage storage = FirebaseStorage.instance;
  File? image;
  //String? data;

  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  bool loading = false;
  // List gender = ["Male", "Female", "Other"];
  // String? Select;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 20),
                const Text(
                  "Registration",
                  style: TextStyle(fontSize: 25),
                ),
                const SizedBox(height: 50),
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Container(
                      height: 90,
                      width: 90,
                      decoration: BoxDecoration(
                          color: Colors.grey,
                          shape: BoxShape.circle,
                          image: image == null
                              ? DecorationImage(
                                  image:
                                      AssetImage("assets/images/profile.png"))
                              : DecorationImage(image: FileImage(image!))),
                    ),
                    Positioned(
                      right: -10,
                      bottom: -10,
                      child: IconButton(
                          onPressed: () async {
                            XFile? file = await imagePicker.pickImage(
                                source: ImageSource.gallery);
                            image = File(file!.path);

                            setState(() {});
                          },
                          icon: const Icon(
                            Icons.add,
                            size: 30,
                          )),
                    ),
                  ],
                ),

                const SizedBox(height: 20),
                TextField(
                  controller: firstController,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.orange.shade200,
                    label: const Text("First Name"),
                    border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(15)),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: lastController,
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.orange.shade200,
                      label: const Text("Last Name"),
                      border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(15))),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: genderController,
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.orange.shade200,
                      label: const Text("Gender"),
                      border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(15))),
                ),
                // DropdownButton(
                //     hint: Text("Select Gender"),
                //     value: Select,
                //     items: List.generate(
                //         gender.length,
                //         (index) => DropdownMenuItem(
                //             value: gender[index],
                //             child: Text(
                //               "${gender[index]}",
                //             ))),
                //     onChanged: (value) {
                //       setState(() {
                //         Select = value as String?;
                //       });
                //     }),
                const SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: emailController,
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.orange.shade200,
                      prefixIcon: const Icon(Icons.email_outlined),
                      label: const Text("Email"),
                      border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(15))),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: passController,
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
                  height: 45,
                ),
                InkResponse(
                  onTap: () async {
                    setState(() {
                      loading = true;
                    });
                    try {
                      UserCredential usercredential =
                          await firebaseAuth.createUserWithEmailAndPassword(
                              email: emailController.text,
                              password: passController.text);
                      print("userId${usercredential.user!.uid}");
                      print("email${usercredential.user!.email}");
                      storage
                          .ref("user/${DateTime.now()}")
                          .putFile(image!)
                          .then((p0) async {
                        String data = await p0.ref.getDownloadURL();
                        print("Url :- $data");
                        firebaseFirestore
                            .collection('person')
                            .doc(usercredential.user?.uid)
                            .set({
                          "fname": firstController.text,
                          "lname": lastController.text,
                          "gender": genderController.text,
                          "email": emailController.text,
                          "profile": data
                        });
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Bottombar(),
                          ),
                        );
                      });

                      await PreferenceManager.setUserName(
                          emailController.text, usercredential.user!.uid);

                      print("${PreferenceManager.getUserName()}");

                      setState(() {
                        loading = false;
                        // emailController.clear();
                        // passController.clear();
                        // firstController.clear();
                        // lastController.clear();
                        // genderController.clear();
                      });
                    } on FirebaseAuthException catch (e) {
                      setState(() {
                        loading = false;
                      });

                      String message = "";

                      if (e.code == "email-alredy-use-in") {
                        message = "alredy use in";
                      } else if (e.code == "weak-password") {
                        message = "Enter strong password";
                      }
                      print("CODE${e.code}");

                      ScaffoldMessenger.of(context)
                          .showSnackBar(SnackBar(content: Text(message)));
                    }
                  },
                  child: Container(
                    height: 50,
                    width: 200,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.green.shade300),
                    child: const Center(
                        child: Text(
                      "Sign in",
                      style: TextStyle(fontSize: 18),
                    )),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
