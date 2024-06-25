import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class GoldenController extends GetxController {
  List<Map<String, dynamic>> product = [];
  List<Map<String, dynamic>> product1 = [];
  List ids = [];
  bool loading = false;
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  Database? database;
  var formattedDate = DateFormat.yM().format(DateTime(DateTime.may));
  var format = DateFormat.HOUR_MINUTE;
  final formattedDateTime = DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime(DateTime.may));

  void getData() async {
    QuerySnapshot data = await firebaseFirestore
        .collection("golden")
        .where('load', isEqualTo: false)
        .get();
    for (var element in data.docs) {
      product.add(element.data() as Map<String, dynamic>);
      ids.add(element.id);
      firebaseFirestore
          .collection('golden')
          .doc(element.id)
          .update({"load": true});
      insertData(element.data() as Map<String, dynamic>);
      // print("<,,,,,,,<,,,,,,,,,,,,,,$product???????????????????????");
      // print("<,,,,,,,<,,,,,,,,,,,,,,$ids???????????????????????");
      for(var element in data.docs){
        product1.add(element.id as Map<String, dynamic> );
      }
    }
    print("===================PRODUCTS==$ids======================");

    //getDisplay();
  }


  void createData() async {
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'product11.db');

    database = await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      await db.execute(
          'CREATE TABLE Data (id INTEGER PRIMARY KEY, mobile TEXT, tv TEXT)');
    });
    //print(">>>>>>>>>>>>>>>Created$database<<<<<<<<<<<<<<<<<<<<");
    print("TABLE CREATED");
    getDisplay();
  }

  List<Map<String, dynamic>>? ddatal = [];
  void getDisplay() async {
    ddatal = await database?.query("Data");

    print("DATA ...................$ddatal......................");
  }

  void insertData(Map<String, dynamic> data) async {
    await database?.insert(
      "Data",
      {
        "id": data['id'],
        "mobile": data['mobile'],
        "tv": data['tv'],
        //"load": data["load"]
      },
    );
    print("$product");
  }

  // void updateData() {
  //   firebaseFirestore.collection("golden").doc().update(
  //     {'mobile': mobilectr.text, 'tv': tvctr.text},
  //   );
  // }

  void DataUpdate(Map<String, dynamic> pd) async {
    await database?.update("Data", {"mobile": pd['mobile'], "tv": pd['tv']},
        where: "id=?", whereArgs: [pd['id']]);
  }


}
