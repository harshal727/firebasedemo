import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen(
      {Key? key, required this.user, required this.uid, required this.uid1})
      : super(key: key);

  final String user;
  final String uid;
  final String uid1;

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  List<Map<String, dynamic>> add = [];
  List aid = [];
  TextEditingController chatctrl = TextEditingController();
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  User? user = FirebaseAuth.instance.currentUser;

  // @override
  // void initState() {
  //   allChat();
  //   super.initState();
  // }
  //
  // void allChat() async {
  //   setState(() {});
  //   QuerySnapshot data = await firebaseFirestore.collection("person").get();
  //
  //   for (var element in data.docs) {
  //     add.add(element.id as Map<String, dynamic>);
  //   }
  //   setState(() {});
  //   print("$add");
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text("Chats", style: TextStyle(color: Colors.white)),
          automaticallyImplyLeading: false,
          backgroundColor: Colors.brown),
      body: Column(
        children: [
          StreamBuilder(
            stream: firebaseFirestore
                .collection("chats")
                .doc(
                    "ziH4V1PdXwXXXaF7sJa7FX2o4I82-fzcN1AhP1nUNghH7RIVquYgukOi1")
                .collection("call")
                .snapshots(),
            builder: (BuildContext context,
                AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                  itemCount: snapshot.data?.docs.length,
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, int index) {
                    Map<String, dynamic> msg =
                        snapshot.data!.docs[index].data();

                    print("MSG $msg");

                    return Column(
                      crossAxisAlignment: msg['userid'] == user?.uid
                          ? CrossAxisAlignment.end
                          : CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 35,
                          width: 50,
                          decoration: BoxDecoration(
                              color: Colors.blue,
                              // color: Colors.grey.shade300,
                              borderRadius: BorderRadius.circular(15)),
                          margin: const EdgeInsets.only(top: 10),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Text(
                              "${msg['msg']}",
                              style: const TextStyle(fontSize: 16),
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                );
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            },
          ),
          const Spacer(),
          Row(
            children: [
              SizedBox(
                height: 50,
                width: 300,
                child: TextField(
                  controller: chatctrl,
                  decoration: const InputDecoration(
                      hintText: "Message....",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15)))),
                ),
              ),
              const SizedBox(width: 5),
              InkResponse(
                onTap: () async {
                  firebaseFirestore.collection("chats").doc(widget.uid1).set(
                      {"sender_value": user?.uid, "reciver_value": widget.uid});

                  firebaseFirestore
                      .collection("chats")
                      .doc(widget.uid1)
                      .collection("call")
                      .doc()
                      .set({
                    "msg": chatctrl.text,
                    "userid": user?.uid,
                    "time": DateTime.now()
                  });
                },
                child: Container(
                  height: 45,
                  width: 45,
                  decoration: BoxDecoration(
                      color: Colors.brown,
                      borderRadius: BorderRadius.circular(10)),
                  child: const Center(
                    child: Icon(
                      Icons.send,
                      color: Colors.white,
                    ),
                  ),
                ),
              )
            ],
          ),
          const SizedBox(height: 10)
        ],
      ),
    );
  }
}
