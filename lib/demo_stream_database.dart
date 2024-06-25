import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class DemoStreamData extends StatefulWidget {
  const DemoStreamData({Key? key}) : super(key: key);

  @override
  State<DemoStreamData> createState() => _DemoStreamDataState();
}

class _DemoStreamDataState extends State<DemoStreamData> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.hasData) {
            Map<String, dynamic> data = snapshot.data.docs[0].data();
            return Center(child: Text("$data"));
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
        stream: FirebaseFirestore.instance.collection("product").snapshots(),
      ),
    );
  }
}
