import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:whatsapp/Components/CommonBtn.dart';
import 'package:whatsapp/constants/Appcolors.dart';
import 'package:whatsapp/constants/TextTheme.dart';
import 'package:whatsapp/constants/icon_image.dart';
import 'package:whatsapp/resources/utils/routes/routename.dart';

class WelcomeView extends StatelessWidget {
  const WelcomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Gap(40),
                  Text(
                    "Welcome to WhatsApp",
                    style: AppTextTheme.fs28semibold(),
                  ),
                  Gap(40.h),
                  Image.asset(AppImage.welcomeimg),
                  Gap(40.h),
                  Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                            text: "Read our", style: AppTextTheme.fs13Normal()),
                        TextSpan(
                            text: " Privacy Policy. ",
                            style: AppTextTheme.fs13Normal()
                                .copyWith(color: Appcolors.blue)),
                        TextSpan(
                            text: "Tap “Agree and continue” to accept the ",
                            style: AppTextTheme.fs13Normal()),
                        TextSpan(
                            text: "Teams of Service.",
                            style: AppTextTheme.fs13Normal()
                                .copyWith(color: Appcolors.blue))
                      ],
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Gap(25.h),
                  CommonBtn(
                      minimumSize: true,
                      title: "AGREE AND CONTINUE",
                      onPressed: () {
                        Navigator.pushNamed(context, RouteName.Loginview);
                      }),
                ],
              ),
              Column(
                children: [
                  Text(
                    "from",
                    style: AppTextTheme.fs12Normal()
                        .copyWith(color: Appcolors.grey),
                  ),
                  Text(
                    "FACEBOOK",
                    style: AppTextTheme.fs15Normal(),
                  )
                ],
              ),
              Gap(2)
            ],
          ),
        ),
      ),
    );
  }
}
