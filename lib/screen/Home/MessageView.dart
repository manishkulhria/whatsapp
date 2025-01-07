import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:whatsapp/Components/Messagecard.dart';
import 'package:whatsapp/backend/Apis/Apis.dart';
import 'package:whatsapp/backend/Firebaseresponse/Firebaseresponse.dart';
import 'package:whatsapp/constants/Appcolors.dart';
import 'package:whatsapp/constants/TextTheme.dart';
import 'package:whatsapp/controller/authcontroller.dart';
import 'package:whatsapp/helpers/datautil.dart';
import 'package:whatsapp/model/Callmodel/callcontroller.dart';
import 'package:whatsapp/model/Callmodel/callmodel.dart';
import 'package:whatsapp/model/authmodel.dart';
import 'package:whatsapp/model/messagemodel.dart';
import 'package:whatsapp/screen/Home/chat/callallpage/callpage.dart';
import 'package:whatsapp/screen/Home/chat/callallpage/videocall.dart';

// ignore: must_be_immutable
class MessageView extends StatefulWidget {
  Usermodel model;
  MessageView({super.key, required this.model});

  State<MessageView> createState() => _MessageViewState();
}

class _MessageViewState extends State<MessageView> {
  // --Allbool value value--
  bool isupload = false;
  bool _emoji = false;
  bool radiovalue = false;
  bool isChecked = false;

  // --
  bool taptext = false;

  // radio--
  var radiobtn;
  // imagegile---
  File? imagefile;
  // --all data list--
  List<Message> _list = [];
  // --focusnod--
  final FocusNode _focusNode = FocusNode();
  final _msgcontroller = TextEditingController();

  List<dynamic> showDialogdata = ["8 hours", "1 week", "Always"];

