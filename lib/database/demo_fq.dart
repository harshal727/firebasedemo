import 'package:flutter/material.dart';

class UFAQ extends StatefulWidget {
  const UFAQ({Key? key}) : super(key: key);

  @override
  State<UFAQ> createState() => _UFAQState();
}

class _UFAQState extends State<UFAQ> {
  bool isVisible = false;
  bool isVisible1 = false;
  bool isVisible2 = false;
  bool isVisible3 = false;
  bool isVisible4 = false;
  bool isVisible5 = false;
  bool isVisible6 = false;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        centerTitle: true,
        title: const Text(
          "FAQ",
          style: TextStyle(fontSize: 23),
        ),
      ),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 20, left: 20, top: 30),
            child: Container(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  children: [
                    Container(
                      height: height * 0.25,
                      width: width * 1,
                      decoration: BoxDecoration(
                          color: Colors.transparent,
                          border: Border.all(color: Colors.grey.shade400),
                          borderRadius: BorderRadius.circular(18)),
                      child: const Padding(
                        padding: EdgeInsets.only(top: 20, right: 15, left: 15),
                        child: Column(
                          children: [
                            Text(
                              "What is Hotel Booking?",
                              style: TextStyle(fontSize: 21),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Divider(
                              color: Colors.black,
                              height: 2,
                            ),
                            SizedBox(
                              height: 13,
                            ),
                            SizedBox(
                              height: 110,
                              width: double.infinity,
                              child: SingleChildScrollView(
                                child: Column(
                                  children: [
                                    Text(
                                        "Hotel booking is the process of securing a room at a hotel for a specific period of time. This typically involves choosing your destination, selecting your dates, and confirming the reservation.  Many hotels allow booking directly through their website, but there are also popular hotel booking apps that act as a middleman between you and the hotel.")
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      height: height * 0.07,
                      width: width * 1,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(color: Colors.grey.shade400),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 13, right: 13),
                        child: Row(
                          children: [
                            const Text(
                              "Can I book multiple rooms at once?",
                              style: TextStyle(fontSize: 16),
                            ),
                            const Spacer(),
                            GestureDetector(
                              child:
                                  const Icon(Icons.expand_circle_down_outlined),
                              onTap: () {
                                setState(() {
                                  isVisible = !isVisible;
                                });
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Visibility(
                        visible: isVisible,
                        child: Column(
                          children: [
                            Container(
                              height: height * 0.15,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  border:
                                      Border.all(color: Colors.grey.shade400),
                                  borderRadius: BorderRadius.circular(15)),
                              child: const Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 20),
                                child: SingleChildScrollView(
                                  child: Column(
                                    children: [
                                      Text(
                                          "Some hotels allow booking multiple rooms at once, but this may not be available for all properties.\nLook for the option during checkout or \ncontact the property directly if unsure.")
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        )),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      height: height * 0.07,
                      width: width * 1,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(color: Colors.grey.shade400),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 13, right: 13),
                        child: Row(
                          children: [
                            SizedBox(
                              height: height * 0.03,
                              width: width * 0.72,
                              child: const SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Text(
                                  "What payment methods do you accept?",
                                  style: TextStyle(fontSize: 17),
                                ),
                              ),
                            ),
                            const Spacer(),
                            GestureDetector(
                              child:
                                  const Icon(Icons.expand_circle_down_outlined),
                              onTap: () {
                                setState(() {
                                  isVisible1 = !isVisible1;
                                });
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Visibility(
                        visible: isVisible1,
                        child: Container(
                          height: height * 0.15,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey.shade400),
                              borderRadius: BorderRadius.circular(15)),
                          child: const Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 20, vertical: 20),
                            child: SingleChildScrollView(
                              child: Column(
                                children: [
                                  Text(
                                      "Most hotel booking apps accept major credit cards.  Some hotels may also offer alternative payment methods like debit cards or digital wallets.  This information will be displayed during the booking process.")
                                ],
                              ),
                            ),
                          ),
                        )),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      height: height * 0.07,
                      width: width * 1,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(color: Colors.grey.shade400),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 13, right: 13),
                        child: Row(
                          children: [
                            Container(
                              height: height * 0.03,
                              width: width * 0.72,
                              child: const SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Text(
                                  "Do I pay when I book or at the hotel?",
                                  style: TextStyle(fontSize: 17),
                                ),
                              ),
                            ),
                            const Spacer(),
                            GestureDetector(
                              child:
                                  const Icon(Icons.expand_circle_down_outlined),
                              onTap: () {
                                setState(() {
                                  isVisible3 = !isVisible3;
                                });
                              },
                            )
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Visibility(
                        visible: isVisible3,
                        child: Container(
                          height: height * 0.15,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey.shade400),
                              borderRadius: BorderRadius.circular(15)),
                          child: const Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 20, vertical: 20),
                            child: SingleChildScrollView(
                              child: Column(
                                children: [
                                  Text(
                                      "This depends on the hotel's policy and the specific rate you choose.  Some hotels require full payment upfront, while others only require a deposit.  The app will clearly show the payment terms before confirmation.")
                                ],
                              ),
                            ),
                          ),
                        )),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      height: height * 0.07,
                      width: width * 1,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(color: Colors.grey.shade400),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 13, right: 13),
                        child: Row(
                          children: [
                            SizedBox(
                              height: height * 0.03,
                              width: width * 0.72,
                              child: const SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Text(
                                  "Can I modify or cancel my reservation?",
                                  style: TextStyle(fontSize: 17),
                                ),
                              ),
                            ),
                            const Spacer(),
                            GestureDetector(
                              child:
                                  const Icon(Icons.expand_circle_down_outlined),
                              onTap: () {
                                setState(() {
                                  isVisible4 = !isVisible4;
                                });
                              },
                            )
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Visibility(
                        visible: isVisible4,
                        child: Container(
                          height: height * 0.15,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey.shade400),
                              borderRadius: BorderRadius.circular(15)),
                          child: const Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 20, vertical: 20),
                            child: SingleChildScrollView(
                              child: Column(
                                children: [
                                  Text(
                                      "Most reservations can be modified or cancelled, but there may be fees associated depending on the hotel's policy and how far in advance you cancel.  Always check the cancellation policy before booking."),
                                ],
                              ),
                            ),
                          ),
                        )),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      height: height * 0.07,
                      width: width * 1,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(color: Colors.grey.shade400),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 13, right: 13),
                        child: Row(
                          children: [
                            Container(
                              height: height * 0.03,
                              width: width * 0.72,
                              child: const SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Text(
                                  "How can I manage my bookings?",
                                  style: TextStyle(fontSize: 17),
                                ),
                              ),
                            ),
                            const Spacer(),
                            GestureDetector(
                              child:
                                  const Icon(Icons.expand_circle_down_outlined),
                              onTap: () {
                                setState(() {
                                  isVisible5 = !isVisible5;
                                });
                              },
                            )
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Visibility(
                        visible: isVisible5,
                        child: Container(
                          height: height * 0.15,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey.shade400),
                              borderRadius: BorderRadius.circular(15)),
                          child: const Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 20, vertical: 20),
                            child: SingleChildScrollView(
                              child: Column(
                                children: [
                                  Text(
                                      "Your account will typically house all your booking information.  You can access past reservations,  update upcoming stays, and potentially cancel if needed.")
                                ],
                              ),
                            ),
                          ),
                        )),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      height: height * 0.07,
                      width: width * 1,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(color: Colors.grey.shade400),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 13, right: 13),
                        child: Row(
                          children: [
                            SizedBox(
                              height: height * 0.03,
                              width: width * 0.72,
                              child: const SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Text(
                                  "Is my payment information secure?",
                                  style: TextStyle(fontSize: 17),
                                ),
                              ),
                            ),
                            const Spacer(),
                            GestureDetector(
                              child:
                                  const Icon(Icons.expand_circle_down_outlined),
                              onTap: () {
                                setState(() {
                                  isVisible6 = !isVisible6;
                                });
                              },
                            )
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Visibility(
                        visible: isVisible6,
                        child: Container(
                          height: height * 0.15,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey.shade400),
                              borderRadius: BorderRadius.circular(15)),
                          child: const Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 20, vertical: 20),
                            child: SingleChildScrollView(
                              child: Column(
                                children: [
                                  Text(
                                      "Reputable hotel booking apps use secure payment gateways to protect your information.  Look for indicators like https:// in the address bar and security icons during checkout.")
                                ],
                              ),
                            ),
                          ),
                        )),
                    const SizedBox(
                      height: 30,
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
