import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class DemoImage extends StatefulWidget {
  const DemoImage({Key? key}) : super(key: key);

  @override
  State<DemoImage> createState() => _DemoImageState();
}

class _DemoImageState extends State<DemoImage> {
  List<Map<String, dynamic>> pic = [];
  ImagePicker imagePicker = ImagePicker();
  FirebaseStorage storage = FirebaseStorage.instance;
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  List temp = [];
  List Ing = [];

  File? image;

  bool loading = false;

  @override
  void initState() {
    getImage();
    super.initState();
  }

  void getImage() async {
    QuerySnapshot data =
        await FirebaseFirestore.instance.collection("images").get();
    for (var element in data.docs) {
      final Map<String, dynamic> use = element.data() as Map<String, dynamic>;
      Ing.add(use["images"]);
      // pic.add(element.data() as Map<String, dynamic>);
    }
    //Ing.add(pic);
    //Ing.add(temp);
    print("All ${Ing}");
    // for (var element in data.docs) {
    //   temp.add(element.data() as File);
    // }

    // for (var element in data.docs) {
    //   temp.add(element as File);
    // }

    setState(() {});
    //print("Imagess:-$temp");
    //print("images$pic");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        //mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 500,
            child: GridView.builder(
              shrinkWrap: true,
              itemCount: Ing.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, childAspectRatio: 0.8),
              itemBuilder: (BuildContext context, int index) {
                if (!Ing[index].toString().contains("https")) {
                  return Container(
                    height: 120,
                    margin: const EdgeInsets.only(top: 5),
                    decoration: const BoxDecoration(
                      color: Colors.red,
                      // image: DecorationImage(
                      //   image: NetworkImage("${pic[index]["images"]}", scale: 2),
                      // ),
                    ),
                    child: Image.file(Ing[index]),
                  );
                }

                Container(
                  height: 120,
                  margin: const EdgeInsets.only(top: 5),
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    // image: DecorationImage(
                    //   image: NetworkImage("${Ing[index]}", scale: 2),
                    // ),
                  ),
                  child: Image.network("${Ing[index]}"),
                );
              },
            ),
          ),
          // SizedBox(
          //   height: 400,
          //   child: ListView.builder(
          //     shrinkWrap: true,
          //     itemCount: Ing.length,
          //     itemBuilder: (BuildContext context, int index) {
          //
          //     },
          //   ),
          // ),
          const Divider(),
          // Expanded(
          //   flex: 5,
          //   child: ListView.builder(
          //     shrinkWrap: true,
          //     itemCount: temp.length,
          //     itemBuilder: (BuildContext context, int index) {
          //       return
          //     },
          //   ),
          // ),

          GestureDetector(
            onTap: () async {
              XFile? file =
                  await imagePicker.pickImage(source: ImageSource.gallery);

              image = File(file!.path);
              Ing.add(image!.path);
              // List Ing = [];
              // Ing.add(image!);
              print("Imagees add${Ing}");

              // pic.add(image as Map<String, dynamic>);
              // print("Name of img $pic");
              setState(() {});
            },
            child: Container(
              height: 150,
              width: 150,
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.3),
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Center(
                  child: Icon(
                Icons.image,
                size: 30,
              )
                  // child: image == null
                  //     ? const Icon(
                  //         Icons.image,
                  //         size: 30,
                  //       )
                  //     : Image.file(image!),
                  ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          //ElevatedButton(onPressed: () {}, child: const Text("up")),
          ElevatedButton(
            onPressed: () async {
              // List temp=[];
              // temp.add(image!);

              loading = true;
              setState(() {});
              storage
                  .ref("profile/${DateTime.now()}")
                  .putFile(image!)
                  .then((p0) async {
                String data = await p0.ref.getDownloadURL();
                //temp.add(data as File);
                print("URL $data");
                Ing.removeLast();

                Ing.add(data);

                firebaseFirestore.collection("images").add({"images": data});
                //image = null;

                loading = false;
                setState(() {});
              });
            },
            child: Text(loading ? "uploading..." : 'upload'),
          )
        ],
      ),
    );
  }
}
