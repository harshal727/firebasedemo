import 'package:firebase/sql_database/controller/sql_controller.dart';
import 'package:firebase/sql_database/sql_home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class SqlRegistration extends StatefulWidget {
  const SqlRegistration({Key? key}) : super(key: key);

  @override
  State<SqlRegistration> createState() => _SqlRegistrationState();
}

class _SqlRegistrationState extends State<SqlRegistration> {
  MyController myController = Get.put(MyController());
  TextEditingController namectr = TextEditingController();
  TextEditingController passctr = TextEditingController();

  Database? database;

  List<String> age = [
    "18",
    "19",
    "20",
    "21",
    "22",
    "23",
    "24",
    "25",
    "26",
    "27",
    "28",
    "29",
    "30",
  ];
  var selectedAge;
  List all = [];
  @override
  void initState() {
    createData();
    super.initState();
  }

  void createData() async {
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'hk1.db');

    await deleteDatabase(path);

    database = await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      await db.execute(
          'CREATE TABLE Data (id INTEGER PRIMARY KEY, name TEXT, password REAL)');
    });
  }

  void getData() async {
    List<Map<String, dynamic>> data = await database!.query("Data");
    namectr.text = data[0]["name"];
    //selectedAge = data[0]["age"];
    passctr.text = data[0]["password"];
    setState(() {});
    print("DATA $data");
  }

  void insertData(String name, String password) async {
    await database!.insert(
      "Data",
      {
        "id": 0,
        "name": name,
        "age": age,
        "password": password,
      },
    );
  }

  void updateData() async {
    database!.update(
        "Data",
        {
          "password": passctr.text,
        },
        where: "name=?",
        whereArgs: [namectr.text]);
  }

  void deleteData(String name) async {
    database!.delete("Data", where: "name=?", whereArgs: [namectr.text]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(left: 15, right: 15),
          child: Column(
            children: [
              const SizedBox(height: 30),
              const Text(
                "Registration",
                style: TextStyle(fontSize: 25),
              ),
              Expanded(
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 0.9,
                    crossAxisSpacing: 0.8,
                  ),
                  itemCount: all.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      height: 66,
                      width: 70,
                      color: Colors.yellow.withOpacity(0.5),
                      child: Column(
                        children: [
                          Text("${all[index]}"),
                          Row(
                            children: [
                              IconButton(
                                onPressed: () {},
                                icon: const Icon(Icons.edit),
                              ),
                              const Spacer(),
                              IconButton(
                                onPressed: () {},
                                icon: const Icon(Icons.delete),
                              ),
                            ],
                          )
                        ],
                      ),
                    );
                  },
                ),
              ),

              const SizedBox(height: 50),
              TextField(
                controller: namectr,
                decoration: InputDecoration(
                    hintText: "Name",
                    filled: true,
                    fillColor: Colors.grey.shade300,
                    border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(10))),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: passctr,
                decoration: InputDecoration(
                    hintText: "Password",
                    filled: true,
                    fillColor: Colors.grey.shade300,
                    border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(10))),
              ),
              const SizedBox(height: 10),
              // Padding(
              //   padding: const EdgeInsets.only(right: 250),
              //   child: DropdownButtonFormField(
              //     decoration: InputDecoration(
              //       hintText: "Age",
              //       filled: true,
              //       fillColor: Colors.grey.shade300,
              //       hintStyle: const TextStyle(color: Colors.black),
              //       border: OutlineInputBorder(
              //           borderSide: BorderSide.none,
              //           borderRadius: BorderRadius.circular(10)),
              //     ),
              //     value: selectedAge,
              //     items: List.generate(
              //         age.length,
              //         (index) => DropdownMenuItem<String>(
              //             value: age[index], child: Text(age[index]))),
              //     onChanged: (value) {
              //       setState(() {
              //         selectedAge = value.toString();
              //       });
              //     },
              //   ),
              // ),
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                      onPressed: () {
                        insertData(namectr.text, passctr.text);
                        all.add(namectr.text);
                        all.add(passctr.text);
                        // print("$all");
                      },
                      child: const Text("Insert")),
                  const SizedBox(width: 5),
                  ElevatedButton(
                      onPressed: () {
                        updateData();
                      },
                      child: const Text("Update")),
                  const SizedBox(width: 5),
                  ElevatedButton(
                      onPressed: () {
                        deleteData(namectr.text);
                      },
                      child: const Text("Delete")),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                      onPressed: () {
                        getData();
                      },
                      child: const Text("Get")),
                  const SizedBox(width: 5),
                  ElevatedButton(
                      onPressed: () {
                        namectr.clear();
                        //selectedAge.clear();
                        passctr.clear();
                        setState(() {});
                      },
                      child: const Text("Clear")),
                ],
              ),
              const SizedBox(height: 10),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SqlHomeScreen(
                          name: namectr.text,
                          password: passctr.text,
                        ),
                      ));
                },
                child: Container(
                  height: 55,
                  width: 250,
                  decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      borderRadius: BorderRadius.circular(15)),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
