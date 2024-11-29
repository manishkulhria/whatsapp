import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';
import 'package:whatsapp/Components/CommonBtn.dart';
import 'package:whatsapp/constants/Appcolors.dart';
import 'package:whatsapp/constants/TextTheme.dart';
import 'package:whatsapp/resources/utils/routes/routename.dart';

// ignore: must_be_immutable
class OtpView extends StatefulWidget {
  String verificationId;
  OtpView({super.key, required this.verificationId});

  @override
  State<OtpView> createState() => _OtpViewState();
}

class _OtpViewState extends State<OtpView> {
  // var otp = "";

  TextEditingController _otpcontroller = TextEditingController();
  int time = 60;
  @override
  void initState() {
    timedata();
    super.initState();
  }

  // ignore: unused_element
  // _signup() async {
  //   PhoneAuthCredential credential = PhoneAuthProvider.credential(
  //       verificationId: widget.verificationId, smsCode: otp);
  //   try {
  //     await FirebaseAuth.instance
  //         .signInWithCredential(credential)
  //         .then((value) => Get.offAll(RouteName.HomePage));
  //   } catch (e) {
  //     Get.snackbar("Error", e.toString());
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CommonBtn(
                backgroundcol: Appcolors.black,
                textcol: Appcolors.white,
                title: "Verify",
                minimumSize: true,
                onPressed: () async {
                  try {
                    final credential = PhoneAuthProvider.credential(
                        verificationId: widget.verificationId,
                        smsCode: _otpcontroller.text.toString());
                    await FirebaseAuth.instance
                        .signInWithCredential(credential)
                        .then((v) {
                      Get.toNamed(RouteName.HomePage);
                    });
                  } catch (e) {
                    print(e.toString());
                  }
                  // showDialog(
                  //     context: context,
                  //     builder: (context) => Dialog(
                  //           child: Container(
                  //             height: 80,
                  //             width: 30,
                  //             child: SpinKitRing(
                  //               color: Appcolors.Lightgreen,
                  //             ),
                  //           ),
                  //         ));
                  // Future.delayed(Duration(seconds: 1),
                  //     () => Navigator.pushNamed(context, RouteName.HomePage));
                }),
          ],
        ),
      ),
      appBar: AppBar(
        title: Text("Enter OTP Code"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Code has been send to +91 11******44",
                style: AppTextTheme.fs13Normal(),
              ),
              Gap(20),
              Pinput(
                controller: _otpcontroller,
                length: 6,
                focusedPinTheme: PinTheme(
                    width: 72,
                    height: 52,
                    decoration: BoxDecoration(
                        color: Appcolors.white,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Appcolors.black))),
                defaultPinTheme: PinTheme(
                  width: 72,
                  height: 52,
                  decoration: BoxDecoration(
                      color: Appcolors.white,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Appcolors.black)),
                ),
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
              ),
              Gap(25),
              Text.rich(TextSpan(children: [
                TextSpan(
                  text: "Resend Code in ",
                  style: AppTextTheme.fs13Normal(),
                ),
                TextSpan(
                  text: "$time",
                  style:
                      AppTextTheme.fs13Normal().copyWith(color: Appcolors.blue),
                ),
                TextSpan(
                  text: " s",
                  style: AppTextTheme.fs13Normal(),
                ),
              ]))
            ],
          ),
        ),
      ),
    );
  }

  timedata() {
    Timer.periodic(Duration(seconds: 1), (timer) {
      if (time > 0) {
        time = time - 1;
        setState(() {});
      } else {
        timer.cancel();
      }
    });
  }
}
