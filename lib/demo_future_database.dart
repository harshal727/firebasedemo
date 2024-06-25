// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
//
// class DemoFutureData extends StatefulWidget {
//   const DemoFutureData({Key? key}) : super(key: key);
//
//   @override
//   State<DemoFutureData> createState() => _DemoFutureDataState();
// }
//
// class _DemoFutureDataState extends State<DemoFutureData> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: FutureBuilder(
//         future: FirebaseFirestore.instance.collection("product").get(),
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.done) {
//             Map<String, dynamic> data1 = snapshot.data!.docs[0].data();
//             return Center(
//               child: Text("$data1"),
//             );
//           } else {
//             return const Center(child: CircularProgressIndicator());
//           }
//         },
//       ),
//     );
//   }
// }

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class DemoDataFuture extends StatefulWidget {
  const DemoDataFuture({super.key});

  @override
  State<DemoDataFuture> createState() => _DemoDataFutureState();
}

class _DemoDataFutureState extends State<DemoDataFuture> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView.builder(
      itemCount: 3,
      shrinkWrap: true,
      itemBuilder: (BuildContext context, int index) {
        return FutureBuilder(
          future: FirebaseFirestore.instance.collection("product").get(),
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              Map<String, dynamic> info = snapshot.data!.docs[index].data();
              return Column(mainAxisAlignment: MainAxisAlignment.center,
                  //crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 75,
                      width: 250,
                      margin: const EdgeInsets.symmetric(vertical: 10),
                      decoration: BoxDecoration(
                          //color: Colors.blue.shade300,
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(color: Colors.black87)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Name:- ${info["name"]}"),
                          Text("Price:- ₹${info["price"]}"),
                          Text("Discount:- ${info["discount"]}%"),
                        ],
                      ),
                    ),
                  ]);

              //Center(child: Text('$data'));
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        );
      },
    ));
  }
}
