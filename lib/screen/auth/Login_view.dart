import 'package:country_picker/country_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:whatsapp/Components/CommonBtn.dart';
import 'package:whatsapp/constants/Appcolors.dart';
import 'package:whatsapp/constants/TextTheme.dart';
import 'package:whatsapp/resources/validators/app_validator.dart';
import 'package:whatsapp/screen/auth/Otpview.dart';

class Loginview extends StatefulWidget {
  const Loginview({super.key});

  @override
  State<Loginview> createState() => _LoginviewState();
}

class _LoginviewState extends State<Loginview> {
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();

  TextEditingController _phncontroller = TextEditingController();
  String data = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            automaticallyImplyLeading: false,
            centerTitle: true,
            title: Text("Enter your phone number",
                style: AppTextTheme.fs20Normal()
                    .copyWith(color: Appcolors.darkgreen)),
            actions: [
              IconButton(onPressed: () {}, icon: Icon(Icons.more_vert_rounded))
            ]),
        body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Form(
                key: _globalKey,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(children: [
                        Gap(20),
                        Text.rich(
                            TextSpan(children: [
                              TextSpan(
                                  text:
                                      "WhatsApp will need to verify your phone number.",
                                  style: AppTextTheme.fs13Normal()),
                              TextSpan(
                                  text: "What’s my number?",
                                  style: AppTextTheme.fs13Normal()
                                      .copyWith(color: Appcolors.blue))
                            ]),
                            textAlign: TextAlign.center),
                        TextButton(
                            onPressed: () {
                              showCountryPicker(
                                  context: context,
                                  showPhoneCode: true,
                                  searchAutofocus: false,
                                  onSelect: (value) {
                                    data = value.displayName;
                                  });
                            },
                            child: Text(data)),
                        IntlPhoneField(
                            keyboardType: TextInputType.phone,
                            validator: (v) => TextValidator()
                                .validator("Please Enter your Phone no."),
                            controller: _phncontroller,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Appcolors.grey),
                                    borderRadius: BorderRadius.circular(20)),
                                focusedBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Appcolors.darkgreen),
                                    borderRadius: BorderRadius.circular(20)))),
                        Text("Carrier charges may apply",
                            style: AppTextTheme.fs13Normal())
                      ]),
                      Column(children: [
                        CommonBtn(
                            minimumSize: true,
                            title: "Next",
                            onPressed: () async {
                              if (_globalKey.currentState!.validate()) {
                                final phoneNumber = _phncontroller.text.trim();

                                final fullPhoneNumber = "+1$phoneNumber";

                                if (phoneNumber.isEmpty ||
                                    phoneNumber.length < 10) {
                                  Get.snackbar("Invalid phone number",
                                      "Please enter a valid phone number.");
                                  return;
                                }
                                await FirebaseAuth.instance.verifyPhoneNumber(
                                  phoneNumber: fullPhoneNumber,
                                  verificationCompleted:
                                      (phoneAuthCredential) {},
                                  verificationFailed: (error) {
                                    print("--------");
                                    print(error.toString());
                                    print("--------");
                                    Get.snackbar(
                                        "Phone number", error.toString());
                                  },
                                  codeSent:
                                      (verificationid, forceResendingToken) {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => OtpView(
                                                verificationId:
                                                    verificationid)));
                                  },
                                  codeAutoRetrievalTimeout: (e) {},
                                );
                              }
                            }),
                        Gap(40)
                      ])
                    ]))));
  }
}
