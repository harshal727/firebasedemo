import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase/database/add_product.dart';
import 'package:firebase/preference_manager/prefernce_manager.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key, id}) : super(key: key);
  //final List favourite = [];

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Map<String, dynamic>> user = [];
  List like = [];
  bool loading = false;
  int select = 0;

  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  User? user1 = FirebaseAuth.instance.currentUser;

  @override
  void initState() {
    getDetail();
    //getU();
    super.initState();
  }

  void getDetail() async {
    setState(() {
      loading = true;
    });
    QuerySnapshot data = await firebaseFirestore.collection("product").get();

    for (var element in data.docs) {
      element.id;
      user.add(element.data() as Map<String, dynamic>);
    }
    for (var fav in data.docs) {
      like.add(fav.id);
    }
    setState(() {
      loading = false;
    });
  }

  // void getU() async {
  //   //print(widget.like.contains(user!.uid));
  //   var data1 = await FirebaseFirestore.instance
  //       .collection("person")
  //       .doc(user1!.uid)
  //       .get();
  //   print({user1!.uid});
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.menu_sharp),
        backgroundColor: Colors.brown,
        automaticallyImplyLeading: false,
        title: const Text("Home"),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.brown,
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const AddProduct(),
              ));
        },
        child: const Icon(Icons.add),
      ),
      body: loading
          ? const Center(child: CircularProgressIndicator())
          : Expanded(
              child: GridView.builder(
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 6,
                    crossAxisSpacing: 6,
                    childAspectRatio: 0.9),
                itemCount: like.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                      height: 80,
                      width: 56,
                      decoration: BoxDecoration(
                          color: Colors.brown.shade200,
                          borderRadius: BorderRadius.circular(15)),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                                padding: const EdgeInsets.only(left: 110),
                                child: IsLike(
                                  id: "${like[index]}",
                                  like: user[index]['favourite'],
                                )),
                            const SizedBox(height: 20),
                            Text("Name :- ${user[index]['name']}"),
                            Text("Price :- ${user[index]['price']} ₹"),
                            Text("Discount :- ${user[index]['discount']} %"),
                            const SizedBox(height: 15),
                            InkResponse(
                              onTap: () {},
                              child: Container(
                                height: 35,
                                width: 35,
                                decoration: BoxDecoration(
                                    color: Colors.brown.shade300,
                                    borderRadius: BorderRadius.circular(8)),
                                child: Center(
                                  child: Icon(
                                    Icons.shopping_cart,
                                    color: Colors.brown.shade500,
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ));
                },
              ),
            ),
    );
  }
}

class IsLike extends StatefulWidget {
  IsLike({Key? key, required this.id, required this.like}) : super(key: key);
  final String id;
  final List like;

  @override
  State<IsLike> createState() => _IsLikeState();
}

class _IsLikeState extends State<IsLike> {
  var call;
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  User? user = FirebaseAuth.instance.currentUser;
  bool isCheck = false;

  @override
  void initState() {
    isCheck = widget.like.contains(user!.uid);
    super.initState();

    print({user!.uid});
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () {
          List temp = widget.like;
          isCheck = !isCheck;
          if (widget.like.contains(user!.uid)) {
            temp.remove(PreferenceManager.getUid());

            setState(() {});
          } else {
            temp.add(PreferenceManager.getUid());
            firebaseFirestore
                .collection("product")
                .doc(widget.id)
                .update({"favourite": temp});
            setState(() {});
          }
        },
        icon: isCheck
            ? const Icon(
                Icons.favorite,
                color: Colors.brown,
              )
            : const Icon(
                Icons.favorite_border,
                color: Colors.brown,
              ));
  }
}
