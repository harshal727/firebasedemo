import 'package:flutter/material.dart';

List ing = [
  "assets/images/images (5).jpg",
  "assets/images/images (1).jpg",
  "assets/images/images (2).jpg",
  "assets/images/images (3).jpg",
  "assets/images/images (4).jpg",
];
List info = ["London", "Spain", "Italy", "Rome", "Vanish"];

class ResponsiveDetail extends StatefulWidget {
  const ResponsiveDetail({super.key});

  @override
  State<ResponsiveDetail> createState() => _ResponsiveDetailState();
}

class _ResponsiveDetailState extends State<ResponsiveDetail> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: size.width < 510
          ? MobileView()
          : size.width > 510 && size.width < 1024
              ? const Center(child: Text("Tablet View"))
              : const Center(child: Text("Desktop View")),
    );
  }
}

class MobileView extends StatelessWidget {
  const MobileView({super.key});

  @override
  Widget build(BuildContext context) {
    // final size = MediaQuery.of(context).size;
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.only(left: 15, top: 25, right: 15),
      child: Column(
        children: [
          const Text(
            "Tourist Places",
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: h*0.03),
          Expanded(
            child: GridView.builder(
              itemCount: ing.length,
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 5,
                  childAspectRatio: 1,
                  mainAxisSpacing: 5),
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  height: h * 0.088,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      image: DecorationImage(
                          image: AssetImage("${ing[index]}"),
                          fit: BoxFit.fill)),
                );
              },
            ),
          ),

        ],
      ),
    );
  }
}
