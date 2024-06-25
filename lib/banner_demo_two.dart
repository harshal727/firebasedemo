import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class BannerDemoTwo extends StatefulWidget {
  const BannerDemoTwo({super.key});

  @override
  State<BannerDemoTwo> createState() => _BannerDemoTwoState();
}

class _BannerDemoTwoState extends State<BannerDemoTwo> {
  List<Map<String, dynamic>> data = [

    {
      "title": "Banner",
      "data": [
        "assets/images/img_4.png",
        "assets/images/img_5.png",
        "assets/images/img_6.png",
        "assets/images/img_7.png"
      ]
    },
    {
      "title": "Categories",
      "data": ['Fast & Furious', 'Darcula', 'Blackening', 'OBLIVION']
    },
    {
      "title": "Products",
      "data": [
        "assets/images/img.png",
        "assets/images/img_2.png",
        "assets/images/img_1.png",
        "assets/images/img_3.png",
      ],
      "price": ["499\$", "599\$", "299\$", "199\$"]
    },
  ];

  Widget buildSection(Map<String, dynamic> section) {
    if (section['title'] == 'Banner') {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Text(
              "${section['title']}",
              style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ),
          CarouselSlider(
            options: CarouselOptions(
                height: 150.0,
                autoPlayAnimationDuration: const Duration(seconds: 2),
                autoPlay: true),
            items: List.generate(
              section['data'].length,
                  (index) => Container(
                margin: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                    color: Colors.transparent,
                    image: DecorationImage(
                        image: AssetImage("${section['data'][index]}"),
                        fit: BoxFit.fill)),
              ),
            ),
          ),
        ],
      );
    } else if (section['title'] == 'Categories') {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10, top: 10),
            child: Text(
              "${section['title']}",
              style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(
                section['data'].length,
                    (index) {
                  return Container(
                    margin: const EdgeInsets.symmetric(horizontal: 6),
                    decoration: BoxDecoration(
                        border: Border.all(width: 1, color: Colors.white),
                        borderRadius: BorderRadius.circular(20)),
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Text(
                        "${section['data'][index]}",
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      );
    } else if (section['title'] == 'Products') {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10, top: 10),
            child: Text(
              "${section['title']}",
              style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ),
          SizedBox(
            height: 300,
            child: GridView.builder(
              itemCount: section['data'].length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.9,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10),
              itemBuilder: (context, index) {
                return Container(
                  width: 100,
                  decoration: BoxDecoration(
                      color: Colors.black,
                      image: DecorationImage(
                          image: AssetImage("${section['data'][index]}"),
                          fit: BoxFit.fill)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        width: double.infinity,
                        height: 40,
                        color: Colors.black26,
                        child: Center(
                            child: Text(
                              "Price: ${section['price'][index]}",
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15),
                            )),
                      )
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      );
    } else {
      return const SizedBox.shrink();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Center(
              child: Text(
                "Dynamic UI",
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
          ),
          ...data.map((section) => buildSection(section)).toList(),
        ],
      ),
    );
  }
}

