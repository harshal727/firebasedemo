import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AllWidgets extends StatefulWidget {
  const AllWidgets({super.key});

  @override
  State<AllWidgets> createState() => _AllWidgetsState();
}

class _AllWidgetsState extends State<AllWidgets> with TickerProviderStateMixin {
  late final TabController controller;
  Offset offset = const Offset(200, 250);
  int index = 0;
  int currentStep = 0;
  int? slider = 0;
  bool ignore = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: PreferredSize(
      //   preferredSize: const Size.fromHeight(80),
      //   child: Container(
      //     height: 120,
      //     decoration: const BoxDecoration(
      //         gradient:
      //             LinearGradient(colors: [Colors.orangeAccent, Colors.green])),
      //     child: Center(
      //       child: ListTile(
      //         trailing: IconButton(
      //             onPressed: () {},
      //             icon: const Icon(
      //               Icons.search_rounded,
      //               color: Colors.white,
      //               size: 30,
      //             )),
      //         title: const Text(
      //           "All Widgets",
      //           style: TextStyle(color: Colors.white, fontSize: 22),
      //         ),
      //       ),
      //     ),
      //   ),
      // ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showMaterialBanner(
                        MaterialBanner(
                            content: const Text("Subscribe!!!"),
                            backgroundColor: Colors.green.shade300,
                            actions: [
                          TextButton(
                              onPressed: () {
                                ScaffoldMessenger.of(context)
                                    .hideCurrentMaterialBanner();
                              },
                              child: const Text("Dismiss"))
                        ]));
                  },
                  child: const Text("OPEN")),
              // LayoutBuilder(
              //   builder: (BuildContext context, BoxConstraints constraints) {
              //     return Stack(
              //       children: [
              //         Positioned(
              //           left: offset.dx,
              //           top: offset.dy,
              //           child: LongPressDraggable(
              //             feedback: Image.asset(
              //               "assets/images/img_3.png",
              //               height: 200,
              //               color: Colors.grey,
              //               colorBlendMode: BlendMode.colorBurn,
              //             ),
              //             child: Image.asset(
              //               "assets/images/img_3.png",
              //               height: 200,
              //             ),
              //             onDragEnd: (details) {setState(() {
              //               double adjustment =MediaQuery.of(context).size.height-constraints.maxHeight;
              //               offset=Offset(details.offset.dx, details.offset.dy-adjustment);
              //             });},
              //           ),
              //         )
              //       ],
              //     );
              //   },
              // )
              const SizedBox(height: 8),
              SizedBox(
                height: 100,
                width: 100,
                child: CupertinoContextMenu(
                  actions: [
                    CupertinoContextMenuAction(
                      child: const Text("Action One"),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                    CupertinoContextMenuAction(
                      child: const Text("Action Two"),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ],
                  child: Image.asset("assets/images/img_3.png"),
                ),
              ),
              const SizedBox(height: 8),
              ElevatedButton(
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                              actions: [
                                TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: const Text("Close"))
                              ],
                              title: const Text("Flutter Map"),
                              content: const Text("This is Alert Dialog"),
                              contentPadding: const EdgeInsets.all(15),
                            ));
                  },
                  child: const Text("Alert Dialog")),
              const SizedBox(height: 8),
              Container(
                height: 200,
                width: 200,
                color: Colors.black38,
                child: GridTile(
                  header: const GridTileBar(
                    backgroundColor: Colors.black45,
                    leading: Icon(Icons.person),
                    title: Text("Flutter Map"),
                    trailing: Icon(Icons.menu),
                  ),
                  footer: const GridTileBar(
                    backgroundColor: Colors.black38,
                    leading: Icon(Icons.favorite),
                  ),
                  child: Image.asset(
                    "assets/images/images (2).jpg",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(height: 8),
              // ElevatedButton(
              //   onPressed: () {
              //     setState(() {
              //       ignore = !ignore;
              //     });
              //   },
              //   style: ElevatedButton.styleFrom(
              //       shape: RoundedRectangleBorder(
              //           borderRadius: BorderRadius.circular(5)),
              //       backgroundColor:
              //           ignore ? Colors.red.shade300 : Colors.green.shade300),
              //   child: Text(
              //     ignore ? "Blocked" : "All Good",
              //     style: TextStyle(color: ignore ? Colors.white : Colors.black),
              //   ),
              // ),
              // IgnorePointer(
              //   ignoring: ignore,
              //   child: ElevatedButton(onPressed: () {  }, child: const Text("Click me!!"),),
              // )
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                      onPressed: () {
                        setState(() {
                          index = 0;
                        });
                      },
                      child: const Text("0")),
                  ElevatedButton(
                      onPressed: () {
                        setState(() {
                          index = 1;
                        });
                      },
                      child: const Text("1")),
                  ElevatedButton(
                      onPressed: () {
                        setState(() {
                          index = 2;
                        });
                      },
                      child: const Text("2")),
                ],
              ),
              const SizedBox(height: 8),
              IndexedStack(
                index: index,
                children: [
                  Center(
                    child: Image.asset("assets/images/images (1).jpg"),
                  ),
                  Center(
                    child: Image.asset("assets/images/images (2).jpg"),
                  ),
                  Center(
                    child: Image.asset("assets/images/images (3).jpg"),
                  ),
                ],
              ),
              const SizedBox(height: 15),
              Stepper(
                steps: [
                  Step(
                      isActive: currentStep == 0,
                      title: const Text("Step 1"),
                      content: const Text(
                        "Information for step 1",
                        style: TextStyle(color: Colors.black),
                      )),
                  Step(
                      isActive: currentStep == 1,
                      title: const Text("Step 2"),
                      content: const Text(
                        "Information for step 2",
                        style: TextStyle(color: Colors.brown),
                      )),
                  Step(
                      isActive: currentStep == 2,
                      title: const Text("Step 3"),
                      content: const Text(
                        "Information for step 3",
                        style: TextStyle(color: Colors.orangeAccent),
                      )),
                ],
                onStepTapped: (int newIndex) {
                  setState(() {
                    currentStep = newIndex;
                  });
                },
                currentStep: currentStep,
                onStepContinue: () {
                  if (currentStep != 2) {
                    setState(() {
                      currentStep += 1;
                    });
                  }
                },
                onStepCancel: () {
                  if (currentStep != 0) {
                    setState(() {
                      currentStep -= 1;
                    });
                  }
                },
                type: StepperType.vertical,
              ),
              const SizedBox(height: 15),
              const SelectableText(
                "This is Flutter Code",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 15),
              Wrap(
                  spacing: 10,
                  runSpacing: 5,
                  children: List.generate(
                    10,
                    (index) => Chip(
                      label: Text("$index"),
                    ),
                  )),
              const SizedBox(height: 25),
              Container(
                width: double.infinity,
                color: Colors.orange,
                child: const FittedBox(child: Text("This is Flutter code")),
              ),
              const SizedBox(height: 50),
              CupertinoSlidingSegmentedControl(
                children: const {
                  0: Text("Text 0"),
                  1: Text("Text 1"),
                  2: Text("Text 2"),
                  3: Text("Text 3"),
                },
                groupValue: slider,
                onValueChanged: (int? value) {
                  setState(() {
                    slider = value;
                  });
                },
              ),
              const SizedBox(height: 50),
              InteractiveViewer(
                  maxScale: 5,
                  child: Image.asset("assets/images/images (4).jpg")),
              const SizedBox(
                height: 500,
              )
            ],
          ),
        ),
      ),
    );
  }
}
