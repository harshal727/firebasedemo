import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RegistrationStatic extends StatefulWidget {
  const RegistrationStatic({Key? key}) : super(key: key);

  @override
  State<RegistrationStatic> createState() => _RegistrationStaticState();
}

class _RegistrationStaticState extends State<RegistrationStatic> {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  bool loading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: loading
            ? const CircularProgressIndicator()
            : ElevatedButton(
                onPressed: () async {
                  setState(() {
                    loading = false;
                  });
                  try {
                    UserCredential userCredential =
                        await firebaseAuth.signInWithEmailAndPassword(
                            email: "harshal12@gmail.com",
                            password: "123321123");
                    setState(() {
                      loading = false;
                    });

                    print("UserId${userCredential.user!.uid}");
                    print("Email${userCredential.user!.email}");
                  } on FirebaseAuthException catch (e) {
                    String message = "";
                    setState(() {
                      loading = false;
                    });

                    if (e.code == "email-alredy-user") {
                      message = "this email is alredy use";
                    } else if (true) {}
                  }
                },
                child: Text("done")),
      ),
    );
  }
}
