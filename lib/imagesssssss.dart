import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImagesScreen extends StatefulWidget {
  const ImagesScreen({Key? key}) : super(key: key);

  @override
  State<ImagesScreen> createState() => _ImagesScreenState();
}

class _ImagesScreenState extends State<ImagesScreen> {
  List ima = [];
  File? image;
  ImagePicker imagePicker = ImagePicker();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ListView.builder(
            shrinkWrap: true,
            itemCount: ima.length,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                height: 150,
                width: 150,
                decoration: BoxDecoration(
                    image: DecorationImage(image: FileImage(ima[index]))),
                child: InkResponse(
                  onTap: () {
                    ima.removeAt(index);
                  },
                  child: Icon(Icons.delete),
                ),
              );
            },
          ),
          Center(
            child: ElevatedButton(onPressed: () {}, child: Text("image")),
          ),
          SizedBox(height: 25),
          Center(
            child: ElevatedButton(
                onPressed: () async {
                  XFile? file =
                      await imagePicker.pickImage(source: ImageSource.gallery);

                  image = File(file!.path);
                  ima.add(image);
                  setState(() {});
                },
                child: Text("Upload")),
          ),
        ],
      ),
    );
  }
}
