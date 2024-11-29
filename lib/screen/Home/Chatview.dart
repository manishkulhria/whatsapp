import 'package:flutter/material.dart';
import 'package:whatsapp/constants/Appcolors.dart';
import 'package:whatsapp/constants/TextTheme.dart';
import 'package:whatsapp/controller/Dummydatacontroller.dart';
import 'package:whatsapp/resources/utils/routes/routename.dart';

class ChatView extends StatelessWidget {
  const ChatView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
          backgroundColor: Appcolors.darkgreen,
          onPressed: () {
            Navigator.pushNamed(context, RouteName.Selectcontact);
          },
          child: Icon(
            Icons.comment,
            color: Appcolors.white,
          )),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: DataController.Chatdata.length,
              itemBuilder: (context, index) => ListTile(
                onTap: () {
                  Navigator.pushNamed(context, RouteName.MessageView);
                },
                leading: Image.asset(DataController.Chatdata[index]["image"]),
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      DataController.Chatdata[index]["title"],
                      style: AppTextTheme.fs13Normal(),
                    ),
                    Text(
                      "5:27 am",
                      style: AppTextTheme.fs12Normal()
                          .copyWith(color: Appcolors.Lightgreen),
                    )
                  ],
                ),
                subtitle: Text(
                  DataController.Chatdata[index]["subtitle"],
                  style:
                      AppTextTheme.fs12Normal().copyWith(color: Appcolors.grey),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
