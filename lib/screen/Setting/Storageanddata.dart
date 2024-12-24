import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:whatsapp/Components/Checkboxlisttile.dart';
import 'package:whatsapp/Components/RadioRowfun.dart';
import 'package:whatsapp/constants/Appcolors.dart';
import 'package:whatsapp/constants/TextTheme.dart';
import 'package:whatsapp/resources/utils/routes/routename.dart';

class Storageanddata extends StatefulWidget {
  const Storageanddata({super.key});

  @override
  State<Storageanddata> createState() => _StorageanddataState();
}

class _StorageanddataState extends State<Storageanddata> {
  // ------------RADIO VALUE-----------------
  String radiovalue = "";
  // ------------SWITCH ADATIVE VALUE-----------------
  bool uselessdata = false;
  // ------------CHECKBOX VALUE-----------------
  bool CheckboxValue = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Appcolors.darkgreen,
          foregroundColor: Appcolors.white,
          title: Text("Storage and data"),
        ),
        body: SingleChildScrollView(
            child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ListTile(
                          onTap: () {
                            Get.toNamed( RouteName.Managestorage);
                          },
                          leading: Icon(Icons.folder, color: Appcolors.grey),
                          title: Text("Manage storage",
                              style: AppTextTheme.fs13semibold()),
                          subtitle: Text("3.1 MB",
                              style: AppTextTheme.fs11Normal()
                                  .copyWith(color: Appcolors.grey))),
                      Divider(),
                      ListTile(
                          onTap: () {},
                          leading: Icon(Icons.data_saver_off_rounded,
                              color: Appcolors.grey),
                          title: Text("Network usage",
                              style: AppTextTheme.fs13semibold()),
                          subtitle: Text("6.1 MB sent  69.2 MB received",
                              style: AppTextTheme.fs11Normal()
                                  .copyWith(color: Appcolors.grey))),
                      ListTile(
                          title: Text("Use less data for calls",
                              style: AppTextTheme.fs13semibold()),
                          trailing: Switch.adaptive(
                              activeTrackColor: Appcolors.darkgreen,
                              value: uselessdata,
                              onChanged: (value) => setState(() {
                                    uselessdata = value;
                                  }))),
                      Divider(),
                      Text("Media auto-download",
                          style: AppTextTheme.fs11Normal()
                              .copyWith(color: Appcolors.grey)),
                      Text("Voice messages are always automatically downloaded",
                          style: AppTextTheme.fs11Normal()
                              .copyWith(color: Appcolors.grey)),
                      ListTile(
                          onTap: () {
                            showDialog(
                                context: context,
                                builder: (context) => AlertDialog(
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(2)),
                                    title: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text("When using mobile data",
                                              style: AppTextTheme.fs14Normal()),
                                          Gap(10.h),
                                          CheckBoxListTile(
                                            CheckboxValue: CheckboxValue,
                                            title: "Photos",
                                          ),
                                          CheckBoxListTile(
                                            CheckboxValue: CheckboxValue,
                                            title: "Audio",
                                          ),
                                          CheckBoxListTile(
                                            CheckboxValue: CheckboxValue,
                                            title: "Videos",
                                          ),
                                          CheckBoxListTile(
                                            CheckboxValue: CheckboxValue,
                                            title: "Documents",
                                          ),
                                          Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              children: [
                                                TextButton(
                                                    onPressed: () {
                                                       Get.back();
                                                    },
                                                    child: Text("CANCEL",
                                                        style: AppTextTheme
                                                                .fs13Normal()
                                                            .copyWith(
                                                                color: Appcolors
                                                                    .darkgreen))),
                                                TextButton(
                                                    onPressed: () {},
                                                    child: Text("OK",
                                                        style: AppTextTheme
                                                                .fs13Normal()
                                                            .copyWith(
                                                                color: Appcolors
                                                                    .darkgreen))),
                                              ])
                                        ])));
                          },
                          title: Text("When using mobile data",
                              style: AppTextTheme.fs13semibold()),
                          subtitle: Text("Photos",
                              style: AppTextTheme.fs11Normal()
                                  .copyWith(color: Appcolors.grey))),
                      ListTile(
                          onTap: () {
                            showDialog(
                                context: context,
                                builder: (context) => AlertDialog(
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(2)),
                                    title: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text("When connected on Wi-Fi",
                                              style: AppTextTheme.fs14Normal()),
                                          Gap(10.h),
                                          CheckBoxListTile(
                                            CheckboxValue: CheckboxValue,
                                            title: "Photos",
                                          ),
                                          CheckBoxListTile(
                                            CheckboxValue: CheckboxValue,
                                            title: "Audio",
                                          ),
                                          CheckBoxListTile(
                                            CheckboxValue: CheckboxValue,
                                            title: "Videos",
                                          ),
                                          CheckBoxListTile(
                                            CheckboxValue: CheckboxValue,
                                            title: "Documents",
                                          ),
                                          Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              children: [
                                                TextButton(
                                                    onPressed: () {
                                                      Get.back();
                                                    },
                                                    child: Text("CANCEL",
                                                        style: AppTextTheme
                                                                .fs13Normal()
                                                            .copyWith(
                                                                color: Appcolors
                                                                    .darkgreen))),
                                                TextButton(
                                                    onPressed: () {},
                                                    child: Text("OK",
                                                        style: AppTextTheme
                                                                .fs13Normal()
                                                            .copyWith(
                                                                color: Appcolors
                                                                    .darkgreen))),
                                              ])
                                        ])));
                          },
                          title: Text("When connected on Wi-Fi",
                              style: AppTextTheme.fs13semibold()),
                          subtitle: Text("All media",
                              style: AppTextTheme.fs11Normal()
                                  .copyWith(color: Appcolors.grey))),
                      ListTile(
                          onTap: () {
                            showDialog(
                                context: context,
                                builder: (context) => AlertDialog(
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(2)),
                                    title: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text("When using mobile data",
                                              style: AppTextTheme.fs14Normal()),
                                          Gap(10.h),
                                          CheckBoxListTile(
                                            CheckboxValue: CheckboxValue,
                                            title: "Photos",
                                          ),
                                          CheckBoxListTile(
                                            CheckboxValue: CheckboxValue,
                                            title: "Audio",
                                          ),
                                          CheckBoxListTile(
                                            CheckboxValue: CheckboxValue,
                                            title: "Videos",
                                          ),
                                          CheckBoxListTile(
                                            CheckboxValue: CheckboxValue,
                                            title: "Documents",
                                          ),
                                          Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              children: [
                                                TextButton(
                                                    onPressed: () {
                                                      Get.back();
                                                    },
                                                    child: Text("CANCEL",
                                                        style: AppTextTheme
                                                                .fs13Normal()
                                                            .copyWith(
                                                                color: Appcolors
                                                                    .darkgreen))),
                                                TextButton(
                                                    onPressed: () {},
                                                    child: Text("OK",
                                                        style: AppTextTheme
                                                                .fs13Normal()
                                                            .copyWith(
                                                                color: Appcolors
                                                                    .darkgreen))),
                                              ])
                                        ])));
                          },
                          title: Text("When roaming",
                              style: AppTextTheme.fs13semibold()),
                          subtitle: Text("No media",
                              style: AppTextTheme.fs11Normal()
                                  .copyWith(color: Appcolors.grey))),
                      Divider(),
                      Text("Media upload quality",
                          style: AppTextTheme.fs11Normal()
                              .copyWith(color: Appcolors.grey)),
                      Text("Choose the quality of media files to be sent",
                          style: AppTextTheme.fs11Normal()
                              .copyWith(color: Appcolors.grey)),
                      ListTile(
                          onTap: () {
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return StatefulBuilder(
                                      builder: (context, restate) {
                                    return AlertDialog(
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(2)),
                                        title: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text("Photo upload quality",
                                                  style: AppTextTheme
                                                      .fs14Normal()),
                                              Gap(10.h),
                                              Text(
                                                  "Best quality photos are larger and can take longer to send",
                                                  style:
                                                      AppTextTheme.fs11Normal()
                                                          .copyWith(
                                                              color: Appcolors
                                                                  .grey)),
                                              RadioRow(
                                                  radiovalue: radiovalue,
                                                  tittle: "Auto (recommended)",
                                                  ontap: (v) => restate(
                                                      () => radiovalue = v)),
                                              RadioRow(
                                                  radiovalue: radiovalue,
                                                  tittle: "Best quality",
                                                  ontap: (v) => restate(
                                                      () => radiovalue = v)),
                                              RadioRow(
                                                  radiovalue: radiovalue,
                                                  tittle: "Data saver",
                                                  ontap: (v) => restate(
                                                      () => radiovalue = v)),
                                              Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.end,
                                                  children: [
                                                    TextButton(
                                                        onPressed: () {
                                                           Get.back();
                                                        },
                                                        child: Text("CANCEL",
                                                            style: AppTextTheme
                                                                    .fs13Normal()
                                                                .copyWith(
                                                                    color: Appcolors
                                                                        .darkgreen))),
                                                    TextButton(
                                                        onPressed: () {},
                                                        child: Text("OK",
                                                            style: AppTextTheme
                                                                    .fs13Normal()
                                                                .copyWith(
                                                                    color: Appcolors
                                                                        .darkgreen)))
                                                  ])
                                            ]));
                                  });
                                });
                          },
                          title: Text("Photo upload quality",
                              style: AppTextTheme.fs13semibold()),
                          subtitle: Text("Auto (recommended)",
                              style: AppTextTheme.fs11Normal()
                                  .copyWith(color: Appcolors.grey))),
                    ]))));
  }
}
