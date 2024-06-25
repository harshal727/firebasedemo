import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

import 'otpverify_screen.dart';

class SendOtpScrren extends StatefulWidget {
  const SendOtpScrren({Key? key}) : super(key: key);

  @override
  State<SendOtpScrren> createState() => _SendOtpScrrenState();
}

class _SendOtpScrrenState extends State<SendOtpScrren> {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  TextEditingController phone = TextEditingController();
  FocusNode focusNode = FocusNode();
  String all = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IntlPhoneField(
            controller: phone,
            focusNode: focusNode,
            decoration: InputDecoration(
              labelText: 'Phone Number',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: const BorderSide(),
              ),
            ),
            languageCode: "en",
            onChanged: (phone) {
              all = (phone.completeNumber);
              print("Country ${all}");
            },
            onCountryChanged: (country) {
              all = ('Country changed to: ' + country.dialCode);
              print("Country ${all}");
            },
          ),
          const SizedBox(height: 50),
          ElevatedButton(
              onPressed: () async {
                await firebaseAuth.verifyPhoneNumber(
                  phoneNumber: all,
                  verificationCompleted: (phoneAuthCredential) {
                    print("Done");
                  },
                  verificationFailed: (error) {
                    print("Error");
                  },
                  codeSent: (verificationId, forceResendingToken) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => OtpVerifyScreen(
                                  verificationId: verificationId,
                                  mobile: "${all}",
                                  verifyId: 'verificationId',
                                  forceResendingToken: forceResendingToken!,
                                )));
                  },
                  codeAutoRetrievalTimeout: (verificationId) {
                    print("TimeOut");
                  },
                );
              },
              child: const Text("Sent"))
        ],
      ),
    );
  }
}
