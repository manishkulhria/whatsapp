import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:whatsapp/Components/RadioRowfun.dart';
import 'package:whatsapp/constants/Appcolors.dart';
import 'package:whatsapp/constants/TextTheme.dart';
import 'package:whatsapp/controller/Theme/themecontroller.dart';
import 'package:whatsapp/controller/themecontroller.dart';
import 'package:whatsapp/resources/utils/routes/routename.dart';
import 'package:whatsapp/screen/Setting/Profilechat/themechange.dart';

class ChatViewProfile extends StatefulWidget {
  const ChatViewProfile({super.key});

  @override
  State<ChatViewProfile> createState() => _ChatViewProfileState();
}

class _ChatViewProfileState extends State<ChatViewProfile> {
  bool sendvalue = false;
  bool sizesmall = false;
  bool visibilityvalue = true;
  var theme;
  @override
  Widget build(BuildContext context) {
    final themecontroller = Get.find<Themecontroller>();
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Appcolors.darkgreen,
            foregroundColor: Appcolors.white,
            title: Text("Chats")),
        body: SingleChildScrollView(
            child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Gap(8.h),
                      Text("Display",
                          style: AppTextTheme.fs12Normal()
                              .copyWith(color: Appcolors.grey)),
                      // Obx(
                      //   () => Switch(
                      //     value: themecontroller.isDarkMode.value,
                      //     onChanged: (value) {
                      //       themecontroller.Darktheme();
                      //     },
                      //   ),
                      // ),
                      // Obx(
                      //   () =>
                      //      RadioListTile(
                      //                   title: Text("System default"),
                      //                   value: themecontroller.isDarkMode.value,
                      //                   groupValue: themeprovider.themedata,
                      //                   onChanged: (ThemeMode? value) {
                      //                     themeprovider.setthemedata(value!);
                      //                      Get.back(); // Close the dialog
                      //                   },
                      //                 ),
                      // ),
                      ListTile(
                        onTap: () {
                          Get.to(Changetheme());
                          // showDialog(
                          //     context: context,
                          //     builder: (context) {
                          //       return AlertDialog(
                          //           title: Column(
                          //               crossAxisAlignment:
                          //                   CrossAxisAlignment.start,
                          //               children: [
                          //             Text("Choose theme"),

                          //             // RadioListTile<ThemeMode>(
                          //             //     title: Text("Light"),
                          //             //     value: ThemeMode.light,
                          //             //     groupValue: themeprovider.themedata,
                          //             //     onChanged: (ThemeMode? value) {
                          //             //       themeprovider.setthemedata(value!);
                          //             //        Get.back();
                          //             //     }),
                          //             // RadioListTile<ThemeMode>(
                          //             //     title: Text("Dark"),
                          //             //     value: ThemeMode.dark,
                          //             //     groupValue: themeprovider.themedata,
                          //             //     onChanged: (ThemeMode? value) {
                          //             //       themeprovider.setthemedata(value!);
                          //             //        Get.back();
                          //             //     })
                          //           ]));
                          //     });
                        },
                        leading:
                            Icon(Icons.brightness_6, color: Appcolors.grey),
                        title: Text("Theme", style: AppTextTheme.fs15medium()),
                        subtitle: Text("Light",
                            style: AppTextTheme.fs12Normal()
                                .copyWith(color: Appcolors.grey)),
                      ),
                      ListTile(
                          leading:
                              Icon(Icons.image_outlined, color: Appcolors.grey),
                          title: Text("Wallpaper",
                              style: AppTextTheme.fs15medium())),
                      Divider(),
                      Gap(8.h),
                      Text("Chat settings",
                          style: AppTextTheme.fs12Normal()
                              .copyWith(color: Appcolors.grey)),
                      Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Column(children: [
                            ListTile(
                                trailing: Switch.adaptive(
                                    trackOutlineColor:
                                        // ignore: deprecated_member_use
                                        MaterialStatePropertyAll(
                                            Colors.transparent),
                                    activeTrackColor: Appcolors.Lightgreen,
                                    value: sendvalue,
                                    onChanged: (value) => setState(() {
                                          sendvalue = value;
                                        })),
                                title: Text("Enter is send",
                                    style: AppTextTheme.fs15medium()),
                                subtitle: Text(
                                    "Enter key will send your message",
                                    style: AppTextTheme.fs12Normal()
                                        .copyWith(color: Appcolors.grey))),
                            ListTile(
                                trailing: Switch.adaptive(
                                    trackOutlineColor:
                                        // ignore: deprecated_member_use
                                        MaterialStatePropertyAll(
                                            Colors.transparent),
                                    activeTrackColor: Appcolors.Lightgreen,
                                    value: visibilityvalue,
                                    onChanged: (value) => setState(() {
                                          visibilityvalue = value;
                                        })),
                                title: Text("Media visibility",
                                    style: AppTextTheme.fs15medium()),
                                subtitle: Text(
                                    "Show newly downloaded media in your phone’s gallery",
                                    style: AppTextTheme.fs12Normal()
                                        .copyWith(color: Appcolors.grey))),
                            ListTile(
                                onTap: () {
                                  showDialog(
                                      context: context,
                                      builder: (context) {
                                        return StatefulBuilder(
                                            builder: (context, restate) {
                                          return AlertDialog(
                                              title: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                Text("Font size",
                                                    style: AppTextTheme
                                                        .fs18Normal()),
                                                RadioRow(
                                                    radiovalue: theme,
                                                    tittle: "Small",
                                                    ontap: (v) => restate(
                                                        () => theme = v)),
                                                RadioRow(
                                                    radiovalue: theme,
                                                    tittle: "Medium",
                                                    ontap: (v) => restate(
                                                        () => theme = v)),
                                                RadioRow(
                                                    radiovalue: theme,
                                                    tittle: "Large",
                                                    ontap: (v) => restate(
                                                        () => theme = v))
                                              ]));
                                        });
                                      });
                                },
                                title: Text("Font size",
                                    style: AppTextTheme.fs15medium()),
                                subtitle: Text("Medium",
                                    style: AppTextTheme.fs12Normal()
                                        .copyWith(color: Appcolors.grey)))
                          ])),
                      Divider(),
                      ListTile(
                          onTap: () {
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return StatefulBuilder(
                                      builder: (context, restate) {
                                    return AlertDialog(
                                        title: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                          Text("App Language",
                                              style: AppTextTheme.fs18Normal()),
                                          RadioRow(
                                              radiovalue: theme,
                                              tittle:
                                                  "Phone’s language (English)",
                                              ontap: (v) =>
                                                  restate(() => theme = v)),
                                          RadioRow(
                                              radiovalue: theme,
                                              tittle: "Lorem Ipsum",
                                              ontap: (v) =>
                                                  restate(() => theme = v)),
                                          RadioRow(
                                              radiovalue: theme,
                                              tittle: "বাংলা",
                                              ontap: (v) =>
                                                  restate(() => theme = v))
                                        ]));
                                  });
                                });
                          },
                          leading: Icon(Icons.language, color: Appcolors.grey),
                          title: Text("App Language",
                              style: AppTextTheme.fs15medium()),
                          subtitle: Text("Phone’s language (English)",
                              style: AppTextTheme.fs12Normal()
                                  .copyWith(color: Appcolors.grey))),
                      ListTile(
                          onTap: () {
                            Get.toNamed(RouteName.ChatBackup);
                          },
                          leading: Icon(Icons.backup, color: Appcolors.grey),
                          title: Text("Chat backup",
                              style: AppTextTheme.fs15medium())),
                      ListTile(
                          onTap: () {
                            Get.toNamed(RouteName.ChatHistory);
                          },
                          leading: Icon(Icons.history, color: Appcolors.grey),
                          title: Text("Chat history",
                              style: AppTextTheme.fs15medium()))
                    ]))));
  }
}
