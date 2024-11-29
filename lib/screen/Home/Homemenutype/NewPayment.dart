import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:whatsapp/Components/CommonBtn.dart';
import 'package:whatsapp/constants/Appcolors.dart';
import 'package:whatsapp/constants/TextTheme.dart';
import 'package:whatsapp/constants/icon_image.dart';

class NewPayment extends StatelessWidget {
  const NewPayment({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(mainAxisSize: MainAxisSize.min, children: [
              CommonBtn(title: "CONTINUE", onPressed: () {}),
              Gap(15),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Image.asset(Appicon.Bhim),
                Image.asset(Appicon.upi)
              ]),
              Gap(10)
            ])),
        body: SafeArea(
            child: SingleChildScrollView(
                child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(children: [
                      Text("Payments", style: AppTextTheme.fs16Bold()),
                      Gap(20),
                      Image.asset(AppImage.NewPayment),
                      Gap(20),
                      Text(
                        "Send and recieve money securely, right where you chat",
                        style: AppTextTheme.fs18Normal(),
                        textAlign: TextAlign.center,
                      ),
                      Gap(20),
                      ListTile(
                        leading: Icon(Icons.group, color: Appcolors.darkgreen),
                        title: Text(
                            "Crores of people are already using payments on whatsApp.",
                            style: AppTextTheme.fs12Normal()),
                      )
                    ])))));
  }
}
