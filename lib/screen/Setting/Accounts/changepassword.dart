import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:whatsapp/Components/CommonBtn.dart';
import 'package:whatsapp/constants/Appcolors.dart';
import 'package:whatsapp/constants/TextTheme.dart';
import 'package:whatsapp/constants/icon_image.dart';

class changepassword extends StatelessWidget {
  const changepassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Appcolors.white,
        backgroundColor: Appcolors.darkgreen,
        title: Text("Change number"),
      ),
      body: Padding(
        padding:
            const EdgeInsets.only(left: 15, right: 20, top: 12, bottom: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Image.asset(AppImage.changepassword),
                Gap(20.h),
                Text(
                    "Changing your phone number will migrate your account info, groups & settings.",
                    style: AppTextTheme.fs15medium(),
                    textAlign: TextAlign.start),
                Gap(20.h),
                Text(
                    "Before proceeding, please confirm that you are able to receive SMS or calls at your new number.",
                    style: AppTextTheme.fs13Normal()
                        .copyWith(color: Appcolors.grey),
                    textAlign: TextAlign.start),
                Gap(15.h),
                Text(
                    "If you have both a new phone & a new number, first change your number on your old phone.",
                    style: AppTextTheme.fs13Normal()
                        .copyWith(color: Appcolors.grey),
                    textAlign: TextAlign.start),
              ],
            ),
            CommonBtn(title: "NEXT", onPressed: () {}),
          ],
        ),
      ),
    );
  }
}
