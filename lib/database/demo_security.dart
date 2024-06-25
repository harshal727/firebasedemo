import 'package:flutter/material.dart';

class Privacy extends StatelessWidget {
  const Privacy({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.green,
          title: const Text(
            'Privacy Policy',
            style: TextStyle(
              fontSize: 23,
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: SingleChildScrollView(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20,
              ),
              const Text(
                "1. Security",
                style: TextStyle(fontSize: 21, fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: height * 0.01,
              ),
              const Text(
                "Personal Information will be kept confidential and we do not disclose the information except that in case you have specifically made an enquiry . Further, the manager who are listed with us, may call you, based on the query or enquiry that you make with us, enquiring about any Service they might offer. We give you the ability to edit your account information and preferences at any time, including whether you want us to contact you regarding any services. To protect your privacy and security, we will also take reasonable steps to verify your identity before granting access or making corrections.",
                style: TextStyle(fontSize: 15),
              ),
              SizedBox(
                height: height * 0.068,
              ),
              const Text(
                "2. Control Of Your Password",
                style: TextStyle(fontSize: 21, fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: height * 0.01,
              ),
              const Text(
                "You are responsible for all actions taken with your login information and password, including payments. Therefore we do not recommend that you disclose your account password or login information to any third parties. If you lose control of your password, you may lose substantial control over your personally identifiable information and may be subject to legally binding actions taken on your behalf. Therefore, if your password has been compromised for any reason, you should immediately change your password",
                style: TextStyle(fontSize: 15),
              ),
              SizedBox(
                height: height * 0.068,
              ),
              // Text(
              //   "3. Content On The Site",
              //   style: TextStyle(fontSize: 21, fontWeight: FontWeight.w500),
              // ),
              // SizedBox(
              //   height: height * 0.01,
              // ),
              // Text(
              //     "Wedbest.com features some of the latest trends in Indian weddings around the world, and tries to give its users exposure to quality hand-picked content. In our endeavor, we feature pictures and stories from various real weddings and vendors. Vendors are expected to take utmost care to take permission / hold copyright of images given to us. We also feature weddings and articles where users have given us permission to use the sameHowever, in the unlikely event of anyone having any objection to content put up on our site, they are free to contact us immediately and we ll be happy to consider their request and take necessary action"),
              // SizedBox(
              //   height: 50,
              // ),
            ],
          )),
        ));
  }
}
