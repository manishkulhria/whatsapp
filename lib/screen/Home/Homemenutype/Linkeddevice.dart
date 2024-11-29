import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:whatsapp/Components/CommonBtn.dart';
import 'package:whatsapp/constants/Appcolors.dart';
import 'package:whatsapp/constants/TextTheme.dart';
import 'package:whatsapp/constants/icon_image.dart';

class Linkeddevicesview extends StatelessWidget {
  const Linkeddevicesview({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Appcolors.white,
        backgroundColor: Appcolors.darkgreen,
        title: Text("Linked devices"),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(AppImage.Linkeddevice),
            Text(
              "Use WhatsAPP on other devices",
              style: AppTextTheme.fs32Normal(),
              textAlign: TextAlign.center,
            ),
            Padding(
              padding: const EdgeInsets.all(12),
              child: CommonBtn(
                textcol: Appcolors.white,
                title: "LINK A DEVICE",
                onPressed: () {},
              ),
            ),
            Divider(
              thickness: 5,
            ),
            Gap(8),
            ListTile(
              leading: Icon(
                Icons.accessibility_new_sharp,
                size: 30,
                color: Appcolors.darkgreen,
              ),
              title: Text(
                "Multi-device beta",
                style: AppTextTheme.fs12Normal(),
              ),
              subtitle: Text(
                "Use up to 4 devices without keeping your phone online. Tap to learn more.",
                style: AppTextTheme.fs10Normal(),
              ),
            )
          ],
        ),
      ),
    );
  }
}
