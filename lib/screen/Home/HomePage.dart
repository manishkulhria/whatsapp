import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:whatsapp/Components/dialog.dart';
import 'package:whatsapp/backend/Apis/Apis.dart';
import 'package:whatsapp/constants/Appcolors.dart';
import 'package:whatsapp/constants/TextTheme.dart';
import 'package:whatsapp/controller/authcontroller.dart';
import 'package:whatsapp/model/Callmodel/callcontroller.dart';
import 'package:whatsapp/screen/Home/chat/Chatview.dart';
import 'package:whatsapp/screen/Home/CallView.dart';
import 'package:whatsapp/screen/Home/StatusView.dart';
import 'package:whatsapp/resources/utils/routes/routename.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  final controller = Get.put(Callcontroller());

  int tabbarindex = 0;
  late TabController tabController =
      TabController(length: 3, vsync: this, initialIndex: tabbarindex);

  @override
  void initState() {
    super.initState();
    SystemChannels.lifecycle.setMessageHandler((message) {
      print('Message: $message');

      if (Apis.auth.currentUser != null) {
        if (message.toString().contains('resume')) {
          Apis.setstatus(true);
        }
        if (message.toString().contains('pause')) {
          Apis.setstatus(false);
        }
      }

      return Future.value(message);
    });

    tabController.addListener(() {
      // Update tab index when the tab changes
      if (tabController.index != tabbarindex) {
        setState(() {
          tabbarindex = tabController.index;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // ignore: deprecated_member_use
    return WillPopScope(
        onWillPop: () async {
          if (tabbarindex != 0) {
            setState(() {
              tabbarindex = 0;
            });
          } else {
            Get.dialog(EixtAppDailog(), barrierDismissible: false);
          }
          return false;
        },
        child: Scaffold(
            appBar: AppBar(
                foregroundColor: Appcolors.white,
                backgroundColor: Appcolors.darkgreen,
                automaticallyImplyLeading: false,
                title: Text("WhatsApp"),
                actions: [
                  IconButton(
                      onPressed: () {
                        Get.toNamed(RouteName.SearchView);
                      },
                      icon: Icon(Icons.search)),
                  _getPopupMenuButton()
                ],
                bottom: TabBar(
                    indicatorColor: Appcolors.white,
                    controller: tabController,
                    labelColor: Appcolors.white,
                    unselectedLabelColor: Appcolors.white,
                    // ignore: deprecated_member_use
                    overlayColor: MaterialStatePropertyAll(Appcolors.darkgreen),
                    tabs: [
                      Tab(child: Text("CHATS")),
                      Tab(child: Text("STATUS•")),
                      Tab(child: Text("CALLS"))
                    ])),
            body: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: TabBarView(
                    controller: tabController,
                    children: [ChatView(), StatusView(), CallView()]))));
  }

  // Method to get the correct PopupMenuButton based on the selected tab
  Widget _getPopupMenuButton() {
    if (tabbarindex == 0) {
      return PopupMenuButton(
        enabled: true,
        itemBuilder: (context) => [
          PopupMenuItem(
              onTap: () {},
              child: Text("New group", style: AppTextTheme.fs13Normal())),
          PopupMenuItem(
              onTap: () {},
              child: Text("New broadcast", style: AppTextTheme.fs13Normal())),
          PopupMenuItem(
              onTap: () {
                Get.toNamed(RouteName.LinkeddeviceView);
              },
              child: Text("Linked devices", style: AppTextTheme.fs13Normal())),
          PopupMenuItem(
              onTap: () {
                Get.toNamed(RouteName.StarrehView);
              },
              child:
                  Text("Starred messages", style: AppTextTheme.fs13Normal())),
          PopupMenuItem(
              onTap: () {
                Get.toNamed(RouteName.PaymentView);
              },
              child: Text("Payments", style: AppTextTheme.fs13Normal())),
          PopupMenuItem(
              onTap: () {
                Get.toNamed(RouteName.SettingView);
              },
              child: Text("Settings", style: AppTextTheme.fs13Normal()))
        ],
      );
    } else if (tabbarindex == 1) {
      return PopupMenuButton(
        enabled: true,
        itemBuilder: (context) => [
          PopupMenuItem(
              onTap: () {},
              child: Text("Create channel", style: AppTextTheme.fs13Normal())),
          PopupMenuItem(
              onTap: () {},
              child: Text("Status privacy", style: AppTextTheme.fs13Normal())),
          PopupMenuItem(
              onTap: () {
                Get.toNamed(RouteName.SettingView);
              },
              child: Text("Settings", style: AppTextTheme.fs13Normal()))
        ],
      );
    } else {
      return PopupMenuButton(
        enabled: true,
        itemBuilder: (context) => [
          PopupMenuItem(
              onTap: () {},
              child: Text("Clear call log", style: AppTextTheme.fs13Normal())),
          PopupMenuItem(
              onTap: () {
                Get.toNamed(RouteName.SettingView);
              },
              child: Text("Settings", style: AppTextTheme.fs13Normal()))
        ],
      );
    }
  }
}
