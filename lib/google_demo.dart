import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'gogole_home.dart';

class GoogleDemo extends StatefulWidget {
  const GoogleDemo({Key? key}) : super(key: key);

  @override
  State<GoogleDemo> createState() => _GoogleDemoState();
}

class _GoogleDemoState extends State<GoogleDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: InkResponse(
          onTap: () {
            signInWithGoogle();
          },
          child: Container(
            height: 45,
            width: 210,
            color: Colors.blue.shade300,
            child: const Center(
              child: Text("Login with google"),
            ),
          ),
        ),
      ),
    );
  }
}

signInWithGoogle() async {
  GoogleSignInAccount? googleuser = await GoogleSignIn().signIn();

  GoogleSignInAuthentication? googleAuth = await googleuser?.authentication;

  AuthCredential google = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken, idToken: googleAuth?.idToken);
  UserCredential userCredential =
      await FirebaseAuth.instance.signInWithCredential(google);
  print(userCredential.user?.displayName);
  // if (userCredential.user != null) {
  //   Navigator.of(context as BuildContext).push(MaterialPageRoute(
  //     builder: (context) => GoogleHome(),
  //   ));
  // }
}
