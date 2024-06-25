import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Demo extends StatefulWidget {
  const Demo({super.key});

  @override
  State<Demo> createState() => _DemoState();
}

class _DemoState extends State<Demo> {
  ImagePicker imagePicker = ImagePicker();
  FirebaseStorage storage = FirebaseStorage.instance;
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  User? user = FirebaseAuth.instance.currentUser;
  List pic = [];
  List Ids = [];

  @override
  void initState() {
    getData();
    super.initState();
  }

  void getData() async {
    QuerySnapshot user = await firebaseFirestore.collection("images").get();

    for (var element in user.docs) {
      final Map<String, dynamic> img = element.data() as Map<String, dynamic>;
      pic.add(img['images']);
    }

    for (var element in user.docs) {
      Ids.add(element.id);
    }

    setState(() {});
    //print("All $pic");
    print("Ids = ${Ids}");
  }

  File? image;

  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        children: [
          Expanded(
            child: GridView.builder(
              shrinkWrap: true,
              itemCount: pic.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.8,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10),
              itemBuilder: (BuildContext context, int index) {
                if (!pic[index].toString().contains('https')) {
                  return Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Image.file(
                        File(pic[index]),
                        fit: BoxFit.cover,
                      ),
                      // Positioned(
                      //   top: 10,
                      //   child: IconButton(
                      //       onPressed: () {},
                      //       icon: const Icon(
                      //         Icons.delete,
                      //         color: Colors.red,
                      //       )),
                      // )
                    ],
                  );
                }
                return Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Container(
                      height: 100,
                      margin: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        image: DecorationImage(
                          image: NetworkImage("${pic[index]}"),
                        ),
                      ),
                    ),
                    Positioned(
                      right: 1,
                      bottom: 70,
                      child: InkResponse(
                        onTap: () {
                          FirebaseFirestore.instance
                              .collection("images")
                              .doc(Ids[index])
                              .delete();
                          //Ids.removeWhere((element) => element[index]);
                          //pic.remove(index);
                          setState(() {});
                        },
                        child: Container(
                          height: 35,
                          width: 30,
                          decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.circular(8)),
                          child: const Center(
                              child: Icon(
                            Icons.delete,
                            size: 20,
                          )),
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
          const SizedBox(
            height: 100,
          ),
          GestureDetector(
            onTap: () async {
              XFile? file =
                  await imagePicker.pickImage(source: ImageSource.gallery);
              image = File(file!.path);
              pic.add(image!.path);
              setState(
                () {},
              );
            },
            child: Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(20)),
              child: const Center(
                  child: Icon(
                Icons.image,
                size: 55,
              )
                  // image == null
                  //     ?
                  //     : Image.file(image!),
                  ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
              onPressed: () async {
                loading = true;
                setState(() {});
                // for (var element in pic) {
                //   if (pic.toString().contains('https')) {
                //
                //   }
                // }
                storage
                    .ref("profile/${DateTime.now()}}")
                    .putFile(image!)
                    .then((p0) async {
                  String data = await p0.ref.getDownloadURL();

                  print("URL $data");
                  pic.removeLast();
                  pic.add(data);

                  firebaseFirestore
                      .collection("images")
                      .add({"images": data, "Time": DateTime.now()});
                  loading = false;
                  setState(() {});
                });
              },
              child: Text(loading ? "uploading..." : 'upload'))
        ],
      )),
    );
  }
}
