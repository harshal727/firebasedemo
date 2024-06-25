import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sms_otp_auto_verify/sms_otp_auto_verify.dart';

class OtpVerifyScreen extends StatefulWidget {
  const OtpVerifyScreen(
      {Key? key,
      required this.verificationId,
      required this.mobile,
      required this.verifyId,
      required this.forceResendingToken})
      : super(key: key);
  final String verificationId;
  final String mobile;
  final String verifyId;
  final int forceResendingToken;

  @override
  State<OtpVerifyScreen> createState() => _OtpVerifyScreenState();
}

class _OtpVerifyScreenState extends State<OtpVerifyScreen> {
  String id = '';
  int tocken = 0;
  TextEditingController otp = TextEditingController();
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  int second = 30;
  @override
  void initState() {
    time();
    super.initState();
  }

  void time() {
    Timer.periodic(const Duration(seconds: 1), (timer) {
      second--;
      if (second == 0) {
        timer.cancel();
      }
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Otp sent for this number:-${widget.mobile}"),
          const SizedBox(height: 50),
          //
          TextFieldPin(
              textController: otp,
              autoFocus: true,
              codeLength: 6,
              alignment: MainAxisAlignment.center,
              defaultBoxSize: 40.0,
              margin: 8,
              selectedBoxSize: 40.0,
              textStyle: const TextStyle(fontSize: 16),
              onChange: (code) {}),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Resent otp in"),
              const SizedBox(width: 5),
              Text(
                "$second",
                style: const TextStyle(color: Colors.pinkAccent),
              ),
              const SizedBox(width: 5),
              const Text("second"),
            ],
          ),

          const SizedBox(height: 50),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // InkResponse(
              //   onTap: () async {
              //     PhoneAuthCredential credential = PhoneAuthProvider.credential(
              //         verificationId: widget.verificationId, smsCode: otp.text);
              //     UserCredential user =
              //         await firebaseAuth.signInWithCredential(credential);
              //     print("Uid :- ${user.user!.uid}");
              //     print("Mobile :- ${user.user!.phoneNumber}");
              //   },
              //   child: Container(
              //     height: 40,
              //     width: 75,
              //     decoration: BoxDecoration(
              //         color: Colors.grey.shade300,
              //         borderRadius: BorderRadius.circular(20)),
              //     child: Center(child: Text("Verify")),
              //   ),
              // ),
              // const SizedBox(width: 10),
              InkResponse(
                onTap: () async {
                  PhoneAuthCredential credential = PhoneAuthProvider.credential(
                      verificationId: widget.verificationId, smsCode: otp.text);
                  UserCredential user =
                      await firebaseAuth.signInWithCredential(credential);
                  print("Uid :- ${user.user!.uid}");
                  print("Mobile :- ${user.user!.phoneNumber}");
                },
                child: Container(
                  height: 40,
                  width: 75,
                  decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      borderRadius: BorderRadius.circular(20)),
                  child: const Center(child: Text("Verify")),
                ),
              ),
              second == 0
                  ? InkResponse(
                      onTap: () async {
                        await firebaseAuth.verifyPhoneNumber(
                            phoneNumber: widget.mobile,
                            verificationCompleted: (phoneAuthCredential) {
                              print("Done");
                            },
                            verificationFailed: (error) {
                              print("Error");
                            },
                            codeSent: (verificationId, forceResendingToken) {
                              id = verificationId;
                              tocken = forceResendingToken!;
                              setState(() {});
                            },
                            codeAutoRetrievalTimeout: (verificationId) {
                              //id=verificationId;
                            },
                            forceResendingToken: tocken);
                        second = 30;
                        time();
                      },
                      child: Container(
                        height: 40,
                        width: 75,
                        decoration: BoxDecoration(
                            color: Colors.grey.shade300,
                            borderRadius: BorderRadius.circular(20)),
                        child: const Center(child: Text("Resend")),
                      ),
                    )
                  : const SizedBox(),

              // select
              //      ? const SizedBox()
              //      :
            ],
          ),
          const SizedBox(height: 50),
        ],
      ),
    );
  }
}