  @override
  Widget build(BuildContext context) {
    final callcontroller = Get.put(Callcontroller());
    final _controller = Get.find<UserController>();

    return GestureDetector(
        onTap: FocusScope.of(context).unfocus,
        // ignore: deprecated_member_use
        child: WillPopScope(
            onWillPop: () {
              if (_emoji) {
                setState(() => _emoji = !_emoji);
                return Future.value(false);
              } else {
                return Future.value(true);
              }
            },
            child: Scaffold(
                appBar: taptext == false
                    ? AppBar(
                        leading: GestureDetector(
                            onTap: () {
                              Get.back();
                            },
                            child: Icon(Icons.arrow_back_sharp)),
                        titleSpacing: 1,
                        foregroundColor: Appcolors.white,
                        backgroundColor: Appcolors.darkgreen,
                        title: StreamBuilder(
                            stream: Apis.getuserinfo(widget.model),
                            builder: (context, snapshot) {
                              final data = snapshot.data?.docs;
                              final list = data
                                      ?.map((e) => Usermodel.fromJson(
                                          FirebaseResponseModel.fromResponse(
                                              e)))
                                      .toList() ??
                                  [];

                              return Row(children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(100),
                                  child: CachedNetworkImage(
                                    fit: BoxFit.cover,
                                    height: 42,
                                    width: 42,
                                    progressIndicatorBuilder: (context, url,
                                            downloadProgress) =>
                                        CircularProgressIndicator(
                                            color: Appcolors.Red,
                                            value: downloadProgress.progress),
                                    errorWidget: (context, url, error) =>
                                        Icon(Icons.error),
                                    imageUrl: list.isNotEmpty
                                        ? list[0].image.toString()
                                        : widget.model.image.toString(),
                                  ),
                                ),
                                Gap(10),
                                Expanded(
                                  child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          child: Text(
                                            list.isNotEmpty
                                                ? list[0].name.toString()
                                                : widget.model.name.toString(),
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            style: AppTextTheme.fs16Bold()
                                                .copyWith(
                                                    color: Appcolors.white),
                                          ),
                                        ),
                                        Gap(5),
                                        Text(
                                            list.isNotEmpty
                                                ? (list[0].isonline == true
                                                    ? "online"
                                                    : Dateutil.setstatus(
                                                        context: context,
                                                        lastactive: widget
                                                            .model.lastActive
                                                            .toString()))
                                                : Dateutil.setstatus(
                                                    context: context,
                                                    lastactive: widget
                                                        .model.lastActive
                                                        .toString()),
                                            style: AppTextTheme.fs10Normal()
                                                .copyWith(
                                                    color: Appcolors.white))
                                      ]),
                                )
                              ]);
                            }),
                        actions: [
                            IconButton(
                                onPressed: () {
                                  showDialog(
                                      context: context,
                                      builder: (context) => AlertDialog(
                                          backgroundColor: Appcolors.white,
                                          shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.zero),
                                          title: Text("Start video call?",
                                              style: AppTextTheme.fs13Normal()),
                                          content: Row(
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
                                                                    .Lightgreen))),
                                                TextButton(
                                                    onPressed: () {
                                                      Get.back();
                                                      Get.to(Videocall(
                                                          target:
                                                              widget.model));
                                                      callcontroller.callactive(
                                                          widget.model,
                                                          _controller.user,
                                                          calltype.VIDEO);
                                                    },
                                                    child: Text("Video CALL",
                                                        style: AppTextTheme
                                                                .fs13Normal()
                                                            .copyWith(
                                                                color: Appcolors
                                                                    .Lightgreen)))
                                              ])));
                                },
                                icon: Icon(Icons.videocam)),
                            IconButton(
                                onPressed: () {
                                  showDialog(
                                      context: context,
                                      builder: (context) => AlertDialog(
                                          backgroundColor: Appcolors.white,
                                          shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.zero),
                                          title: Text("Start vido call?",
                                              style: AppTextTheme.fs13Normal()),
                                          content: Row(
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
                                                                    .Lightgreen))),
                                                TextButton(
                                                    onPressed: () {
                                                      Get.back();
                                                      Get.to(Callpage(
                                                          target:
                                                              widget.model));
                                                      callcontroller.callactive(
                                                          widget.model,
                                                          _controller.user,
                                                          calltype.AUDIO);
                                                    },
                                                    child: Text("Audio CALL",
                                                        style: AppTextTheme
                                                                .fs13Normal()
                                                            .copyWith(
                                                                color: Appcolors
                                                                    .Lightgreen)))
                                              ])));
                                },
                                icon: Icon(Icons.phone)),
                            PopupMenuButton(
                                icon: Icon(Icons.more_vert_rounded),
                                itemBuilder: (context) => [
                                      PopupMenuItem(
                                          child: Text("View contact")),
                                      PopupMenuItem(
                                          child:
                                              Text("Media, links, and docs")),
                                      PopupMenuItem(child: Text("Search")),
                                      PopupMenuItem(
                                          onTap: () {
                                            showDialog(
                                                context: context,
                                                builder:
                                                    (context) => AlertDialog(
                                                          shape: RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          0)),
                                                          title: Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Text(
                                                                "Mute notifications for...",
                                                                style: AppTextTheme
                                                                    .fs18Normal(),
                                                              ),
                                                              ListView.builder(
                                                                shrinkWrap:
                                                                    true,
                                                                itemCount:
                                                                    showDialogdata
                                                                        .length,
                                                                itemBuilder:
                                                                    (context,
                                                                            index) =>
                                                                        Row(
                                                                  children: [
                                                                    StatefulBuilder(
                                                                      builder:
                                                                          (context,
                                                                              setState) {
                                                                        return Radio
                                                                            .adaptive(
                                                                          value:
                                                                              showDialogdata,
                                                                          groupValue:
                                                                              radiobtn,
                                                                          onChanged: (v) =>
                                                                              setState(() {
                                                                            radiobtn =
                                                                                v;
                                                                            radiovalue =
                                                                                false;
                                                                          }),
                                                                        );
                                                                      },
                                                                    ),
                                                                    Text(
                                                                      showDialogdata[
                                                                          index],
                                                                      style: AppTextTheme
                                                                          .fs14Normal(),
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
                                                                    builder:
                                                                        (context,
                                                                            setState) {
                                                                      return Checkbox
                                                                          .adaptive(
                                                                        value:
                                                                            isChecked,
                                                                        onChanged:
                                                                            (value) =>
                                                                                setState(() {
                                                                          value =
                                                                              isChecked;
                                                                        }),
                                                                      );
                                                                    },
                                                                  ),
                                                                  Text(
                                                                    "Show notifications",
                                                                    style: AppTextTheme
                                                                        .fs13Normal(),
                                                                  )
                                                                ],
                                                              ),
                                                              Row(
                                                                children: [
                                                                  TextButton(
                                                                      onPressed:
                                                                          () {
                                                                        Get.back();
                                                                      },
                                                                      child: Text(
                                                                          "CANCEL")),
                                                                  TextButton(
                                                                      onPressed:
                                                                          () {},
                                                                      child: Text(
                                                                          "OK")),
                                                                ],
                                                              )
                                                            ],
                                                          ),
                                                        ));
                                          },
                                          child: Text("Mute notifications")),
                                      PopupMenuItem(child: Text("Wallpaper")),
                                      PopupMenuItem(child: Text("More"))
                                    ])
                          ])
                    : AppBar(title: Text("1"), actions: [
                        IconButton(
                            onPressed: () {}, icon: Icon(Icons.turn_left)),
                        IconButton(
                            onPressed: () {}, icon: Icon(Icons.star_border)),
                        IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.delete_forever_outlined)),
                        IconButton(
                            onPressed: () {}, icon: Icon(Icons.turn_right)),
                        PopupMenuButton(
                            enabled: true,
                            itemBuilder: (context) => [
                                  PopupMenuItem(
                                      onTap: () {},
                                      child: Text("Info",
                                          style: AppTextTheme.fs13Normal())),
                                  PopupMenuItem(
                                      onTap: () {},
                                      child: Text("Copy",
                                          style: AppTextTheme.fs13Normal())),
                                  PopupMenuItem(
                                      onTap: () {},
                                      child: Text("Pin",
                                          style: AppTextTheme.fs13Normal()))
                                ])
                      ]),
                body: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                              child: StreamBuilder(
                                  stream: Apis.getAllMessages(widget.model),
                                  builder: (context, snapshot) {
                                    if (snapshot.connectionState ==
                                        ConnectionState.waiting) {
                                      return SizedBox();
                                    } else if (snapshot.connectionState ==
                                            ConnectionState.active ||
                                        snapshot.connectionState ==
                                            ConnectionState.done) {
                                      if (snapshot.hasData) {
                                        final data = snapshot.data?.docs;
                                        if (data != null && data.isNotEmpty) {
                                          _list = data.map((e) {
                                            return Message.fromjson(
                                                FirebaseResponseModel
                                                    .fromResponse(e));
                                          }).toList();
                                          return ListView.builder(
                                            reverse: true,
                                            physics: BouncingScrollPhysics(),
                                            shrinkWrap: true,
                                            itemCount: _list.length,
                                            itemBuilder: (context, index) {
                                              return Messagecard(
                                                  message: _list[index]);
                                            },
                                          );
                                        } else {
                                          return Center(
                                              child: Text("No messages yet."));
                                        }
                                      } else {
                                        return Center(
                                            child: Text(
                                                "Failed to load messages."));
                                      }
                                    } else {
                                      return Center(
                                          child: Text("Something went wrong"));
                                    }
                                  })),
                          if (isupload)
                            Align(
                                alignment: Alignment.centerRight,
                                child: Padding(
                                    padding: const EdgeInsets.only(
                                        right: 6, top: 10, bottom: 10),
                                    child: CircularProgressIndicator(
                                        color: Appcolors.darkgreen,
                                        strokeWidth: 2))),
                          SizedBox(
                              width: MediaQuery.of(context).size.width,
                              child: Row(children: [
                                Expanded(
                                    child: Container(
                                        decoration: BoxDecoration(
                                          border:
                                              Border.all(color: Appcolors.grey),
                                          borderRadius:
                                              BorderRadius.circular(20),
                                        ),
                                        child: Row(children: [
                                          IconButton(
                                              onPressed: () {
                                                FocusScope.of(context)
                                                    .unfocus();
                                                setState(() {
                                                  _emoji = !_emoji;
                                                });
                                              },
                                              icon: Icon(
                                                Icons.emoji_emotions,
                                                color: Appcolors.grey,
                                              )),
                                          Expanded(
                                            child: TextField(
                                                onTap: () {
                                                  if (_emoji)
                                                    setState(
                                                        () => _emoji = !_emoji);
                                                },
                                                controller: _msgcontroller,
                                                focusNode: _focusNode,
                                                decoration: InputDecoration(
                                                    border: OutlineInputBorder(
                                                        borderSide:
                                                            BorderSide.none),
                                                    hintText: "Message")),
                                          ),
                                          IconButton(
                                              onPressed: () {},
                                              icon: Icon(
                                                Icons.link,
                                                color: Appcolors.grey,
                                              )),
                                          IconButton(
                                              onPressed: () async {
                                                final ImagePicker picker =
                                                    ImagePicker();
                                                final XFile? img =
                                                    await picker.pickImage(
                                                        source:
                                                            ImageSource.gallery,
                                                        imageQuality: 80);
                                                if (img != null) {
                                                  setState(
                                                      () => isChecked = true);
                                                  await Apis.sendchatimg(
                                                      widget.model,
                                                      File(img.path));
                                                  setState(
                                                      () => isChecked = false);
                                                }
                                              },
                                              icon: Icon(Icons.image,
                                                  color: Appcolors.grey)),
                                          IconButton(
                                              onPressed: () async {
                                                final ImagePicker picker =
                                                    ImagePicker();
                                                final XFile? img =
                                                    await picker.pickImage(
                                                        source:
                                                            ImageSource.camera,
                                                        imageQuality: 80);
                                                if (img != null) {
                                                  setState(
                                                      () => isChecked = true);
                                                  await Apis.sendchatimg(
                                                      widget.model,
                                                      File(img.path));
                                                  setState(
                                                      () => isChecked = false);
                                                }
                                              },
                                              icon: Icon(Icons.camera_alt,
                                                  color: Appcolors.grey))
                                        ]))),
                                Gap(5),
                                IconButton(
                                    style: TextButton.styleFrom(
                                        backgroundColor: Appcolors.darkgreen),
                                    onPressed: () {
                                      if (_msgcontroller.text.isNotEmpty) {
                                        Apis.sendMessage(
                                            widget.model,
                                            _msgcontroller.text.trim(),
                                            MessageType.Text);
                                        _msgcontroller.clear();
                                      }
                                    },
                                    icon: Icon(Icons.send,
                                        color: Appcolors.white, size: 35))
                              ])),
                          Gap(7),
                          if (_emoji)
                            SizedBox(
                                width: MediaQuery.of(context).size.width,
                                child: EmojiPicker(
                                    textEditingController: _msgcontroller,
                                    config: Config(
                                        height: 290,
                                        checkPlatformCompatibility: true)))
                        ])))));
  }
}
