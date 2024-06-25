import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleHome extends StatefulWidget {
  const GoogleHome({Key? key}) : super(key: key);

  @override
  State<GoogleHome> createState() => _GoogleHomeState();
}

class _GoogleHomeState extends State<GoogleHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () async {
                await GoogleSignIn().signOut();
                FirebaseAuth.instance.signOut();
              },
              icon: Icon(Icons.power_settings_new))
        ],
        title: Text("harshal"),
      ),
      body: Center(
        child: Text("Hello"),
      ),
    );
  }
}
