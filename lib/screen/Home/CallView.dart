import 'package:flutter/material.dart';
import 'package:whatsapp/constants/Appcolors.dart';
import 'package:whatsapp/controller/Dummydatacontroller.dart';
import 'package:whatsapp/resources/utils/routes/routename.dart';

class CallView extends StatelessWidget {
  const CallView({super.key});

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
            Icons.phone,
            color: Appcolors.white,
          )),
      body: SingleChildScrollView(
        child: Column(children: [
          ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: DataController.Chatdata.length,
              itemBuilder: (context, index) => ListTile(
                  leading: Image.asset(DataController.Chatdata[index]["image"]),
                  title: Text(DataController.Chatdata[index]["title"]),
                  subtitle: Row(children: [
                    Icon(DataController.Chatdata[index]["call"],
                        size: 18,
                        color: DataController.Chatdata[index]["callcolor"]),
                    Text(DataController.Chatdata[index]["time"])
                  ]),
                  trailing: IconButton(
                      onPressed: () {},
                      icon: Icon(DataController.Chatdata[index]["trallingicon"],
                          color: Appcolors.darkgreen))))
        ]),
      ),
    );
  }
}
