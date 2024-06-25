import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase/database/chat.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AllChat extends StatefulWidget {
  const AllChat({Key? key}) : super(key: key);

  @override
  State<AllChat> createState() => _AllChatState();
}

class _AllChatState extends State<AllChat> {
  List<Map<String, dynamic>> add = [];
  List aid = [];
  List chid = [];
  TextEditingController chatctrl = TextEditingController();
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  User? user = FirebaseAuth.instance.currentUser;
  bool loading = false;

  @override
  void initState() {
    addChat();
    addId();
    super.initState();
  }

  void addChat() async {
    setState(() {
      loading = true;
    });
    QuerySnapshot data = await firebaseFirestore.collection("person").get();
    for (var element in data.docs) {
      add.add(element.data() as Map<String, dynamic>);
    }
    for (var element in data.docs) {
      aid.add(element.id);
    }
    setState(() {
      loading = false;
    });
  }

  void addId() async {
    setState(() {
      loading = true;
    });
    QuerySnapshot data = await firebaseFirestore.collection("chat").get();
    // for (var element in data.docs) {
    //   add.add(element.data() as Map<String, dynamic>);
    // }
    for (var element in data.docs) {
      chid.add(element.id);
    }
    setState(() {
      loading = false;
    });
    print("user id $chid");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Chats",
          style: TextStyle(color: Colors.white),
        ),
        automaticallyImplyLeading: false,
        backgroundColor: Colors.brown,
      ),
      body: loading
          ? const Center(child: CircularProgressIndicator())
          : Column(
              children: [
                ListView.builder(
                  itemCount: add.length,
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, int index) {
                    return InkResponse(
                      onTap: () {
                        if (chid.contains("${user?.uid}-${aid[index]}")) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ChatScreen(
                                  user: '${add[index]['fname']}',
                                  uid: aid[index],
                                  uid1: '${user?.uid}-${aid[index]}',
                                ),
                              ));
                        } else if (chid
                            .contains("${aid[index]}-${user?.uid}")) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ChatScreen(
                                  user: '${add[index]['fname']}',
                                  uid: aid[index],
                                  uid1: '${aid[index]}-${user?.uid}',
                                ),
                              ));
                        } else {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ChatScreen(
                                  user: '${add[index]['fname']}',
                                  uid: aid[index],
                                  uid1: '${user?.uid}-${aid[index]}',
                                ),
                              ));
                        }
                      },
                      child: ListTile(
                        leading: const Icon(Icons.person),
                        title: Text("${add[index]["fname"]}"),
                      ),
                    );
                  },
                )
              ],
            ),
    );
  }
}
