import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class DatabaseDemo extends StatefulWidget {
  const DatabaseDemo({Key? key}) : super(key: key);

  @override
  State<DatabaseDemo> createState() => _DatabaseDemoState();
}

class _DatabaseDemoState extends State<DatabaseDemo> {
  List<Map<String, dynamic>> users = [];
  List<Map<String, dynamic>> info = [];
  List<Map<String, dynamic>> office = [];
  bool loading = false;
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  @override
  void initState() {
    getUser();
    getInfo();
    getOffice();
    super.initState();
  }

  void getUser() async {
    setState(() {
      loading = true;
    });

    QuerySnapshot data = await firebaseFirestore.collection("User").get();

    for (var element in data.docs) {
      users.add(element.data() as Map<String, dynamic>);
    }
    setState(() {
      loading = false;
    });
  }

  void getInfo() async {
    setState(() {
      loading = true;
    });

    QuerySnapshot data = await firebaseFirestore.collection("info").get();

    for (var element in data.docs) {
      info.add(element.data() as Map<String, dynamic>);
    }
    setState(() {
      loading = false;
    });
  }

  void getOffice() async {
    setState(() {
      loading = true;
    });
    QuerySnapshot data = await firebaseFirestore.collection("office").get();

    for (var element in data.docs) {
      office.add(element.data() as Map<String, dynamic>);

      setState(() {
        loading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Center(
          child: loading
              ? const CircularProgressIndicator()
              : Padding(
                  padding: const EdgeInsets.symmetric(vertical: 60),
                  child: Column(
                    //crossAxisAlignment: CrossAxisAlignment.start,
                    //mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        //crossAxisAlignment: CrossAxisAlignment.start,
                        // mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(
                            users.length,
                            (index) => Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text("${users[index]['name']}"),
                                    const SizedBox(width: 15),
                                    Text("${users[index]['email']}"),
                                    const SizedBox(width: 15),
                                    Text("${users[index]['age']}"),
                                  ],
                                )),
                      ),
                      const SizedBox(height: 15),
                      Column(
                        //crossAxisAlignment: CrossAxisAlignment.start,
                        //mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(
                            info.length,
                            (index) => Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text("${info[index]['city']}"),
                                    const SizedBox(width: 15),
                                    Text("${info[index]['no']}"),
                                    const SizedBox(width: 15),
                                    Text("${info[index]['gender']}"),
                                  ],
                                )),
                      ),
                      const SizedBox(height: 15),
                      Column(
                        //crossAxisAlignment: CrossAxisAlignment.start,
                        // mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(
                            office.length,
                            (index) => Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text("${office[index]['cname']}"),
                                    const SizedBox(width: 15),
                                    Text("${office[index]['post']}"),
                                    const SizedBox(width: 15),
                                    Text("${office[index]['salary']}"),
                                  ],
                                )),
                      ),
                    ],
                  ),
                )),
    );
  }
}

class AddUser extends StatefulWidget {
  const AddUser({Key? key}) : super(key: key);

  @override
  State<AddUser> createState() => _AddUserState();
}

class _AddUserState extends State<AddUser> {
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Center(
          child: ElevatedButton(
        onPressed: () {
          // firebaseFirestore
          //     .collection('User')
          //     .doc("CkGgGxc84rTogdH3vLGO")
          //     .update({
          //   "geneder": "male",
          // });

          // firebaseFirestore
          //     .collection('User')
          //     .doc("CkGgGxc84rTogdH3vLGO")
          //     .delete();

          firebaseFirestore.collection("User").doc("8hCGTCtCDruk7lTjWUry").set({
            "name": "dfsdfdsf",
            // "email": "dsfdsfsdf",
            // "age": 100,
          });
        },
        child: const Text('Add'),
      )),
    );
  }
}
