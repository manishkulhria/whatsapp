import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:whatsapp/constants/Appcolors.dart';
import 'package:whatsapp/constants/TextTheme.dart';

class Managestorage extends StatelessWidget {
  const Managestorage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Appcolors.darkgreen,
        foregroundColor: Appcolors.white,
        title: Text("Manage storage"),
      ),
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(children: [
          Gap(15),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text("3.1 MB",
                style: AppTextTheme.fs20Normal()
                    .copyWith(color: Appcolors.darkgreen)),
            Text("78 GB",
                style:
                    AppTextTheme.fs20Normal().copyWith(color: Appcolors.grey))
          ]),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text("Used",
                style:
                    AppTextTheme.fs12Normal().copyWith(color: Appcolors.grey)),
            Text("Free",
                style:
                    AppTextTheme.fs12Normal().copyWith(color: Appcolors.grey))
          ]),
          Gap(20),
          LinearProgressIndicator(
            minHeight: 6,
            borderRadius: BorderRadius.circular(10),
            backgroundColor: Appcolors.grey,
            color: Appcolors.Yellow,
          ),
          Gap(15),
          Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
            Text.rich(TextSpan(children: [
              TextSpan(
                  text: "🟢 ",
                  style: AppTextTheme.fs11Normal()
                      .copyWith(color: Appcolors.darkgreen)),
              TextSpan(
                  text: "WhatsApp Media",
                  style:
                      AppTextTheme.fs12Normal().copyWith(color: Appcolors.grey))
            ])),
            Text.rich(TextSpan(children: [
              TextSpan(text: "🟡", style: AppTextTheme.fs11Normal()),
              TextSpan(
                  text: " Apps and other items",
                  style:
                      AppTextTheme.fs12Normal().copyWith(color: Appcolors.grey))
            ]))
          ]),
          Divider(
            height: 40,
          ),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text("Chats",
                style:
                    AppTextTheme.fs12Normal().copyWith(color: Appcolors.grey)),
            IconButton(onPressed: () {}, icon: Icon(Icons.search))
          ])
        ]),
      )),
    );
  }
}
