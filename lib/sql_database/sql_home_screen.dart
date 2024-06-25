import 'package:flutter/material.dart';

class SqlHomeScreen extends StatefulWidget {
  const SqlHomeScreen({Key? key, this.name, this.password}) : super(key: key);
  final name;
  final password;
  @override
  State<SqlHomeScreen> createState() => _SqlHomeScreenState();
}

class _SqlHomeScreenState extends State<SqlHomeScreen> {
  List allData = [];
  void addData() {
    allData.add(widget.name);
    allData.add(widget.password);
    setState(() {});
    print("$allData");
  }

  @override
  void initState() {
    super.initState();
    addData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("${widget.name}", style: const TextStyle(fontSize: 20)),
            Text("${widget.password}", style: const TextStyle(fontSize: 20)),
            // Container(
            //   height: 150,
            //   width: 250,
            //   color: Colors.yellow.shade300,
            //   child: Text("${allData[1]}"),
            // ),
          ],
        ),
      ),
    );
  }
}
