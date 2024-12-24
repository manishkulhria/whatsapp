import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:whatsapp/controller/Theme/themecontroller.dart';
import 'package:whatsapp/screen/Setting/Profilechat/widget/switchAdaptivetile.dart';

class Changetheme extends StatefulWidget {
  const Changetheme({super.key});

  @override
  State<Changetheme> createState() => _ChangethemeState();
}

class _ChangethemeState extends State<Changetheme> {
  @override
  Widget build(BuildContext context) {
    final controller = Get.find<Themecontroller>();
    return Scaffold(
        appBar: AppBar(title: Text("Change theme")),
        body: ListView(children: [
          Gap(10),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Container(
                  child: Column(children: [
                ListView.separated(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, i) {
                      final theme = controller.theme[i];
                      return Obx(() => SwitchAdaptivetile(
                          value: controller.currenttheme == theme,
                          onChanged: (value) =>
                              controller.setcurrenttheme(theme),
                          title: theme.title.tr));
                    },
                    separatorBuilder: (context, i) {
                      return Padding(
                        padding: EdgeInsets.symmetric(vertical: 2),
                      );
                    },
                    itemCount: controller.theme.length)
              ])))
        ]));
  }
}
