import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:whatsapp/constants/Appcolors.dart';
import 'package:whatsapp/constants/TextTheme.dart';
import 'package:whatsapp/constants/icon_image.dart';
import 'package:whatsapp/resources/utils/routes/routename.dart';

class splashview extends StatefulWidget {
  const splashview({super.key});

  @override
  State<splashview> createState() => _splashviewState();
}

class _splashviewState extends State<splashview> {
  int index1 = 0;
  int index2 = 0;
  @override
  void initState() {
    super.initState();
    splash();
  }

  splash() async {
    await Future.delayed(Duration(seconds: 3), () => index1 = 1);
    setState(() {});
    await Future.delayed(Duration(seconds: 2), () => index2 = 2);
    setState(() {});
    Future.delayed(Duration(seconds: 3),
        () => Navigator.pushNamed(context, RouteName.WelcomeView));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          Image.asset(
            AppImage.splash,
            width: MediaQuery.of(context).size.width,
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        AppImage.whatsapplogo,
                        fit: BoxFit.cover,
                      ),
                      index1 == 1
                          ? Text(
                              "WhatsApp",
                              style: AppTextTheme.fs35Normal()
                                  .copyWith(color: Appcolors.black),
                            )
                          : SizedBox()
                    ],
                  ),
                ),
                index2 == 2
                    ? Column(
                        children: [
                          CircularProgressIndicator(color: Appcolors.darkgreen),
                          Text(
                            "Loading...",
                            style: AppTextTheme.fs15Normal()
                                .copyWith(color: Appcolors.Lightgreen),
                          )
                        ],
                      )
                    : index1 == 1
                        ? Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                "from",
                                style: AppTextTheme.fs12Normal()
                                    .copyWith(color: Appcolors.grey),
                              ),
                              Gap(5),
                              Text(
                                "FACEBOOK",
                                style: AppTextTheme.fs15Normal(),
                              )
                            ],
                          )
                        : SizedBox()
              ],
            ),
          ),
        ],
      ),
    );
  }
}
