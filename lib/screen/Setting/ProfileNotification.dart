import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whatsapp/Components/RadioRowfun.dart';
import 'package:whatsapp/constants/Appcolors.dart';
import 'package:whatsapp/constants/TextTheme.dart';

class ProfileNotification extends StatefulWidget {
  const ProfileNotification({super.key});

  @override
  State<ProfileNotification> createState() => _ProfileNotificationState();
}

class _ProfileNotificationState extends State<ProfileNotification> {
  String radionvalue = "";

  bool tones = true;
  bool highpriorify = true;
  bool grouphighpriorify = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Appcolors.darkgreen,
        foregroundColor: Appcolors.white,
        title: Text("Notifications"),
      ),
      body: SingleChildScrollView(
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              ListTile(
                  title: Text("Conversation tones",
                      style: AppTextTheme.fs13semibold()),
                  subtitle: Text(
                      "Play sounds for incoming and outgoing messages.",
                      style: AppTextTheme.fs11Normal()),
                  trailing: Switch.adaptive(
                      activeTrackColor: Appcolors.darkgreen,
                      value: tones,
                      onChanged: (value) => setState(() {
                            tones = value;
                          }))),
              Divider(),
              Text("Messages", style: AppTextTheme.fs12Normal()),
              ListTile(
                  title: Text("Notification tone",
                      style: AppTextTheme.fs13semibold()),
                  subtitle: Text("Default (WaterDrop_preview.ogg)",
                      style: AppTextTheme.fs11Normal())),
              ListTile(
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return StatefulBuilder(builder: (context, restate) {
                            return AlertDialog(
                                title: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                  Text("Vibrate",
                                      style: AppTextTheme.fs18Normal()),
                                  RadioRow(
                                      radiovalue: radionvalue,
                                      tittle: "Off",
                                      ontap: (v) =>
                                          restate(() => radionvalue = v)),
                                  RadioRow(
                                      radiovalue: radionvalue,
                                      tittle: "Default",
                                      ontap: (v) =>
                                          restate(() => radionvalue = v)),
                                  RadioRow(
                                      radiovalue: radionvalue,
                                      tittle: "Short",
                                      ontap: (v) =>
                                          restate(() => radionvalue = v)),
                                  RadioRow(
                                      radiovalue: radionvalue,
                                      tittle: "Long",
                                      ontap: (v) =>
                                          restate(() => radionvalue = v)),
                                ]));
                          });
                        });
                  },
                  title: Text("Vibrate", style: AppTextTheme.fs13semibold()),
                  subtitle: Text("Default", style: AppTextTheme.fs11Normal())),
              ListTile(
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                            backgroundColor: Appcolors.white,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.zero),
                            title: Text(
                              "Popup notifications are no longer avilable in your version of Android",
                              style: AppTextTheme.fs13Normal(),
                            ),
                            content: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  TextButton(
                                      onPressed: () {
                                         Get.back();
                                      },
                                      child: Text("LEARN MORE",
                                          style: AppTextTheme.fs13Normal()
                                              .copyWith(
                                                  color:
                                                      Appcolors.Lightgreen))),
                                  TextButton(
                                      onPressed: () {},
                                      child: Text("OK",
                                          style: AppTextTheme.fs13Normal()
                                              .copyWith(
                                                  color: Appcolors.Lightgreen)))
                                ])));
                  },
                  title: Text("Popup notification",
                      style: AppTextTheme.fs13semibold()),
                  subtitle:
                      Text("Not available", style: AppTextTheme.fs11Normal())),
              ListTile(
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return StatefulBuilder(builder: (context, restate) {
                            return AlertDialog(
                                title: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                  Text("Light",
                                      style: AppTextTheme.fs18Normal()),
                                  RadioRow(
                                      radiovalue: radionvalue,
                                      tittle: "None",
                                      ontap: (v) =>
                                          restate(() => radionvalue = v)),
                                  RadioRow(
                                      radiovalue: radionvalue,
                                      tittle: "White",
                                      ontap: (v) =>
                                          restate(() => radionvalue = v)),
                                  RadioRow(
                                      radiovalue: radionvalue,
                                      tittle: "Red",
                                      ontap: (v) =>
                                          restate(() => radionvalue = v)),
                                  RadioRow(
                                      radiovalue: radionvalue,
                                      tittle: "Yellow",
                                      ontap: (v) =>
                                          restate(() => radionvalue = v)),
                                  RadioRow(
                                      radiovalue: radionvalue,
                                      tittle: "Green",
                                      ontap: (v) =>
                                          restate(() => radionvalue = v)),
                                  RadioRow(
                                      radiovalue: radionvalue,
                                      tittle: "Cyan",
                                      ontap: (v) =>
                                          restate(() => radionvalue = v)),
                                  RadioRow(
                                      radiovalue: radionvalue,
                                      tittle: "Blue",
                                      ontap: (v) =>
                                          restate(() => radionvalue = v)),
                                  RadioRow(
                                      radiovalue: radionvalue,
                                      tittle: "Purple",
                                      ontap: (v) =>
                                          restate(() => radionvalue = v)),
                                ]));
                          });
                        });
                  },
                  title: Text("Light", style: AppTextTheme.fs13semibold()),
                  subtitle: Text("Green", style: AppTextTheme.fs11Normal())),
              ListTile(
                  title: Text("Use high priority notifications",
                      style: AppTextTheme.fs13semibold()),
                  subtitle: Text(
                      "Show previews of notifications at the top of the screen",
                      style: AppTextTheme.fs11Normal()),
                  trailing: Switch.adaptive(
                      activeTrackColor: Appcolors.darkgreen,
                      value: highpriorify,
                      onChanged: (value) => setState(() {
                            highpriorify = value;
                          }))),
              Divider(),
              Text("Groups", style: AppTextTheme.fs12Normal()),
              ListTile(
                  title: Text("Notification tone",
                      style: AppTextTheme.fs13semibold()),
                  subtitle: Text("Default (WaterDrop_preview.ogg)",
                      style: AppTextTheme.fs11Normal())),
              ListTile(
                  title: Text("Vibrate", style: AppTextTheme.fs13semibold()),
                  subtitle: Text("Default", style: AppTextTheme.fs11Normal())),
              ListTile(
                  title: Text("Popup notification",
                      style: AppTextTheme.fs13semibold()),
                  subtitle:
                      Text("Not available", style: AppTextTheme.fs11Normal())),
              ListTile(
                  title: Text("Conversation tones",
                      style: AppTextTheme.fs13semibold()),
                  subtitle: Text(
                      "Play sounds for incoming and outgoing messages.",
                      style: AppTextTheme.fs11Normal()),
                  trailing: Switch.adaptive(
                      activeTrackColor: Appcolors.darkgreen,
                      value: grouphighpriorify,
                      onChanged: (value) => setState(() {
                            grouphighpriorify = value;
                          })))
            ])),
      ),
    );
  }
}
