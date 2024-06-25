import 'package:firebase/preference_manager/prefernce_manager.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class RegistrationDemo extends StatefulWidget {
  const RegistrationDemo({Key? key}) : super(key: key);

  @override
  State<RegistrationDemo> createState() => _RegistrationDemoState();
}

class _RegistrationDemoState extends State<RegistrationDemo> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();

  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  bool loading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 15, right: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircleAvatar(radius: 10, backgroundColor: Colors.grey),
            TextField(
              controller: emailController,
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
              controller: passController,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.orange.shade200,
                prefixIcon: const Icon(Icons.remove_red_eye),
                label: const Text("Password"),
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            ElevatedButton(
                onPressed: () async {
                  UserCredential usercredential =
                      await firebaseAuth.createUserWithEmailAndPassword(
                          email: emailController.text,
                          password: passController.text);
                  await PreferenceManager.setUserName(
                      emailController.text, usercredential.user!.uid);
                  print("userId${usercredential.user!.uid}");
                  print("email${usercredential.user!.email}");

                  emailController.clear();
                  passController.clear();
                },
                child: const Text("Register")),
          ],
        ),
      ),
    );
  }
}
