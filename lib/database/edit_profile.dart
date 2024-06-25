import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase/database/user_profile.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'bottombar.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  TextEditingController first = TextEditingController();
  TextEditingController last = TextEditingController();
  TextEditingController gender = TextEditingController();

  User? user = FirebaseAuth.instance.currentUser;
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  void updateData() async {
    firebaseFirestore.collection("person").doc(user?.uid).update(
        {"fname": first.text, "lname": last.text, "gender": gender.text});
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const Bottombar(),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 40),
        child: Column(
          children: [
            TextField(
              controller: first,
              decoration: InputDecoration(
                  filled: true,
                  //fillColor: Colors.orange.shade200,
                  label: const Text("First Name"),
                  border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(15))),
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              controller: last,
              decoration: InputDecoration(
                  filled: true,
                  //fillColor: Colors.orange.shade200,
                  label: const Text("Last Name"),
                  border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(15))),
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              controller: gender,
              decoration: InputDecoration(
                  filled: true,
                  //fillColor: Colors.orange.shade200,
                  label: const Text("Gender"),
                  border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(15))),
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              decoration: InputDecoration(
                  filled: true,
                  enabled: false,
                  //fillColor: Colors.orange.shade200,
                  label: Text("${user?.email}"),
                  border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(15))),
            ),
            const SizedBox(height: 15),
            ElevatedButton(onPressed: updateData, child: const Text("Update"))
          ],
        ),
      ),
    );
  }
}
