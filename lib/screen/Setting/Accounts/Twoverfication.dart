import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:whatsapp/Components/CommonBtn.dart';
import 'package:whatsapp/constants/Appcolors.dart';
import 'package:whatsapp/constants/TextTheme.dart';
import 'package:whatsapp/constants/icon_image.dart';

class twoVerfication extends StatelessWidget {
  const twoVerfication({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Appcolors.white,
        backgroundColor: Appcolors.darkgreen,
        title: Text("Two-step verification"),
      ),
      body: Padding(
        padding:
            const EdgeInsets.only(left: 15, right: 15, top: 12, bottom: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Image.asset(AppImage.twostepVerfication),
                Gap(20.h),
                Text(
                    "For added security, enable two-step verification, which will require a PIN when registering your phone number with WhatsApp again.",
                    style: AppTextTheme.fs13Normal()
                        .copyWith(color: Appcolors.grey),
                    textAlign: TextAlign.center)
              ],
            ),
            CommonBtn(title: "ENABLE", onPressed: () {}),
          ],
        ),
      ),
    );
  }
}
