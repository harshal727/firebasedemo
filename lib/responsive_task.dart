import 'package:firebase/responsive_detail.dart';
import 'package:flutter/material.dart';



List type = ["Location", "Security", "General", "Message"];
List city = ["London", "Spain", "Italy", "Rome", "Vanish"];
List detail = [
  "Ensure the address",
  "System permission",
  "Basic functional",
  "Tack over the time"
];
List icn = [
  Icons.location_on_outlined,
  Icons.privacy_tip_outlined,
  Icons.all_inbox,
  Icons.message_outlined
];
List pic = [
  Icons.wallet,
  Icons.delivery_dining,
  Icons.message_outlined,
  Icons.home_repair_service
];

List colo = [
  Colors.purple.shade100,
  Colors.pink.shade100,
  Colors.yellow.shade100,
  Colors.blueAccent.shade100
];

List name = ["Wallet", "Delivery", "Message", "Service"];
List ing = [
  "assets/images/images (5).jpg",
  "assets/images/images (1).jpg",
  "assets/images/images (2).jpg",
  "assets/images/images (3).jpg",
  "assets/images/images (4).jpg",
];
List info = [
  "London is the capital and largest city of both England and the United Kingdom, \nwith a population of around 8.8 million, and its metropolitan area is the largest in Western Europe, with a population of 14.9 million.",
  "Spain occupies most of the Iberian Peninsula, stretching south from the Pyrenees Mountains to the Strait of Gibraltar,\nwhich separates Spain from Africa.",
  "Italy is a country located in Southern Europe comprising the boot-shaped,\nItalian peninsula and a number of islands including Sicily and Sardinia. ",
  "Rome, historic city and capital of Roma province, of Lazio region,and of the country of Italy. \nRome is located in the central portion of the Italian peninsula,on the Tiber River about 15 miles (24 km) inland from the Tyrrhenian Sea.",
  "Venice is unique environmentally, architecturally, and historically, \nand in its days as a republic the city was styled la serenissim. "
];


class ResponsiveTask extends StatefulWidget {
  const ResponsiveTask({super.key});

  @override
  State<ResponsiveTask> createState() => _ResponsiveTaskState();
}

