import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class BannerDemo extends StatefulWidget {
  const BannerDemo({super.key});

  @override
  State<BannerDemo> createState() => _BannerDemoState();
}

class _BannerDemoState extends State<BannerDemo> {
  List<Map<String, dynamic>> detail = [


    {
      "title": "Products",
      "data": [
        "assets/images/img_4.png",
        "assets/images/img_5.png",
        "assets/images/img_6.png",
        "assets/images/img_7.png"
      ],
    },
    {
      "title": "Categories",
      "data": ["Electronics", "Fruit", "Vegetable", "Grocery"]
    },
    {
      "title": "Banner",
      "data": [
        "assets/images/img.png",
        "assets/images/img_2.png",
        "assets/images/img_1.png",
        "assets/images/img_3.png",
      ]
    },

  ];
  //List banner = [];
  // void add() {
  //   banner.add({detail[0]["data"]});
  // }
  //
  // @override
  // void initState() {
  //   add();
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dynamic UI"),
        centerTitle: true,
        backgroundColor: Colors.grey.shade300,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            for (var section in detail)
              Column(
                children: [
                  if (section['title'] == 'Banner')
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                    const SizedBox(height: 15),
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Text(
                            "${section['title']}",
                            style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                               ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        CarouselSlider(
                          options: CarouselOptions(
                              height: 180.0,
                              autoPlayAnimationDuration:
                                  const Duration(seconds: 2),
                              autoPlay: true),
                          items: List.generate(
                            section['data'].length,
                            (index) => Container(
                              margin: const EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                  color: Colors.transparent,
                                  borderRadius: BorderRadius.circular(15),
                                  image: DecorationImage(
                                      image:
                                          AssetImage("${section['data'][index]}"),
                                      fit: BoxFit.fill)),
                            ),
                          ),
                        ),
                      ],
                    )
                  else if (section['title'] == 'Categories')
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height:15),
                        Padding(
                          padding: const EdgeInsets.only(left: 10, top: 10),
                          child: Text(
                            "${section['title']}",
                            style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: List.generate(
                            section['data'].length,
                                (index) => Container(
                              height: 43,
                              width: 80,
                              decoration: BoxDecoration(
                                  border: Border.all(),
                                  borderRadius: BorderRadius.circular(10)),
                              margin: const EdgeInsets.only(left: 8),
                              child: Center(
                                child: Text(
                                    "${section['data'][index]}"),
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  else if (section['title'] == 'Products')
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
        
                        Padding(
                          padding: const EdgeInsets.only(left: 10, top: 10),
                          child: Text(
                            "${section['title']}",
                            style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 350,
                          child: GridView.builder(
                            itemCount: section['data'].length,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    childAspectRatio: 0.9,
                                    crossAxisSpacing: 10,
                                    mainAxisSpacing: 10),
                            itemBuilder: (context, index) {
                              print(
                                  "<<<<<<<<<<<<<<<<<<<<<<<<<<<${section['data'][index]}");
                              return Container(
                                width: 100,
                                decoration: const BoxDecoration(
                                    color: Colors.transparent,
        
                                ),
                                child: Image(image: AssetImage("${section['data'][index]}"),)
                              );
                            },
                          ),
                        ),
                      ],
                    )
                  else
                    const SizedBox.shrink()
        
                  // const SizedBox(
                  //   height: 10,
                  // ),
                  // Padding(
                  //   padding: const EdgeInsets.only(left: 8),
                  //   child: Text(
                  //     "${element["title"]}",
                  //     style: const TextStyle(
                  //         fontSize: 25, fontWeight: FontWeight.bold),
                  //   ),
                  // ),
                  // const SizedBox(
                  //   height: 10,
                  // ),
                  // if (element['data'] is List<String>)
                  //   element['title'] == 'Banner'
                  //       ? CarouselSlider(
                  //           options: CarouselOptions(
                  //               height: 180.0,
                  //               autoPlayAnimationDuration:
                  //                   const Duration(seconds: 2),
                  //               autoPlay: true),
                  //           items: List.generate(
                  //             element["data"].length,
                  //             (index) {
                  //               //print("${detail[0]["data"][index]}");
                  //               return Container(
                  //                 height: 80,
                  //                 width: 280,
                  //                 decoration: BoxDecoration(
                  //                   color: Colors.grey,
                  //                   image: DecorationImage(
                  //                       image: AssetImage(
                  //                           "${element["data"][index]}"),
                  //                       fit: BoxFit.fill),
                  //                 ),
                  //               );
                  //             },
                  //           ),
                  //         )
                  //       : Row(
                  //           children: List.generate(
                  //             element['data'][1]['name'].length,
                  //             (index) => Container(
                  //               height: 43,
                  //               width: 80,
                  //               decoration: BoxDecoration(
                  //                   border: Border.all(),
                  //                   borderRadius: BorderRadius.circular(15)),
                  //               margin: const EdgeInsets.only(left: 8),
                  //               child: Center(
                  //                 child: Text(
                  //                     "${element['data'][1]['name'][index]}"),
                  //               ),
                  //             ),
                  //           ),
                  //         ),
                  // if (element['data'] is List<dynamic>)
                  //   element['title'] == 'Products'
                  //       ? Expanded(
                  //           child: Padding(
                  //             padding: const EdgeInsets.only(left: 8, right: 8),
                  //             child: GridView.builder(
                  //               gridDelegate:
                  //                   const SliverGridDelegateWithFixedCrossAxisCount(
                  //                       crossAxisCount: 2,
                  //                       childAspectRatio: 0.9,
                  //                       crossAxisSpacing: 5,
                  //                       mainAxisSpacing: 5),
                  //               itemCount: detail[2]['data'][0]['name'].length,
                  //               itemBuilder: (BuildContext context, int index) {
                  //                 return Container(
                  //                   height: 50,
                  //                   width: 210,
                  //                   // color: Colors.grey.shade400,
                  //                   decoration:
                  //                       BoxDecoration(border: Border.all()),
                  //                   child: Column(
                  //                     children: [
                  //                       const SizedBox(height: 10),
                  //                       Text(
                  //                           "${detail[2]['data'][0]['name'][index]}"),
                  //                       const SizedBox(height: 10),
                  //                       Container(
                  //                         height: 130,
                  //                         width: 210,
                  //                         decoration: BoxDecoration(
                  //                             image: DecorationImage(
                  //                                 image: AssetImage(
                  //                                     "${detail[2]['data'][0]['pic'][index]}"))),
                  //                       )
                  //                       // Image(image: AssetImage(),fit: BoxFit.fill,)
                  //                     ],
                  //                   ),
                  //                 );
                  //               },
                  //             ),
                  //           ),
                  //         )
                  //       : null
        
                  // Padding(
                  //   padding: const EdgeInsets.only(left: 8),
                  //   child: Text(
                  //     "${detail[1]["title"]}",
                  //     style: const TextStyle(
                  //         fontSize: 25, fontWeight: FontWeight.bold),
                  //   ),
                  // ),
                  // const SizedBox(height: 15),
                  //
                  // const SizedBox(height: 10),
                  // Padding(
                  //   padding: const EdgeInsets.only(left: 8),
                  //   child: Text(
                  //     "${detail[2]["title"]}",
                  //     style: const TextStyle(
                  //         fontSize: 25, fontWeight: FontWeight.bold),
                  //   ),
                  // ),
                  // const SizedBox(height: 10),
                  // Expanded(
                  //   child: Padding(
                  //     padding: const EdgeInsets.only(left: 8, right: 8),
                  //     child: GridView.builder(
                  //       gridDelegate:
                  //           const SliverGridDelegateWithFixedCrossAxisCount(
                  //               crossAxisCount: 2,
                  //               childAspectRatio: 0.9,
                  //               crossAxisSpacing: 5,
                  //               mainAxisSpacing: 5),
                  //       itemCount: detail[2]['data'][0]['name'].length,
                  //       itemBuilder: (BuildContext context, int index) {
                  //         return Container(
                  //           height: 50,
                  //           width: 210,
                  //           // color: Colors.grey.shade400,
                  //           decoration: BoxDecoration(border: Border.all()),
                  //           child: Column(
                  //             children: [
                  //               const SizedBox(height: 10),
                  //               Text("${detail[2]['data'][0]['name'][index]}"),
                  //               const SizedBox(height: 10),
                  //               Container(
                  //                 height: 130,
                  //                 width: 210,
                  //                 decoration: BoxDecoration(
                  //                     image: DecorationImage(
                  //                         image: AssetImage(
                  //                             "${detail[2]['data'][0]['pic'][index]}"))),
                  //               )
                  //               // Image(image: AssetImage(),fit: BoxFit.fill,)
                  //             ],
                  //           ),
                  //         );
                  //       },
                  //     ),
                  //   ),
                  // )
                  // if (section['title'] == 'Banner') {
                  //   return Column(
                  //     crossAxisAlignment: CrossAxisAlignment.start,
                  //     children: [
                  //       Padding(
                  //         padding: const EdgeInsets.only(left: 10),
                  //         child: Text(
                  //           "${section['title']}",
                  //           style: const TextStyle(
                  //               fontSize: 20,
                  //               fontWeight: FontWeight.bold,
                  //               color: Colors.white),
                  //         ),
                  //       ),
                  //       CarouselSlider(
                  //         options: CarouselOptions(
                  //             height: 150.0,
                  //             autoPlayAnimationDuration: const Duration(seconds: 2),
                  //             autoPlay: true),
                  //         items: List.generate(
                  //           section['data'].length,
                  //               (index) => Container(
                  //             margin: const EdgeInsets.all(5),
                  //             decoration: BoxDecoration(
                  //                 color: Colors.transparent,
                  //                 image: DecorationImage(
                  //                     image: AssetImage("${section['data'][index]}"),
                  //                     fit: BoxFit.fill)),
                  //           ),
                  //         ),
                  //       ),
                  //     ],
                  //   );
                  // }
                ],
              )
          ],
        ),
      ),
    );
  }
}
