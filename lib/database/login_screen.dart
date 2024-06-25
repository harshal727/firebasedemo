import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase/database/bottombar.dart';
import 'package:firebase/database/home_screen.dart';
import 'package:firebase/database/regestration.dart';
import 'package:firebase/preference_manager/prefernce_manager.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  bool loading = false;
  List<Map<String, dynamic>> live = [];

  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  @override
  void initState() {
    getData();
    super.initState();
  }

  void getData() async {
    User? user = FirebaseAuth.instance.currentUser;
    QuerySnapshot data =
        await FirebaseFirestore.instance.collection("person").get();
    for (var element in data.docs) {
      live.add(element.data() as Map<String, dynamic>);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
        child: SafeArea(
          child: Column(
            children: [
              const Text(
                "Login",
                style: TextStyle(fontSize: 25),
              ),
              const SizedBox(height: 35),
              TextField(
                controller: email,
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
                controller: password,
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
                height: 20,
              ),
              InkResponse(
                onTap: () async {
                  setState(() {
                    loading = true;
                  });
                  try {
                    UserCredential usercredential =
                        await firebaseAuth.signInWithEmailAndPassword(
                            email: email.text, password: password.text);

                    print("Email:-${usercredential.user?.email}");
                    print("Uid:-${usercredential.user?.uid}");

                    await PreferenceManager.setUserName(
                        email.text, usercredential.user!.uid);

                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Bottombar(),
                        ));

                    setState(() {
                      email.clear();
                      password.clear();
                      loading = false;
                    });
                  } on FirebaseAuthException catch (e) {
                    setState(() {
                      loading = false;
                    });

                    print(e.code);
                    ScaffoldMessenger.of(context)
                        .showSnackBar(SnackBar(content: Text("${e.message}")));
                  }
                },
                child: Container(
                  height: 50,
                  width: 180,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.green.shade300),
                  child: const Center(
                      child: Text(
                    "Login",
                    style: TextStyle(fontSize: 18),
                  )),
                ),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const RegistrationScreen(),
                        ));
                  },
                  child: const Text("Register"))
            ],
          ),
        ),
      ),
    );
  }
}
