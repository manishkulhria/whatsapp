import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:whatsapp/constants/Appcolors.dart';
import 'package:whatsapp/constants/TextTheme.dart';

class EixtAppDailog extends StatelessWidget {
  const EixtAppDailog({super.key});

  @override
  Widget build(BuildContext context) {
    ///-----------------Helpers-------------------------------

    return AlertDialog.adaptive(
      insetPadding: EdgeInsets.symmetric(horizontal: 40.w),
      content: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text("Confirm Exit",
              style: AppTextTheme.fs20Normal()
                  .copyWith(color: Appcolors.darkgreen)),
          Gap(10),
          Text("Are you sure you want to Exit",
              style: AppTextTheme.fs14Normal()),
          Gap(10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: TextButton(
                    style: TextButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)),
                      backgroundColor: Appcolors.white,
                      padding: EdgeInsets.symmetric(horizontal: 15)
                    ),
                    onPressed: () {
                      Get.back();
                    },
                    child: Text(
                      "Cancel",
                      style: AppTextTheme.fs14Normal()
                          .copyWith(color: Appcolors.black)
                    ))
              ),
              Gap(15),
              Expanded(
                child: TextButton(
                    style: TextButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)),
                      backgroundColor: Appcolors.darkgreen,
                      padding: EdgeInsets.symmetric(horizontal: 15)
                    ),
                    onPressed: () {
                       Get.back();
                    },
                    child: Text(
                      "Yes exit",
                      style: AppTextTheme.fs14Normal()
                          .copyWith(color: Appcolors.white)
                    ))
              )
            ]
          )
        ]
      )
    );
  }
}