class _ResponsiveTaskState extends State<ResponsiveTask> {

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    //print("${size.width}");
    return Scaffold(
      drawer: Drawer(
        child: Column(
          children: [
            Container(
              height: h * 0.20,
              width: w * 0.7,
              color: Colors.grey.shade300,
              child: Padding(
                padding: const EdgeInsets.only(top: 15, right: 30),
                child: Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Dareen Adam",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            fontSize: 20),
                      ),
                      const Text("A trendsetter",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontWeight: FontWeight.bold)),
                      SizedBox(height: h * 0.035),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              Text("846",
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold)),
                              Text("Collect",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold))
                            ],
                          ),
                          Column(
                            children: [
                              Text("51",
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold)),
                              Text("Attention",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold))
                            ],
                          ),
                          Column(
                            children: [
                              Text("267",
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold)),
                              Text(
                                "Track",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                          Column(
                            children: [
                              Text("39",
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold)),
                              Text(
                                "Coupons",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: h * 0.05),
            Column(
                children: List.generate(
              4,
              (index) => Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Icon(icn[index], size: 30),
                        SizedBox(width: w * 0.03),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text("${type[index]}",
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20)),
                          ],
                        ),
                        const Spacer(),
                        const Icon(Icons.arrow_forward_ios_rounded)
                      ],
                    ),
                    SizedBox(height: h * 0.02),
                    const Divider(),
                    SizedBox(height: h * 0.02),
                  ],
                ),
              ),
            )),
            SizedBox(height: h * 0.23),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Row(
                children: [
                  const Text(
                    "Log Out",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  const Spacer(),
                  IconButton(onPressed: () {}, icon: const Icon(Icons.logout)),
                ],
              ),
            )
          ],
        ),
      ),
      body: size.width < 510
          ? const MobileView()
          : size.width > 510 && size.width < 1024
              ? const TabletView()
              : const DesktopView(),
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
      padding: const EdgeInsets.only(left: 40, right: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Center",
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          Container(
            // height: height * 0.2,
            // width: width * 0.9,
            height: h * 0.21,
            width: w * 0.7,
            decoration: BoxDecoration(
                color: Colors.blue, borderRadius: BorderRadius.circular(10)),
            child: Padding(
              padding: const EdgeInsets.only(top: 15, right: 30),
              child: Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Text(
                          "Dareen Admas",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 20),
                        ),
                        SizedBox(width: w * 0.04),
                        const Icon(Icons.edit, color: Colors.white)
                      ],
                    ),
                    const Text("A trendsetter",
                        style: TextStyle(color: Colors.white60, fontSize: 15)),
                    SizedBox(height: h * 0.035),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Text("846",
                                style: TextStyle(
                                    fontSize: 16, color: Colors.white)),
                            Text("Collect",
                                style: TextStyle(
                                    color: Colors.white60, fontSize: 12))
                          ],
                        ),
                        Column(
                          children: [
                            Text("51",
                                style: TextStyle(
                                    fontSize: 16, color: Colors.white)),
                            Text("Attention",
                                style: TextStyle(
                                    color: Colors.white60, fontSize: 12))
                          ],
                        ),
                        Column(
                          children: [
                            Text("267",
                                style: TextStyle(
                                    fontSize: 16, color: Colors.white)),
                            Text(
                              "Track",
                              style: TextStyle(
                                  color: Colors.white60, fontSize: 12),
                            )
                          ],
                        ),
                        Column(
                          children: [
                            Text("39",
                                style: TextStyle(
                                    fontSize: 16, color: Colors.white)),
                            Text(
                              "Coupons",
                              style: TextStyle(
                                  color: Colors.white60, fontSize: 12),
                            )
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: h * 0.02),
          Row(
            children: List.generate(
                4,
                (index) => Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const ResponsiveDetail(),
                                ));
                          },
                          child: Container(
                            height: h * 0.12,
                            width: w * 0.12,
                            margin: const EdgeInsets.only(left: 10, right: 10),
                            decoration: BoxDecoration(
                                color: Colors.grey.shade300,
                                shape: BoxShape.circle),
                            child: Icon(pic[index], size: 27),
                          ),
                        ),
                        Text("${name[index]}")
                      ],
                    )),
          ),
          SizedBox(height: h * 0.02),
          Column(
              children: List.generate(
            4,
            (index) => Container(
              height: h * 0.11,
              width: w * 0.7,
              margin: const EdgeInsets.only(top: 5),
              decoration: BoxDecoration(
                  color: Colors.white60,
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(10)),
              child: Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: Row(
                  children: [
                    Container(
                      height: h * 0.08,
                      width: w * 0.08,
                      decoration: BoxDecoration(
                          color: colo[index],
                          shape: BoxShape.circle,
                          border: Border.all(width: 2, color: Colors.black)),
                      child: Icon(
                        icn[index],
                        size: 20,
                      ),
                    ),
                    SizedBox(
                      width: w * 0.03,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          "${type[index]}",
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "${detail[index]}",
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.grey),
                        )
                      ],
                    ),
                    const Spacer(),
                    const Icon(Icons.arrow_forward_ios_rounded)
                  ],
                ),
              ),
            ),
          ))
        ],
      ),
    );
  }
}

class TabletView extends StatelessWidget {
  const TabletView({super.key});

