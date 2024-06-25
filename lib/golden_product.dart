
import 'package:firebase/sql_database/controller/golden_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';


class GoldenProduct extends StatefulWidget {
  const GoldenProduct({Key? key}) : super(key: key);

  @override
  State<GoldenProduct> createState() => _GoldenProductState();
}

class _GoldenProductState extends State<GoldenProduct> {
  // List<Map<String, dynamic>> product = [];
  // bool loading = false;
  // FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  // Database? database;
  TextEditingController mobilectr = TextEditingController();
  TextEditingController tvctr = TextEditingController();
  final goldencontroller = Get.put<GoldenController>(GoldenController());
  //
  // void getData() async {
  //   setState(() {
  //     loading = true;
  //   });
  //   QuerySnapshot data = await firebaseFirestore
  //       .collection("golden")
  //       .where('load', isEqualTo: false)
  //       .get();
  //   for (var element in data.docs) {
  //     product.add(element.data() as Map<String, dynamic>);
  //     firebaseFirestore
  //         .collection('golden')
  //         .doc(element.id)
  //         .update({"load": true});
  //     insertData(element.data() as Map<String, dynamic>);
  //     //print("$product");
  //   }
  //
  //   setState(() {
  //     loading = false;
  //   });
  //   //getDisplay();
  // }
  //
  // void createData() async {
  //   var databasesPath = await getDatabasesPath();
  //   String path = join(databasesPath, 'product1.db');
  //
  //   database = await openDatabase(path, version: 1,
  //       onCreate: (Database db, int version) async {
  //     await db.execute(
  //         'CREATE TABLE Data (id INTEGER PRIMARY KEY, mobile TEXT, tv TEXT)');
  //   });
  //   //print(">>>>>>>>>>>>>>>Created$database<<<<<<<<<<<<<<<<<<<<");
  //   print("TABLE CREATED");
  //   getDisplay();
  // }
  //
  // List<Map<String, dynamic>>? ddatal = [];
  // void getDisplay() async {
  //   ddatal = await database?.query("Data");
  //   setState(() {});
  //
  //   print("DATA ...................$ddatal......................");
  // }
  //
  // void insertData(Map<String, dynamic> data) async {
  //   await database?.insert(
  //     "Data",
  //     {
  //       "id": data['id'],
  //       "mobile": data['mobile'],
  //       "tv": data['tv'],
  //       //"load": data["load"]
  //     },
  //   );
  //   print("$product");
  // }
  //
  // void updateData() {
  //   firebaseFirestore.collection("golden").doc().update(
  //     {'mobile': mobilectr.text, 'tv': tvctr.text},
  //   );
  // }

  @override
  void initState() {
    super.initState();
    goldencontroller.createData();
    goldencontroller.getData();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: goldencontroller.loading
            ? const Center(child: CircularProgressIndicator())
            : GetBuilder<GoldenController>(
                builder: (controller) {
                  return Padding(
                    padding: const EdgeInsets.only(top: 8.0, right: 8, left: 8),
                    child: GridView.builder(
                      itemCount: controller.ddatal?.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 5,
                              mainAxisSpacing: 5,
                              childAspectRatio: 0.9),
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          decoration: BoxDecoration(
                              color: Colors.grey.shade400,
                              borderRadius: BorderRadius.circular(15)),
                          child: Center(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 90),
                                  child: IconButton(
                                      onPressed: () {
                                        mobilectr.text =
                                            controller.ddatal?[index]['mobile'];
                                        tvctr.text =
                                            controller.ddatal?[index]['tv'];
                                        showModalBottomSheet(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return Container(
                                              height: 300,
                                             color: Colors.grey.shade300,
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 15,
                                                    right: 15,
                                                    top: 15),
                                                child: Column(
                                                  children: [
                                                    TextField(
                                                      controller: mobilectr,
                                                      decoration:
                                                          InputDecoration(
                                                        hintText:
                                                            "${controller.ddatal?[index]['mobile']}",
                                                        filled: true,
                                                        fillColor: Colors.white,
                                                        border:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide.none,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(15),
                                                        ),
                                                      ),
                                                    ),
                                                    const SizedBox(height: 15),
                                                    TextField(
                                                      controller: tvctr,
                                                      decoration:
                                                          InputDecoration(
                                                        hintText:
                                                            "${controller.ddatal?[index]['tv']}",
                                                        filled: true,
                                                        fillColor: Colors.white,
                                                        border:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide.none,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(15),
                                                        ),
                                                      ),
                                                    ),
                                                    const SizedBox(height: 30),
                                                    ElevatedButton(
                                                        onPressed: () {
                                                          goldencontroller.firebaseFirestore
                                                              .collection(
                                                                  "golden")
                                                              .doc(goldencontroller
                                                                      .ddatal?[
                                                                  index]['unq'])
                                                              .update(
                                                            {
                                                              "load": false,
                                                              "mobile":
                                                                  mobilectr
                                                                      .text,
                                                              "tv": tvctr.text
                                                            },
                                                          );
                                                          goldencontroller
                                                              .DataUpdate(
                                                                  goldencontroller
                                                                          .ddatal![
                                                                      index]);
                                                        },
                                                        child: const Text(
                                                            "Update")),
                                                  ],
                                                ),
                                              ),
                                            );
                                          },
                                        );
                                      },
                                      icon: const Icon(Icons.edit)),
                                ),
                                Text("Id:- ${controller.ddatal?[index]['id']}"),
                                Text("Mobile:- ${controller.ddatal?[index]['mobile']}"),
                                Text("T.V:- ${controller.ddatal?[index]['tv']}"),
                                //Text(DateFormat.yMMM().format(controller.ddatal?[index]['time'])),
                                //Text(DateFormat('MMM d').format(controller.product1[index]['time'])),
                                // Text(
                                //     "Time:- ${controller.formattedDate}"),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  );
                },
              ));
  }
}
