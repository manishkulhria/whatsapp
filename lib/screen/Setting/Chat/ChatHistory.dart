import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:whatsapp/Components/Checkboxlisttile.dart';
import 'package:whatsapp/constants/Appcolors.dart';
import 'package:whatsapp/constants/TextTheme.dart';
import 'package:whatsapp/resources/utils/routes/routename.dart';

class ChatHistory extends StatefulWidget {
  const ChatHistory({super.key});

  @override
  State<ChatHistory> createState() => _ChatHistoryState();
}

class _ChatHistoryState extends State<ChatHistory> {
  bool isChecked = false;
  bool isChecked2 = false;
  bool deleteallchat = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Appcolors.darkgreen,
            foregroundColor: Appcolors.white,
            title: Text("Chat history")),
        body: SingleChildScrollView(
            child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Column(children: [
            ListTile(
                onTap: () {
                  Navigator.pushNamed(context, RouteName.ExportChatView);
                },
                leading:
                    Icon(Icons.file_upload_outlined, color: Appcolors.grey),
                title: Text("Export chat", style: AppTextTheme.fs13semibold())),
            ListTile(
                onTap: () {
                  showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(2)),
                          title: Column(children: [
                            Text("Are you sure you want to archive ALL chats?",
                                style: AppTextTheme.fs14Normal()),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: Text("CANCEL",
                                        style: AppTextTheme.fs13Normal()
                                            .copyWith(
                                                color: Appcolors.darkgreen))),
                                TextButton(
                                    onPressed: () {},
                                    child: Text("OK",
                                        style: AppTextTheme.fs13Normal()
                                            .copyWith(
                                                color: Appcolors.darkgreen))),
                              ],
                            )
                          ])));
                },
                leading: Icon(Icons.archive, color: Appcolors.grey),
                title: Text("Archive all chats",
                    style: AppTextTheme.fs13semibold())),
            ListTile(
                onTap: () {
                  showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(2)),
                          title: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Clear messages in chats?",
                                    style: AppTextTheme.fs14Normal()),
                                Gap(10.h),
                                Text(
                                    "Messages in all chats will disappear forever.",
                                    style: AppTextTheme.fs10Normal()
                                        .copyWith(color: Appcolors.grey)),
                                StatefulBuilder(
                                  builder: (context, restate) {
                                    return CheckboxListTile(
                                      activeColor: Appcolors.darkgreen,
                                      controlAffinity:
                                          ListTileControlAffinity.leading,
                                      title: Text("Delete media in chats",
                                          style: AppTextTheme.fs11Normal()
                                              .copyWith(color: Appcolors.grey)),
                                      value: isChecked2,
                                      onChanged: (value) => restate(() {
                                        isChecked2 = !isChecked2;
                                      }),
                                    );
                                  },
                                ),
                                StatefulBuilder(
                                  builder: (context, restate) {
                                    return CheckboxListTile(
                                      activeColor: Appcolors.darkgreen,
                                      controlAffinity:
                                          ListTileControlAffinity.leading,
                                      title: Text("Delete starred message",
                                          style: AppTextTheme.fs11Normal()
                                              .copyWith(color: Appcolors.grey)),
                                      value: isChecked2,
                                      onChanged: (value) => restate(() {
                                        isChecked2 = !isChecked2;
                                      }),
                                    );
                                  },
                                ),
                                Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      TextButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          child: Text("CANCEL",
                                              style: AppTextTheme.fs13Normal()
                                                  .copyWith(
                                                      color: Appcolors
                                                          .darkgreen))),
                                      TextButton(
                                          onPressed: () {},
                                          child: Text("CLEAR MESSAGES",
                                              style: AppTextTheme.fs13Normal()
                                                  .copyWith(
                                                      color: Appcolors
                                                          .darkgreen))),
                                    ])
                              ])));
                },
                leading: Icon(Icons.remove_circle_outline_sharp,
                    color: Appcolors.grey),
                title: Text("Clear all chats",
                    style: AppTextTheme.fs13semibold())),
            ListTile(
                onTap: () {
                  showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(2)),
                          title: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                    "Are you sure you want to delete ALL chats and their messages?",
                                    style: AppTextTheme.fs13Normal()),
                               CheckBoxListTile(
                                            CheckboxValue: deleteallchat,
                                            title: "Photos",
                                          ),
                                Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      TextButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          child: Text("CANCEL",
                                              style: AppTextTheme.fs13Normal()
                                                  .copyWith(
                                                      color: Appcolors
                                                          .darkgreen))),
                                      TextButton(
                                          onPressed: () {},
                                          child: Text("DELETE",
                                              style: AppTextTheme.fs13Normal()
                                                  .copyWith(
                                                      color: Appcolors
                                                          .darkgreen))),
                                    ])
                              ])));
                },
                leading: Icon(Icons.delete, color: Appcolors.grey),
                title: Text("Delete all chats",
                    style: AppTextTheme.fs13semibold())),
          ]),
        )));
  }
}