  @override
  Widget build(BuildContext context) {
    // final size = MediaQuery.of(context).size;
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.only(left: 40, right: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Center",
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          Center(
            child: Container(
              // height: height * 0.2,
              // width: width * 0.9,
              height: h * 0.22,
              width: w * 0.41,
              decoration: BoxDecoration(
                  color: Colors.blue, borderRadius: BorderRadius.circular(10)),
              child: Padding(
                padding: const EdgeInsets.only(top: 15, right: 30),
                child: Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const Text(
                            "Dareen Admas",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: 20),
                          ),
                          SizedBox(width: w * 0.03),
                          const Icon(Icons.edit, color: Colors.white)
                        ],
                      ),
                      const Text("A trendsetter",
                          style:
                              TextStyle(color: Colors.white60, fontSize: 15)),
                      SizedBox(height: h * 0.035),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              Text("846",
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.white)),
                              Text("Collect",
                                  style: TextStyle(
                                      color: Colors.white60, fontSize: 12))
                            ],
                          ),
                          Column(
                            children: [
                              Text("51",
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.white)),
                              Text("Attention",
                                  style: TextStyle(
                                      color: Colors.white60, fontSize: 12))
                            ],
                          ),
                          Column(
                            children: [
                              Text("267",
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.white)),
                              Text(
                                "Track",
                                style: TextStyle(
                                    color: Colors.white60, fontSize: 12),
                              )
                            ],
                          ),
                          Column(
                            children: [
                              Text("39",
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.white)),
                              Text(
                                "Coupons",
                                style: TextStyle(
                                    color: Colors.white60, fontSize: 12),
                              )
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: h * 0.02),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
                4,
                (index) => Column(
                      children: [
                        Container(
                          height: h * 0.12,
                          width: w * 0.12,
                          margin: const EdgeInsets.only(left: 10, right: 10),
                          decoration: BoxDecoration(
                              color: Colors.grey.shade300,
                              shape: BoxShape.circle),
                          child: Icon(pic[index], size: 27),
                        ),
                        Text("${name[index]}")
                      ],
                    )),
          ),
          SizedBox(height: h * 0.02),
          Column(
              children: List.generate(
            4,
            (index) => Container(
              height: h * 0.11,
              width: w * 0.7,
              margin: const EdgeInsets.only(top: 5),
              decoration: BoxDecoration(
                  color: Colors.grey.shade400,
                  borderRadius: BorderRadius.circular(10)),
              child: Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: Row(
                  children: [
                    Container(
                      height: h * 0.10,
                      width: w * 0.10,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(width: 2, color: Colors.black)),
                      child: Icon(icn[index]),
                    ),
                    SizedBox(
                      width: w * 0.03,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          "${type[index]}",
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "${detail[index]}",
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.white),
                        )
                      ],
                    ),
                    const Spacer(),
                    const Icon(Icons.arrow_forward_ios_rounded)
                  ],
                ),
              ),
            ),
          ))
        ],
      ),
    );
  }
}

class DesktopView extends StatelessWidget {
  const DesktopView({super.key});

  @override
  Widget build(BuildContext context) {
    //final size = MediaQuery.of(context).size;
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;




    return Padding(
      padding: const EdgeInsets.only(left: 40, right: 15),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // const Text(
            //   "Center",
            //   style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            // ),
            const SizedBox(height: 10),

            Row(
              children: [
                IconButton(
                    onPressed: () {
                      Scaffold.of(context).openDrawer();
                    },
                    icon: const Icon(Icons.menu)),
                Container(
                  color: Colors.transparent,
                  height: h * 0.07,
                  width: w * 0.9,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: List.generate(
                      4,
                      (index) => Tooltip(decoration: BoxDecoration(color: Colors.grey,borderRadius: BorderRadius.circular(5)),
                        message: "This is ${name[index]}",
                        child: Text("${name[index]}",style: const TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                      )
                    ),
                  ),
                ),
              ],
            ),
            //SizedBox(height: h * 0.05),
            Column(
              children: List.generate(
                  5,
                  (index) => Row(
                        children: [
                          OnHoverButton(
                            child: Container(
                              height: h * 0.35,
                              width: w * 0.25,
                              margin: const EdgeInsets.only(top: 30,bottom: 40),
                              decoration: BoxDecoration(
                                  color: Colors.grey,
                                  image: DecorationImage(
                                      image: AssetImage("${ing[index]}"),
                                     fit: BoxFit.fill
                                    //fit: BoxFit.cover
                                  ),
                                  borderRadius: BorderRadius.circular(10)),
                            ),
                          ),
                          SizedBox(width: w * 0.03),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              OnHoverButton(
                                child: Text("${city[index]}",
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 22)),
                              ),
                              SizedBox(height: h * 0.02),
                              Text("${info[index]}"),
                            ],
                          )
                        ],
                      )),
            )
          ],
        ),
      ),
    );
  }
}

class OnHoverButton extends StatefulWidget {
  const OnHoverButton({super.key, required this.child});
  final Widget child;

  @override
  State<OnHoverButton> createState() => _OnHoverButtonState();
}

class _OnHoverButtonState extends State<OnHoverButton> {
  bool isHovered = false;
  @override
  Widget build(BuildContext context) {
    final hoveredTransform = Matrix4.identity()..scale(1.1);
    final transform = isHovered ? hoveredTransform : Matrix4.identity();
    return MouseRegion(
      onEnter: (event) => onEnter(true),
      onExit: (event) => onExit(false),
      child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          transform: transform,
          child: widget.child),
    );
  }

  void onEnter(bool isHovered) => setState(() {
        this.isHovered = isHovered;
      });
  void onExit(bool isHovered) => setState(() {
        this.isHovered = isHovered;
      });
}
