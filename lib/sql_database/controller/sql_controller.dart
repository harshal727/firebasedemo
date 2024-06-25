import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import 'dart:convert';

class MyController extends GetxController {
  TextEditingController namectr = TextEditingController();
  TextEditingController passctr = TextEditingController();
  Database? database;
  List all = [].obs;
  @override
  void onInit() {
    super.onInit();
    createData();
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

    print("DATA $data");
  }

  void insertData(String name, String password) async {
    CountryResponceModel countryResponceModel;

    countryResponceModel = CountryResponceModel.fromJson({
      "id": 0,
      "name": name,
      "age": "",
      "password": password,
    });

    await database!.insert(
      "Data",
      countryResponceModel.toJson(),
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
}

// To parse this JSON data, do
//
//     final countryResponceModel = countryResponceModelFromJson(jsonString);

CountryResponceModel countryResponceModelFromJson(String str) =>
    CountryResponceModel.fromJson(json.decode(str));

String countryResponceModelToJson(CountryResponceModel data) =>
    json.encode(data.toJson());

class CountryResponceModel {
  int? id;
  String? name;
  String? age;
  String? password;

  CountryResponceModel({
    this.id,
    this.name,
    this.age,
    this.password,
  });

  factory CountryResponceModel.fromJson(Map<String, dynamic> json) =>
      CountryResponceModel(
        id: json["id"],
        name: json["name"],
        age: json["age"],
        password: json["password"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "age": age,
        "password": password,
      };
}
