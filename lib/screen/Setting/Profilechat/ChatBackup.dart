import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:whatsapp/Components/CommonBtn.dart';
import 'package:whatsapp/constants/Appcolors.dart';
import 'package:whatsapp/constants/TextTheme.dart';

class ChatBackup extends StatefulWidget {
  const ChatBackup({super.key});

  @override
  State<ChatBackup> createState() => _ChatBackupState();
}

class _ChatBackupState extends State<ChatBackup> {
  bool Includevideos = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Appcolors.white,
        backgroundColor: Appcolors.darkgreen,
        title: Text("Chats backup"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              Gap(10.h),
              Row(children: [
                Icon(Icons.cloud_upload, color: Appcolors.grey),
                Gap(8.w),
                Text(
                  "Last Backup",
                  style:
                      AppTextTheme.fs11Normal().copyWith(color: Appcolors.grey),
                )
              ]),
              Gap(5),
              Padding(
                padding: const EdgeInsets.only(left: 28),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Back up your messages and media to Google Drive. You can restore them when you reinstall WhatsApp. Your messages will also back up to your phone’s internal storage.",
                      style: AppTextTheme.fs11Normal()
                          .copyWith(color: Appcolors.grey),
                      textAlign: TextAlign.start,
                    ),
                    Gap(20.h),
                    Text("Local: 2:00 am", style: AppTextTheme.fs11Normal()),
                    Text("Google Drive: Never",
                        style: AppTextTheme.fs11Normal()),
                    Gap(10.h),
                    CommonBtn(title: "BACK UP", onPressed: () {}),
                  ],
                ),
              ),
              Divider(height: 40),
              Row(children: [
                Icon(Icons.cloud_upload, color: Appcolors.grey),
                Gap(8.w),
                Text(
                  "Google Drive settings",
                  style:
                      AppTextTheme.fs11Normal().copyWith(color: Appcolors.grey),
                )
              ]),
              Gap(5),
              Padding(
                padding: const EdgeInsets.only(left: 28),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                        "Messages and media backed up in Google Drive are not protected by WhatsApp end-to-end encryption.",
                        style: AppTextTheme.fs11Normal()
                            .copyWith(color: Appcolors.grey),
                        textAlign: TextAlign.start),
                    ListTile(
                        title: Text("Back up to Google Drive",
                            style: AppTextTheme.fs13semibold()),
                        subtitle:
                            Text("Never", style: AppTextTheme.fs11Normal())),
                    ListTile(
                        title: Text("Google Account",
                            style: AppTextTheme.fs13semibold()),
                        subtitle: Text("None selected",
                            style: AppTextTheme.fs11Normal())),
                    ListTile(
                        title: Text("Back up over",
                            style: AppTextTheme.fs13semibold()),
                        subtitle: Text("Wi-Fi only",
                            style: AppTextTheme.fs11Normal())),
                    ListTile(
                        title: Text("Include videos",
                            style: AppTextTheme.fs13semibold()),
                        trailing: Switch.adaptive(
                            activeTrackColor: Appcolors.darkgreen,
                            value: Includevideos,
                            onChanged: (value) => setState(() {
                                  Includevideos = value;
                                  value = false;
                                })))
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
