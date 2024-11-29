import 'package:flutter/material.dart';
import 'package:whatsapp/constants/Appcolors.dart';
import 'package:whatsapp/constants/TextTheme.dart';

class HelpView extends StatelessWidget {
  const HelpView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Appcolors.darkgreen,
        foregroundColor: Appcolors.white,
        title: Text("Help"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListTile(
              onTap: () {},
              leading: Icon(Icons.help_outline_outlined, color: Appcolors.grey),
              title: Text("Help Centre", style: AppTextTheme.fs13Normal()),
            ),
            ListTile(
                onTap: () {},
                leading: Icon(Icons.people, color: Appcolors.grey),
                title: Text("Contact us", style: AppTextTheme.fs13Normal()),
                subtitle: Text("Questions? Need help?",
                    style: AppTextTheme.fs11Normal()
                        .copyWith(color: Appcolors.grey))),
            ListTile(
              onTap: () {},
              leading: Icon(Icons.file_present_rounded, color: Appcolors.grey),
              title: Text("Terms and Privacy Policy",
                  style: AppTextTheme.fs13Normal()),
            ),
            ListTile(
              onTap: () {},
              leading: Icon(Icons.info_outline, color: Appcolors.grey),
              title: Text("App info", style: AppTextTheme.fs13Normal()),
            ),
          ],
        ),
      ),
    );
  }
}
