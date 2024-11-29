import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:whatsapp/Components/CommonBtn.dart';
import 'package:whatsapp/constants/Appcolors.dart';
import 'package:whatsapp/constants/TextTheme.dart';

class deleteaccount extends StatelessWidget {
  const deleteaccount({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          foregroundColor: Appcolors.white,
          backgroundColor: Appcolors.darkgreen,
          title: Text("Delete my account"),
        ),
        body: SingleChildScrollView(
            child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(children: [
                        Icon(
                          Icons.warning_rounded,
                          color: Appcolors.Red,
                        ),
                        Gap(8.w),
                        Text(
                          "Deleting your account will:",
                          style: AppTextTheme.fs14Normal()
                              .copyWith(color: Appcolors.Red),
                        )
                      ]),
                      Gap(5),
                      Padding(
                        padding: const EdgeInsets.only(left: 28),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text.rich(TextSpan(children: [
                              TextSpan(
                                  text: "• ",
                                  style: AppTextTheme.fs13Normal()
                                      .copyWith(color: Color(0xffE3BEBE))),
                              TextSpan(
                                  text: "Delete your account from WhatsApp ",
                                  style: AppTextTheme.fs13Normal()
                                      .copyWith(color: Appcolors.grey))
                            ])),
                            Text.rich(TextSpan(children: [
                              TextSpan(
                                  text: "• ",
                                  style: AppTextTheme.fs13Normal()
                                      .copyWith(color: Color(0xffE3BEBE))),
                              TextSpan(
                                  text: "Erase your message history",
                                  style: AppTextTheme.fs13Normal()
                                      .copyWith(color: Appcolors.grey))
                            ])),
                            Text.rich(TextSpan(children: [
                              TextSpan(
                                  text: "• ",
                                  style: AppTextTheme.fs13Normal()
                                      .copyWith(color: Color(0xffE3BEBE))),
                              TextSpan(
                                  text:
                                      "Delete you from all of your WhatsApp groups",
                                  style: AppTextTheme.fs13Normal()
                                      .copyWith(color: Appcolors.grey))
                            ])),
                            Text.rich(TextSpan(children: [
                              TextSpan(
                                  text: "• ",
                                  style: AppTextTheme.fs13Normal()
                                      .copyWith(color: Color(0xffE3BEBE))),
                              TextSpan(
                                  text:
                                      "Delete your payments history and cancel any pending payments",
                                  style: AppTextTheme.fs13Normal()
                                      .copyWith(color: Appcolors.grey))
                            ])),
                            Divider(height: 40),
                          ],
                        ),
                      ),
                      Row(children: [
                        Icon(Icons.logout_outlined),
                        Gap(5.w),
                        Text("Change number instead?",
                            style: AppTextTheme.fs14Normal())
                      ]),
                      Padding(
                        padding: const EdgeInsets.only(left: 35),
                        child:
                            CommonBtn(title: "CHANGE NUMBER", onPressed: () {}),
                      ),
                      Divider(height: 40),
                      Padding(
                          padding: const EdgeInsets.only(left: 30),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "To delete your account, confirm your country code and enter your phone number.",
                                  style: AppTextTheme.fs14Normal(),
                                ),
                                Gap(10.h),
                                Text("Country",
                                    style: AppTextTheme.fs10Normal()
                                        .copyWith(color: Appcolors.grey)),
                                Gap(10.h),
                                Text("Phone",
                                    style: AppTextTheme.fs10Normal()
                                        .copyWith(color: Appcolors.grey)),
                                IntlPhoneField(
                                  decoration: InputDecoration(
                                      disabledBorder: OutlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Appcolors.grey),
                                          borderRadius:
                                              BorderRadius.circular(20))),
                                ),
                                CommonBtn(
                                    title: "DELETE MY ACCOUNT",
                                    backgroundcol: Appcolors.Red,
                                    onPressed: () {})
                              ]))
                    ]))));
  }
}
