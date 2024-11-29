import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:whatsapp/constants/Appcolors.dart';
import 'package:whatsapp/constants/TextTheme.dart';
import 'package:whatsapp/constants/icon_image.dart';

class SecurityView extends StatefulWidget {
  const SecurityView({super.key});

  @override
  State<SecurityView> createState() => _SecurityViewState();
}

class _SecurityViewState extends State<SecurityView> {
  bool switchvalue = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          foregroundColor: Appcolors.white,
          backgroundColor: Appcolors.darkgreen,
          title: Text("Security"),
        ),
        body: SingleChildScrollView(
            child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Column(children: [
                  Gap(20.h),
                  Image.asset(AppImage.security),
                  Gap(20),
                  Text.rich(
                    TextSpan(children: [
                      TextSpan(
                          text:
                              "WhatsApp secures your conversations with end-to-end encryption. This means you messages, call and status updates stay between you and the people you choose. Not even whatsApp can read or listen to them.",
                          style: AppTextTheme.fs13Normal()),
                      TextSpan(
                          text: " Learn more",
                          style: AppTextTheme.fs13Normal()
                              .copyWith(color: Appcolors.blue))
                    ]),
                    textAlign: TextAlign.start,
                  ),
                  Gap(50.h),
                  Divider(),
                  Gap(20.h),
                  ListTile(
                    title: Text(
                      "Show security notifications",
                      style: AppTextTheme.fs13semibold(),
                    ),
                    subtitle: Text.rich(TextSpan(children: [
                      TextSpan(
                          text:
                              "Get notified when your security code changes for contact.",
                          style: AppTextTheme.fs11Normal()),
                      TextSpan(
                          text: " Learn more",
                          style: AppTextTheme.fs11Normal()
                              .copyWith(color: Appcolors.blue))
                    ])),
                    trailing: Switch.adaptive(
                      activeTrackColor: Appcolors.darkgreen,
                      value: switchvalue,
                      onChanged: (value) => setState(() {
                        switchvalue = value;
                      }),
                    ),
                  ),
                ]))));
  }
}
