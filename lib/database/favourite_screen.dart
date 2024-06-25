import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase/preference_manager/prefernce_manager.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class FavouriteScreen extends StatefulWidget {
  const FavouriteScreen({Key? key}) : super(key: key);

  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  List<Map<String, dynamic>> fav = [];
  List user = [];
  bool loading = false;
  var firebaseFirestore = FirebaseFirestore.instance.collection("product");

  @override
  void initState() {
    getFavourite();
    super.initState();
  }

  void getFavourite() async {
    setState(() {
      loading = true;
    });
    var data = await firebaseFirestore
        .where("favourite", arrayContains: PreferenceManager.getUid())
        .get();

    for (var element in data.docs) {
      fav.add(element.data());
    }

    for (var element in data.docs) {
      user.add(element.id);
    }
    setState(() {
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Favourite"),
        backgroundColor: Colors.brown,
        automaticallyImplyLeading: false,
      ),
      body: loading
          ? const Center(child: CircularProgressIndicator())
          : fav.isEmpty
              ? const Center(child: Text("No Favourite Product"))
              : GridView.builder(
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 6,
                      crossAxisSpacing: 6,
                      childAspectRatio: 0.9),
                  itemCount: fav.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                        height: 80,
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
                                    id: "${user[index]}",
                                    like: fav[index]['favourite'],
                                  )),
                              const SizedBox(height: 20),
                              Text("Name :- ${fav[index]['name']}"),
                              Text("Price :- ${fav[index]['price']} ₹"),
                              Text("Discount :- ${fav[index]['discount']} %"),
                            ],
                          ),
                        ));
                  },
                ),
    );
    // Scaffold(
    //   appBar: AppBar(
    //     title: const Text("Favourite"),
    //     backgroundColor: Colors.brown,
    //     automaticallyImplyLeading: false,
    //   ),
    //   body: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
    //     stream: firebaseFirestore
    //         .collection("product")
    //         .where('favourite', isEqualTo: true)
    //         .snapshots(),
    //     builder: (context, snapshot) {
    //       if (snapshot.data == null) {
    //         return Center(child: const CircularProgressIndicator());
    //       }
    //       if (snapshot.data!.docs.isEmpty) {
    //         return Center(child: const Text("No favourite iteam"));
    //       }
    //       return GridView.builder(
    //         shrinkWrap: true,
    //         gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
    //             crossAxisCount: 2,
    //             mainAxisSpacing: 6,
    //             crossAxisSpacing: 6,
    //             childAspectRatio: 0.9),
    //         itemCount: snapshot.data!.docs.length,
    //         itemBuilder: (BuildContext context, int index) {
    //           final user = snapshot.data!.docs[index].data();
    //           print(user);
    //           return Container(
    //               height: 80,
    //               color: Colors.brown.shade200,
    //               child: Padding(
    //                 padding: const EdgeInsets.symmetric(horizontal: 20),
    //                 child: Column(
    //                   crossAxisAlignment: CrossAxisAlignment.start,
    //                   mainAxisAlignment: MainAxisAlignment.start,
    //                   children: [
    //                     Padding(
    //                         padding: const EdgeInsets.only(left: 110),
    //                         child: IsLike(
    //                           id: snapshot.data!.docs[index].id,
    //                           Like: user['favourite'],
    //                         )),
    //                     const SizedBox(height: 20),
    //                     Text("Name :- ${user['name']}"),
    //                     Text("Price :- ${user['price']} ₹"),
    //                     Text("Discount :- ${user['discount']} %"),
    //                   ],
    //                 ),
    //               ));
    //         },
    //       );
    //     },
    //   ));
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
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  User? user = FirebaseAuth.instance.currentUser;
  bool isCheck = false;
  @override
  void initState() {
    isCheck = widget.like.contains(user!.uid);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //bool isCheck = widget.Like.contains(user!.uid);
    return IconButton(
        onPressed: () {
          isCheck = !isCheck;
          if (widget.like.contains(user!.uid)) {
            firebaseFirestore
                .collection("product")
                .doc(widget.id)
                .update({"favourite": []});
            setState(() {});
          } else {
            firebaseFirestore.collection("product").doc(widget.id).update({
              "favourite": [PreferenceManager.getUid()]

              //"favourite": [(widget.id)]
              //"favourite": true
            });
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
