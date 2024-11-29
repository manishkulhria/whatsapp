import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:whatsapp/constants/Appcolors.dart';
import 'package:whatsapp/constants/TextTheme.dart';
import 'package:whatsapp/constants/icon_image.dart';

class MessageView extends StatefulWidget {
  const MessageView({super.key});

  @override
  State<MessageView> createState() => _MessageViewState();
}

class _MessageViewState extends State<MessageView> {
  List<dynamic> showDialogdata = ["8 hours", "1 week", "Always"];
  bool value = false;
  bool isChecked = false;
  var radiobtn;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 1,
        foregroundColor: Appcolors.white,
        backgroundColor: Appcolors.darkgreen,
        title: ListTile(
          leading: Image.asset(AppImage.aron),
          title: Text(
            "Abelson",
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: AppTextTheme.fs14Normal().copyWith(color: Appcolors.white),
          ),
          subtitle: Text(
            "online",
            style: AppTextTheme.fs12Normal().copyWith(color: Appcolors.white),
          ),
        ),
        actions: [
          IconButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    backgroundColor: Appcolors.white,
                    shape:
                        RoundedRectangleBorder(borderRadius: BorderRadius.zero),
                    title: Text(
                      "Start video call?",
                      style: AppTextTheme.fs13Normal(),
                    ),
                    content: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text("CANCEL",
                                style: AppTextTheme.fs13Normal()
                                    .copyWith(color: Appcolors.Lightgreen))),
                        TextButton(
                            onPressed: () {},
                            child: Text("CALL",
                                style: AppTextTheme.fs13Normal()
                                    .copyWith(color: Appcolors.Lightgreen))),
                      ],
                    ),
                  ),
                );
              },
              icon: Icon(Icons.videocam)),
          IconButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    backgroundColor: Appcolors.white,
                    shape:
                        RoundedRectangleBorder(borderRadius: BorderRadius.zero),
                    title: Text(
                      "Start voice call?",
                      style: AppTextTheme.fs13Normal(),
                    ),
                    content: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text("CANCEL",
                                style: AppTextTheme.fs13Normal()
                                    .copyWith(color: Appcolors.Lightgreen))),
                        TextButton(
                            onPressed: () {},
                            child: Text("CALL",
                                style: AppTextTheme.fs13Normal()
                                    .copyWith(color: Appcolors.Lightgreen))),
                      ],
                    ),
                  ),
                );
              },
              icon: Icon(Icons.phone)),
          PopupMenuButton(
            icon: Icon(Icons.more_vert_rounded),
            itemBuilder: (context) => [
              PopupMenuItem(child: Text("View contact")),
              PopupMenuItem(child: Text("Media, links, and docs")),
              PopupMenuItem(child: Text("Search")),
              PopupMenuItem(
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(0)),
                              title: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Mute notifications for...",
                                    style: AppTextTheme.fs18Normal(),
                                  ),
                                  ListView.builder(
                                    shrinkWrap: true,
                                    itemCount: showDialogdata.length,
                                    itemBuilder: (context, index) => Row(
                                      children: [
                                        StatefulBuilder(
                                          builder: (context, setState) {
                                            return Radio.adaptive(
                                              value: showDialogdata,
                                              groupValue: radiobtn,
                                              onChanged: (v) => setState(() {
                                                radiobtn = v;
                                                value = false;
                                              }),
                                            );
                                          },
                                        ),
                                        Text(
                                          showDialogdata[index],
                                          style: AppTextTheme.fs14Normal(),
                                        )
                                      ],
                                    ),
                                  ),
                                  Divider(
                                    height: 10,
                                  ),
                                  Row(
                                    children: [
                                      StatefulBuilder(
                                        builder: (context, setState) {
                                          return Checkbox.adaptive(
                                            value: isChecked,
                                            onChanged: (value) => setState(() {
                                              value = isChecked;
                                            }),
                                          );
                                        },
                                      ),
                                      Text(
                                        "Show notifications",
                                        style: AppTextTheme.fs13Normal(),
                                      )
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      TextButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          child: Text("CANCEL")),
                                      TextButton(
                                          onPressed: () {}, child: Text("OK")),
                                    ],
                                  )
                                ],
                              ),
                            ));
                  },
                  child: Text("Mute notifications")),
              PopupMenuItem(child: Text("Wallpaper")),
              PopupMenuItem(child: Text("More")),
            ],
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [],
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Appcolors.grey),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Row(children: [
                          IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.emoji_emotions,
                                color: Appcolors.grey,
                              )),
                            
                          Expanded(
                            child: TextField(
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                        borderSide: BorderSide.none),
                                    hintText: "Message")),
                          ),
                          IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.link,
                                color: Appcolors.grey,
                              )),
                          IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.payment,
                                color: Appcolors.grey,
                              )),
                          IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.camera_alt,
                                color: Appcolors.grey,
                              )),
                        ])),
                  ),
                  Gap(5),
                  IconButton(
                      style: TextButton.styleFrom(
                          backgroundColor: Appcolors.darkgreen),
                      onPressed: () {},
                      icon: Icon(
                        Icons.mic,
                        color: Appcolors.white,
                        size: 35,
                      ))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
