import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DemoSql extends StatefulWidget {
  const DemoSql({Key? key}) : super(key: key);

  @override
  State<DemoSql> createState() => _DemoSqlState();
}

class _DemoSqlState extends State<DemoSql> {
  Database? database;

  @override
  void initState() {
    createDb();
    super.initState();
  }

  void createDb() async {
    var databasePath = await getDatabasesPath();
    String path = join(databasePath, "demo1.db");

    database = await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      await db.execute(
          'CREATE TABLE Test (id INTEGER PRIMARY KEY, name TEXT, value INTEGER, num REAL)');
    });



  }

  void insertData() async {
    await database!.insert("Test", {
      "id": 2,
      "name": "xyz",
      "value": 125,
      "num": 2.9,
    });
  }

  void getData() async {
    List<Map<String, dynamic>> data = await database!.query("Test");

    print("DATA ${data}");
  }

  void updateData() async {
    database!.update(
        "Test",
        {
          "num": 5.23,
        },
        where: "id=?",
        whereArgs: [2]);
  }

  void deleteData() async {
    database!.delete("Test", where: "id=?", whereArgs: [2]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                insertData();
              },
              child: const Text('Insert'),
            ),
            ElevatedButton(
              onPressed: () {
                getData();
              },
              child: const Text('Get'),
            ),
            ElevatedButton(
              onPressed: () {
                updateData();
              },
              child: const Text('update'),
            ),
            ElevatedButton(
              onPressed: () {
                deleteData();
              },
              child: const Text('delete'),
            ),
          ],
        ),
      ),
    );
  }
}
