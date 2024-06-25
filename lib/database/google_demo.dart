import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'home_google.dart';

class DemoGoogle extends StatefulWidget {
  const DemoGoogle({Key? key}) : super(key: key);

  @override
  State<DemoGoogle> createState() => _DemoGoogleState();
}

class _DemoGoogleState extends State<DemoGoogle> {
  GoogleSignIn googleSignIn = GoogleSignIn();

  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  List<Map<String, dynamic>> log = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () async {
                GoogleSignInAccount? googleSignInAccount =
                    await googleSignIn.signIn();

                GoogleSignInAuthentication authentication =
                    await googleSignInAccount!.authentication;

                OAuthCredential oAuthCredential = GoogleAuthProvider.credential(
                    accessToken: authentication.accessToken,
                    idToken: authentication.idToken);

                UserCredential userCredential =
                    await auth.signInWithCredential(oAuthCredential);

                print("EMAIL ${userCredential.user!.email}");
                print("NAME ${userCredential.user!.displayName}");
                print("PHOTO ${userCredential.user!.photoURL}");
                print("UID ${userCredential.user!.uid}");

                var data = await firebaseFirestore
                    .collection("udata")
                    .doc(userCredential.user?.uid)
                    .get();
                // setState(() {});

                if (data.exists) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const HomeGoogle()));
                } else {
                  FirebaseFirestore.instance
                      .collection("udata")
                      .doc(userCredential.user?.uid)
                      .set({"name": userCredential.user!.displayName});
                }
              },
              child: const Text('Google Sign In'),
            ),
            ElevatedButton(
              onPressed: () async {
                await googleSignIn.signOut();
              },
              child: const Text('Google Sign Out'),
            ),
          ],
        ),
      ),
    );
  }
}
