import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:whatsapp/constants/Appcolors.dart';
import 'package:whatsapp/constants/TextTheme.dart';

class StarrehView extends StatelessWidget {
  const StarrehView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            foregroundColor: Appcolors.white,
            backgroundColor: Appcolors.darkgreen,
            title: Text("Starred messages")),
        body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Center(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                  Container(
                      width: 140,
                      height: 140,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, color: Appcolors.darkgreen),
                      child:
                          Icon(Icons.star, color: Appcolors.white, size: 80)),
                  Gap(20),
                  Text(
                      "Tap and hold on any message in any chat to star it, so you   can easily find it later.",
                      style: AppTextTheme.fs13Normal(),
                      textAlign: TextAlign.center)
                ]))));
  }
}
