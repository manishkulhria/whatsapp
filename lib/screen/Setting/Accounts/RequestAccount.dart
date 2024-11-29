import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:whatsapp/Components/CommonBtn.dart';
import 'package:whatsapp/constants/Appcolors.dart';
import 'package:whatsapp/constants/TextTheme.dart';
import 'package:whatsapp/constants/icon_image.dart';

class RequestAccountinfo extends StatelessWidget {
  const RequestAccountinfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          foregroundColor: Appcolors.white,
          backgroundColor: Appcolors.darkgreen,
          title: Text("Request account info"),
        ),
        body: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(children: [
                    Image.asset(AppImage.RequestAcccoutimg),
                    Gap(20.h),
                    Text.rich(TextSpan(children: [
                      TextSpan(
                          text:
                              "Create a report of your WhatsApp account information and settings, which you can access or port to another app. This report does not include your messages.",
                          style: AppTextTheme.fs13Normal()),
                      TextSpan(
                          text: " Learn more",
                          style: AppTextTheme.fs13Normal()
                              .copyWith(color: Appcolors.blue))
                    ])),
                    Gap(20),
                    Divider(),
                    ListTile(
                        leading:
                            Icon(Icons.document_scanner, color: Appcolors.grey),
                        title: Text("Request report",
                            style: AppTextTheme.fs14Normal())),
                    Divider(),
                  ]),
                  CommonBtn(title: "NEXT", onPressed: () {}),
                ])));
  }
}
