import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactUs extends StatefulWidget {
  const ContactUs({Key? key}) : super(key: key);

  @override
  State<ContactUs> createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUs> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: const Text(
          "Contact Us",
          style: TextStyle(fontSize: 23),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 25, right: 25, top: 40),
        child: Column(
          children: [
            InkWell(
              onTap: () {
                whatsapp();
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ContactUs()));
              },
              child: Container(
                height: height * 0.061,
                width: width * 3.51,
                decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.grey)),
                child: const Center(
                    child: Text(
                  "Whatsapp",
                  style: TextStyle(fontSize: 20, color: Colors.grey),
                )),
              ),
            ),
            const SizedBox(height: 25),
            InkWell(
              onTap: () {
                call();
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ContactUs()));
              },
              child: Container(
                height: height * 0.061,
                width: width * 3.51,
                decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.grey)),
                child: const Center(
                    child: Text(
                  "Call",
                  style: TextStyle(fontSize: 20, color: Colors.grey),
                )),
              ),
            ),
            const SizedBox(height: 25),
            InkWell(
              onTap: () {
                //launchUrl(Uri(scheme: 'tel',path: "9726432732"),mode: LaunchMode.externalApplication);
                email();
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ContactUs()));
              },
              child: Container(
                height: height * 0.061,
                width: width * 3.51,
                decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.grey)),
                child: const Center(
                    child: Text(
                  "Email",
                  style: TextStyle(fontSize: 20, color: Colors.grey),
                )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

whatsapp() async {
  var whatsapp = "+919173668327";
  final Uri whatsappurl = Uri.parse("whatsapp://send?phone=" + whatsapp);

  if (await launchUrl(whatsappurl)) {
    await launchUrl(whatsappurl);
  } else {
    print("no");
  }
}

call() async {
  final num = "+919173668327";
  final Uri number = Uri.parse('tel:' + num);
  launchUrl(number);

  //set the number here
}

email() async {
  final toemail = 'harshalkumbhani434@gmail.com';
  final subject = 'Enter your subject';
  final message = 'Enter your message';
  final Uri url = Uri.parse('mailto:$toemail?subject=$subject&body=$message');
  if (await launchUrl(url)) {
    await launchUrl(url);
  }
}
