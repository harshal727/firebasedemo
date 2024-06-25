import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase/preference_manager/prefernce_manager.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'bottombar.dart';
import 'login_screen.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({Key? key}) : super(key: key);

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  TextEditingController fnamecon = TextEditingController();
  TextEditingController lnamecon = TextEditingController();
  TextEditingController gencon = TextEditingController();
  TextEditingController emailcon = TextEditingController();
  ImagePicker imagePicker = ImagePicker();
  FirebaseStorage storage = FirebaseStorage.instance;
  File? image;
  String profile = "";
  bool loading = false;
  User? user = FirebaseAuth.instance.currentUser;
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  // bool load = false;

  //List<Map<String, dynamic>> person = [];

  void updateData() async {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const Bottombar(),
        ));
  }

  void getPerson() async {
    setState(() {
      loading = true;
    });
    //FirebaseFirestore firebaseFirestore=FirebaseFirestore.instance;

    User? user = FirebaseAuth.instance.currentUser;
    var data1 = await FirebaseFirestore.instance
        .collection("person")
        .doc(user?.uid)
        .get();

    Map<String, dynamic> userdata = data1.data() as Map<String, dynamic>;
    fnamecon.text = userdata['fname'];
    emailcon.text = userdata['email'];
    lnamecon.text = userdata['lname'];
    gencon.text = userdata['gender'];
    profile = userdata['profile'];
    loading = false;
    //print("Profile :- ${profile}");

    setState(() {});

    // for (var element in data.docs) {
    //   person.add(element.data() as Map<String, dynamic>);
    // }
    // setState(() {
    //   loading = false;
    // });
  }

  @override
  void initState() {
    getPerson();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: loading
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 30, horizontal: 30),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 25),
                    Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(
                            1,
                            (index) => Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  //crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
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
                                                        NetworkImage(profile!))
                                                : DecorationImage(
                                                    image: FileImage(image!),
                                                  ),
                                          ),
                                        ),
                                        Positioned(
                                          right: -10,
                                          bottom: -10,
                                          child: IconButton(
                                              onPressed: () async {
                                                XFile? file =
                                                    await imagePicker.pickImage(
                                                        source: ImageSource
                                                            .gallery);
                                                image = File(file!.path);
                                                setState(() {});
                                                print(image);
                                              },
                                              icon: const Icon(
                                                Icons.add,
                                                size: 30,
                                              )),
                                        ),
                                      ],
                                    ),

                                    const SizedBox(height: 15),
                                    TextField(
                                      controller: fnamecon,
                                      decoration: InputDecoration(
                                          filled: true,
                                          //fillColor: Colors.orange.shade200,
                                          hintText: "fname",
                                          //label: Text("$first"),
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide.none,
                                              borderRadius:
                                                  BorderRadius.circular(15))),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    TextField(
                                      controller: lnamecon,
                                      decoration: InputDecoration(
                                          filled: true,
                                          //fillColor: Colors.orange.shade200,
                                          //label: Text("Last Name"),
                                          hintText: "lname",
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide.none,
                                              borderRadius:
                                                  BorderRadius.circular(15))),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    TextField(
                                      controller: gencon,
                                      decoration: InputDecoration(
                                          filled: true,
                                          //fillColor: Colors.orange.shade200,
                                          //label: Text("Gender"),
                                          hintText: "gender",
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide.none,
                                              borderRadius:
                                                  BorderRadius.circular(15))),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    TextField(
                                      controller: emailcon,
                                      decoration: InputDecoration(
                                          filled: true,
                                          enabled: false,
                                          //fillColor: Colors.orange.shade200,
                                          label: const Text("Email"),
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide.none,
                                              borderRadius:
                                                  BorderRadius.circular(15))),
                                    ),
                                    // const SizedBox(height: 15),
                                    // Text("First Name :$first",
                                    //     style: const TextStyle(fontSize: 20)),
                                    // Text("Last Name :$last",
                                    //     style: const TextStyle(fontSize: 20)),
                                    // Text("Gender  :$gender",
                                    //     style: const TextStyle(fontSize: 20)),
                                    // Text("Email  :$email",
                                    //     style: const TextStyle(fontSize: 20))
                                  ],
                                ))),
                    const SizedBox(height: 50),
                    ElevatedButton(
                        onPressed: () async {
                          if (image == null) {
                            firebaseFirestore
                                .collection("person")
                                .doc(user?.uid)
                                .set({
                              "fname": fnamecon.text,
                              "lname": lnamecon.text,
                              "gender": gencon.text,
                              "email": emailcon.text,
                              "profile": profile
                            });
                          } else {
                            storage
                                .ref("user/${DateTime.now()}")
                                .putFile(image!)
                                .then((p0) async {
                              String data = await p0.ref.getDownloadURL();
                              firebaseFirestore
                                  .collection("person")
                                  .doc(user?.uid)
                                  .set({
                                "fname": fnamecon.text,
                                "lname": lnamecon.text,
                                "gender": gencon.text,
                                "email": emailcon.text,
                                "profile": data
                              });
                            });
                          }
                        },
                        child: const Text("Update")),
                    InkResponse(
                      onTap: () {
                        PreferenceManager.getClear();

                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const LoginScreen(),
                            ));
                      },
                      child: Container(
                        height: 50,
                        width: 180,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.green.shade300),
                        child: const Center(
                            child: Text(
                          "Logout",
                          style: TextStyle(fontSize: 18),
                        )),
                      ),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
